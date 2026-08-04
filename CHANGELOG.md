# Changelog

Model codes ship as dated **editions**, and jurisdictions adopt a specific
one. This model does the same, so an institution's amendments can say which
edition they adopt.

Edition numbering is `YYYY.N`. Anything that changes what a reviewer would
decide is a new edition. Wording and typo fixes are not.

---

## Edition 2026.2 (2026-08-04)

Corrections following an independent external review. Three were
substantive defects in the model, not presentation problems.

### Fixed: type approval no longer overrides classification

**This was the most serious defect.** Edition 2026.1's chapter 12 said a
conforming instance of an approved pattern "enters at Tier 1 regardless of
what tier the pattern's ceiling would otherwise imply." That directly
contradicted chapter 03's highest-wins rule and created a real loophole: a
certified scaffold could carry student records, inform employment
decisions, or hold all three legs of the lethal trifecta and still enter at
Tier 1, because the scaffold had a certificate.

Chapter 12 now separates two axes explicitly. **Certification reduces
component review. It never lowers a tier.** A conforming instance inherits
the pattern's component-level findings and skips repeated component review;
classification still runs in full against that instance's data, autonomy,
blast radius, and intended use. A worked contrast shows the same certified
MCP server landing at Tier 1 over a public catalog and Tier 3 over student
records.

### Fixed: deemed approval is not a compliance determination

Edition 2026.1 extended the deemed-approval mechanism to accessibility,
security, and privacy. That over-generalized evidence: the DORA findings
concern *change approval and delivery performance*, and say nothing about
statutory obligations. A busy accessibility office going silent cannot
create ADA compliance.

Chapter 11 now separates **administrative permission to proceed**, which a
missed turnaround can grant at Tier 2, from a **compliance
determination**, which only the accountable office can make
affirmatively. Accessibility conformance and lawful-basis determinations
are never deemed. A capability may hold a certificate of occupancy with an
outstanding determination named and dated on it.

Also corrected in the same chapter: the claim that documented
accessibility gaps put a capability "in a defensible position." Recording
improves management and accountability. It does not make a non-conforming
system conforming.

### Added: data minimization for observability

Edition 2026.1 demanded logging of inputs, outputs, tool results, and
reasoning context at H4 without ever asking what that trace becomes. It
becomes a concentrated copy of the data the tier was assigned to protect,
sitting somewhere nobody classified.

Chapter 06 gains **"log enough to reconstruct, not everything"**: field-level
redaction verified against a stored trace rather than a config, purpose
limitation, traces classified at the level of their most sensitive
content, retention by classification rather than platform default,
operational metrics separated from content-bearing records, and a named
read list. The unresolved tension between reconstructability and
minimization is stated rather than hidden.

### Added: maintenance machinery

The review's fair criticism was that the lifecycle controls did not match
content that depends on fast-moving platform behavior.

- **Dated editions** and this changelog
- **[SOURCES.md](SOURCES.md)**, a source ledger grouped by decay rate with
  retrieval dates and review-by dates, plus a known-unreachable list and
  the open empirical questions
- **[tools/check.sh](tools/check.sh)**, runnable locally and in CI. Every
  check corresponds to a mistake actually made here, including one that
  fails if the count of `UNVERIFIED` labels drops, because someone
  "tidying" those away is a regression rather than an improvement.
- **CI workflow** with a weekly schedule, since sources decay whether or
  not anyone commits
- **[CITATION.cff](CITATION.cff)**
- **[templates/amendments-template.md](templates/amendments-template.md)**
  so an adopting institution starts from a structure rather than a blank page

### Acknowledged, not fixed

The review's fifth point stands: this is not validated by adoption. Nobody
has piloted it, and appendix C already says so. It remains a design
hypothesis until an institution publishes turnaround performance,
exception rates, and failure cases. That is the most valuable contribution
anyone could make.

---

## Edition 2026.1 (2026-08-04)

Initial release, plus same-day corrections from a full verification pass.

### Initial content

Thirteen chapters, eight templates, four appendices. Statement of need,
objective tier classification, timeboxed plan review, permits with expiry,
five inspection hold points, certificate of occupancy, record drawings,
alterations with a legacy amnesty path, roles, agentic products,
concurrent reviews, listed components, delegated authority.

Design commitments: gates at irreversibility rather than at milestones;
objective highest-wins tier triggers including the lethal trifecta;
existing work lawfully non-conforming and complying on alteration; the
engineer's stamp borrowed for accountability but explicitly not for
personal liability; a two-signature rule for transient builders.

### Corrections from verification

Two independent full-mode verification agents, split by section. They
confirmed the two load-bearing claims exactly as stated: all five DORA
quotes verbatim including the peer-review nuance, and the n8n publish-gate
finding. Zero invented specifics and zero timestamp errors were found.

Four errors had propagated into the published repository and were fixed:

- "M-24-10 is superseded" asserted as fact when the cited OMB listing
  never mentions M-24-10. Downgraded to reported-and-unverified.
- The tag-budget passage claimed LiteLLM's documentation "states"
  enforcement is identical across key, metadata, and header attachment.
  It does not; it is silent. The silence is still the finding.
- Guardrail coverage stated as a blanket "guardrails do not apply to the
  Responses API." The documented limitation attaches to the unified
  guardrail path. Operational conclusion unchanged and strengthened: test
  the path, do not read the setting.
- "No LDAP" was an absence-of-mention presented as an affirmative
  statement.

### Vendor decoupling

n8n became a worked example rather than the subject, under the platform
class name **Agent Studio**. Same treatment for LiteLLM as an **AI
gateway**. Verified findings stay attributed to the specific product
verified and are explicitly not generalized to the class.

---

## How to record an adoption

If you adopt an edition, say which one, and publish your amendments. The
[amendments template](templates/amendments-template.md) has a field for
it. Adoption reports and amendments from practice are the most valuable
contributions this project can receive; see
[CONTRIBUTING.md](CONTRIBUTING.md).
