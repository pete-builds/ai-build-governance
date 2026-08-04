#!/usr/bin/env bash
# Pre-push checks for The AI Building Code.
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
note "6. Every chapter is reachable from the README"
for f in docs/*.md; do
  base=$(basename "$f")
  grep -q "$base" README.md || bad "chapter not linked from README: $base"
done
for f in templates/*.md appendix/*.md; do
  base=$(basename "$f")
  grep -rq "$base" README.md docs/ appendix/ 2>/dev/null || bad "orphaned file, nothing links to it: $f"
done
echo "  checked $(ls docs/*.md | wc -l | tr -d ' ') chapters, $(ls templates/*.md | wc -l | tr -d ' ') templates, $(ls appendix/*.md | wc -l | tr -d ' ') appendices"

# ---------------------------------------------------------------------------
note "7. Source ledger freshness"
# Platform behavior, regulations, CVEs, and protocol revisions all decay.
# SOURCES.md records retrieval dates so decay is visible rather than silent.
if [ -f SOURCES.md ]; then
  echo "  SOURCES.md present. Re-verify anything past its review date."
else
  bad "SOURCES.md missing"
fi

# ---------------------------------------------------------------------------
printf '\n'
if [ "$fail" -eq 0 ]; then
  echo "All checks passed."
else
  echo "One or more checks FAILED."
fi
exit "$fail"
