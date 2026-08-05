#!/usr/bin/env bash
# Pre-push checks for AI Build Governance.
# Runnable locally and in CI. Exits non-zero on any failure.
#
#   ./tools/check.sh
#
# Every check here exists because the corresponding mistake was actually
# made in this repository at some point. See CHANGELOG.md.

set -uo pipefail
cd "$(dirname "$0")/.." || exit 1

fail=0
note() { printf '\n== %s\n' "$1"; }
bad() { printf 'FAIL: %s\n' "$1"; fail=1; }

# ---------------------------------------------------------------------------
note "1. Broken internal links"
# A chapter that links to a renamed file is worse than one that omits the
# link, because the reader assumes the target exists.
missing=0
while IFS= read -r f; do
  d=$(dirname "$f")
  grep -oE '\]\((\.\./)?[a-zA-Z0-9._/-]+\.md' "$f" 2>/dev/null \
    | sed 's/^](//' | sort -u | while IFS= read -r l; do
        [ -f "$d/$l" ] || printf '  %s -> %s\n' "$f" "$l"
      done
done < <(find . -name '*.md' -not -path './.git/*') > /tmp/abc_links.txt
if [ -s /tmp/abc_links.txt ]; then cat /tmp/abc_links.txt; bad "broken internal links"; else echo "  ok"; fi

# ---------------------------------------------------------------------------
note "2. Em dashes"
# Standing style rule. The only permitted occurrence is inside this script's
# own detection pattern, so the repo check excludes tools/.
if grep -rn '—' --include='*.md' . 2>/dev/null | grep -v '^\./\.git/'; then
  bad "em dashes present (use commas, colons, periods, or restructure)"
else
  echo "  ok"
fi

# ---------------------------------------------------------------------------
note "3. Institution-specific detail in the public model"
# This repo is a vendor-neutral and institution-neutral model code. Any
# single institution's hostnames, accounts, groups, or staff belong in that
# institution's own amendments document, never here.
# Genuine internal markers only. Public university websites are legitimate
# citations, and SOURCES.md must be able to name a URL that returned 404.
if grep -rniE 'kfs account|netid|cucloud|lcmain|aaii\.|n8n-dev|CIT-ai-program|qualtrics|mjs472|psw58' \
     --include='*.md' . 2>/dev/null \
   | grep -v '^\./\.git/' \
   | grep -v '^\./tools/'; then
  bad "institution-specific internal detail found"
else
  echo "  ok"
fi

# ---------------------------------------------------------------------------
note "4. Claims that overstate documentation support"
# Each pattern here is a specific error a verification pass caught. If a
# claim asserts a vendor's docs "state" something, the docs must say it.
overstated=0
check_absent() {
  if grep -rn "$1" --include='*.md' . 2>/dev/null | grep -v '^\./\.git/' | grep -v '^\./tools/'; then
    bad "overstated claim: $2"; overstated=1
  fi
}
check_absent 'documentation states that budget enforcement' 'tag-budget equivalence was never documented'
check_absent '^\*\*M-24-10 is superseded\.\*\*' 'M-24-10 supersession is unverified'
check_absent 'guardrails do not apply to the Responses API' 'limitation attaches to the unified path only'
[ "$overstated" -eq 0 ] && echo "  ok"

# ---------------------------------------------------------------------------
note "5. Unverified labels still present"
# These labels are the document's main defense against overclaiming. If the
# count drops to zero, someone has been "tidying" and that is a regression.
count=$(grep -ro 'UNVERIFIED' --include='*.md' . 2>/dev/null | grep -v '^\./\.git/' | wc -l | tr -d ' ')
echo "  UNVERIFIED labels: $count"
if [ "$count" -lt 10 ]; then
  bad "expected at least 10 UNVERIFIED labels, found $count (were they removed?)"
fi

# ---------------------------------------------------------------------------
note "6. Every file is reachable"
# index.md files are Jekyll section landing pages, reached by directory link
# (model/, guide/) rather than by filename, so they are exempt.
for f in model/*.md guide/*.md; do
  base=$(basename "$f")
  [ "$base" = "index.md" ] && continue
  grep -q "$base" README.md index.md || bad "not linked from README or index: $f"
done
for f in templates/*.md reference/*.md reference/platform-profiles/*.md; do
  base=$(basename "$f")
  [ "$base" = "index.md" ] && continue
  grep -rq "$base" README.md index.md model/ guide/ reference/ templates/ 2>/dev/null \
    || bad "orphaned file, nothing links to it: $f"
done
echo "  checked $(ls model/*.md | wc -l | tr -d ' ') model chapters, $(ls guide/*.md | wc -l | tr -d ' ') guide, $(ls reference/*.md reference/platform-profiles/*.md | wc -l | tr -d ' ') reference, $(ls templates/*.md | wc -l | tr -d ' ') templates"

# ---------------------------------------------------------------------------
note "7. Vendor specifics kept out of the model"
# The model states platform-neutral requirements. Product names and config keys
# belong in reference/platform-profiles/. A bare mention in prose is fine;
# a config key or version number is not.
if grep -rnE 'global_disable_no_log_param|x-litellm-tags|EXECUTIONS_DATA_|upperbound_key_generate_params|LITELLM_KEY_ROTATION|/key/\{key\}/regenerate' \
     model/*.md 2>/dev/null | grep -v '^model/00-conventions.md'; then
  bad "vendor config detail in the model: move it to reference/platform-profiles/"
else
  echo "  ok"
fi

# ---------------------------------------------------------------------------
note "8. Statement labels present in the model"
labels=$(grep -rohE '\*\*(REQUIREMENT|GUIDANCE|EXAMPLE|LOCAL AMENDMENT REQUIRED|DESIGN JUDGMENT|VERIFICATION NOTE)\*\*' model/*.md 2>/dev/null | wc -l | tr -d ' ')
echo "  labelled statements in the model: $labels"
if [ "$labels" -lt 5 ]; then
  bad "expected labelled statements in the model (see model/00-conventions.md)"
fi

# ---------------------------------------------------------------------------
note "9. Construction jargon left unpaired"
# Plain AI-governance language is primary. Construction terms are allowed in
# reference/ (where the analogy is explained) and in the glossary, and
# elsewhere only when paired with the plain term. These are the ones that
# were primary before edition 2026.4 and must not creep back.
if grep -rniE '\bAHJ\b|certificate of occupancy|\bpunch list\b|\bretainage\b|listed component|\bplan review\b|\bhold point' \
     model/ guide/ templates/ 2>/dev/null \
   | grep -v '^model/00-conventions.md' \
   | grep -v 'in the construction analogy' \
   | grep -v 'analogous to' \
   | grep -v 'called the' \
   | grep -v 'analogy'; then
  bad "unpaired construction jargon outside reference/ (see model/00-conventions.md)"
else
  echo "  ok"
fi

# ---------------------------------------------------------------------------
note "10. Chapter grammar conformance"
# Every normative chapter carries the same eight sections, so a reader can
# find Purpose / Requirement across the whole model without reading linearly.
gfail=0
for f in model/0[1-9]*.md model/1[0-3]*.md; do
  for s in "^## Purpose" "^## Failure this prevents" "^## Requirement" \
           "^## Applicability" "^## Required evidence" "^## Exceptions" \
           "^## Implementation guidance" "^## Sources and confidence"; do
    grep -qE "$s" "$f" || { echo "  $f missing: ${s#^## }"; gfail=1; }
  done
done
if [ "$gfail" -eq 0 ]; then
  echo "  all $(ls model/0[1-9]*.md model/1[0-3]*.md | wc -l | tr -d ' ') chapters conform"
else
  bad "chapter grammar incomplete (see model/00-conventions.md)"
fi

# ---------------------------------------------------------------------------
note "11. Source ledger freshness"
# Platform behavior, regulations, CVEs, and protocol revisions all decay.
# SOURCES.md records retrieval dates so decay is visible rather than silent.
if [ -f SOURCES.md ]; then
  echo "  SOURCES.md present. Re-verify anything past its review date."
else
  bad "SOURCES.md missing"
fi

# ---------------------------------------------------------------------------
note "12. One requirement format across every chapter"
# Chapter 10 numbered its requirements as inline bold **10.1** while the other
# twelve used the blockquote form. It went unnoticed for three editions, it made
# those eleven requirements invisible to every count, and the prefix-matching
# grammar check above could not see it. Also catches the pre-2026.4 section
# headings, which that chapter still carried.
fmt=0
if grep -rnE '^\*\*[0-9]+\.[0-9]+' model/*.md 2>/dev/null; then
  bad "inline-bold requirement numbering: use > **REQUIREMENT n.n**"; fmt=1
fi
if grep -rn '^## Requirements$' model/*.md 2>/dev/null; then
  bad "'## Requirements' is the pre-2026.4 heading: the section is '## Requirement'"; fmt=1
fi
if grep -rn '^## Exceptions and recorded exceptions$' model/*.md 2>/dev/null; then
  bad "'## Exceptions and recorded exceptions' is the pre-2026.4 heading: use '## Exceptions'"; fmt=1
fi
[ "$fmt" -eq 0 ] && echo "  ok, $(grep -rohE '\*\*REQUIREMENT [0-9]+\.[0-9.]+' model/*.md | wc -l | tr -d ' ') numbered requirements in one format"

# ---------------------------------------------------------------------------
note "13. Requirement-heavy chapters are subdivided"
# Ten of thirteen chapters once stacked every requirement under a single
# heading with no subsections. Chapter 06 stacked seventeen. Nothing to scan,
# nothing to link to, and no way to cite a group of related provisions.
dense=0
for f in model/0[1-9]*.md model/1[0-3]*.md; do
  r=$(grep -c '\*\*REQUIREMENT [0-9]' "$f")
  s=$(grep -c '^### ' "$f")
  if [ "$r" -gt 6 ] && [ "$s" -lt 2 ]; then
    echo "  $f: $r requirements, $s subsections"
    dense=1
  fi
done
if [ "$dense" -eq 0 ]; then
  echo "  ok, every chapter over 6 requirements has subsections"
else
  bad "requirement wall: add ### groupings (more than 6 requirements needs at least 2)"
fi

# ---------------------------------------------------------------------------
note "14. Generated navigation is current"
# contents.md and the requirement index are generated, for the reason
# requirement 7.9 gives: generated content cannot drift. If these are stale the
# document describes a structure it no longer has.
if perl tools/build-nav.pl --check; then
  echo "  ok, contents.md and the requirement index match the sources"
else
  bad "generated navigation is stale: run perl tools/build-nav.pl"
fi

# ---------------------------------------------------------------------------
printf '\n'
if [ "$fail" -eq 0 ]; then
  echo "All checks passed."
else
  echo "One or more checks FAILED."
fi
exit "$fail"
