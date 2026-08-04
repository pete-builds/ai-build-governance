# Changelog

Model codes ship as dated **editions**, and jurisdictions adopt a specific
one. This model does the same, so an institution's amendments can say which
edition they adopt.

Edition numbering is `YYYY.N`. Anything that changes what a reviewer would
decide is a new edition. Wording and typo fixes are not.

---

## Edition 2026.4 (2026-08-04)

**Renamed, and the vocabulary inverted.** Previously this read as a building
code with AI terminology inserted. It now reads as an AI governance framework
that borrows building-code mechanisms. **No requirement changed in
substance.**

### Renamed

"AI Build Governance" is now **AI Build Governance**. The directory `code/`
is now `model/`, which also removes the ambiguity of a directory named
`code/` in a software repository that contains no source code. `handbook/` is
now `guide/`.

### Plain language is now primary

Construction terms appear only where they supply a concrete mental model,
paired with the plain term on first use and then dropped. The full two-way
mapping is in [model/00-conventions.md](model/00-conventions.md).

| Was primary | Now primary |
|---|---|
| Authority Having Jurisdiction | Final Decision Authority |
| Permit | Authorization to Build |
| Plan review | Design review |
| Certificate of occupancy | Production Approval |
| Temporary certificate of occupancy | Time-Limited Production Approval |
| Hold point | Verification point |
| H1 Foundation, H2 Rough-in, H3 Framing | H1 Identity and Credentials, H2 Connections and Permissions, H3 End-to-End Path |
| H4 Concealment, H5 Final | H4 Pre-Concealment Verification, H5 Final Verification |
| Record drawings, as-builts | Deployed System Record |
| Listed component | Certified Reusable Component |
| Type approval | Certified Pattern |
| Special inspection | Independent Review |
| Substantial completion | Operational Handover |
| Retainage | Withheld Completion |
| Punch list | Accepted Defect List |
| Change order | Change Record |
| RFI | Clarification Request |
| Variance | Recorded Exception |
| Lawfully non-conforming | Pre-Existing System |
| Building official | Governance Platform Team |

**Kept deliberately:** the **do-not-conceal rule**. The name is vivid, the
idea transfers exactly, and no plain paraphrase is as memorable.

**Kept because already plain:** Statement of Need, Risk Classification, Tier
1/2/3, Standing Owner, Responsible Builder, stop-work, alteration, registry.

**Construction vocabulary is retained in `reference/`**, which is where the
analogy is explained rather than used.

### README rewritten

Now opens with what this is, **what it is not**, why the analogy is used at
all, which layers bind, and a "start here by role" table for eight reader
types. The whole model appears as **eight plain-language steps before any
construction mapping**.

### Layers renamed to match their function

Core Governance Model, Implementation Guide, Technical and Evidence
References.

### Chapter grammar

The eight sections are now Purpose, Failure this prevents, Requirement,
Applicability, Required evidence, Exceptions, Implementation guidance,
Sources and confidence. Qualifications belong **next to the claims they
affect**, not only in a closing section.

> Chapter 10 is converted. The remaining chapters carry the new terminology
> but retain their earlier internal structure, and are being converted
> **without changing any requirement**. Stated here rather than implied.

### New automated check

`tools/check.sh` now fails if construction jargon appears unpaired outside
`reference/`. The terminology mapping table and the glossary are exempt,
since that is where those terms belong.

---

## Edition 2026.3 (2026-08-04)

A structural edit. **No requirement changed in substance.** External review
found that the repository read as four documents merged into one: a
conceptual argument, a model code, an implementation handbook, and a
technical research report. Each part was fine; the transitions were not. The
diagnosis was that the ideas were more coherent than the reading experience,
and the fix was editorial architecture rather than more content.

### The three parts are now physical

`docs/` and `appendix/` are gone. In their place:

| Part | Directory | Binds? |
|---|---|---|
| I, the code | `model/` | Yes, once adopted |
| II, the handbook | `guide/` | No |
| III, reference | `reference/` | No |

You can now adopt Part I without reading Parts II or III, which was always
the intent and was previously only claimed.

### Readers get routes instead of a linear sequence

The README opens by stating what kind of document each part is, gives the
whole model in seven lines, and routes eight reader types to what they
should read **and what they can skip**. Previously every reader was handed
the same thirteen chapters in order.

### Statements are labelled where they appear

New [model/00-conventions.md](model/00-conventions.md) defines RFC 2119
keywords and six statement labels: REQUIREMENT, GUIDANCE, EXAMPLE, LOCAL
AMENDMENT REQUIRED, DESIGN JUDGMENT, VERIFICATION NOTE, plus the existing
UNVERIFIED. The distinctions existed before but arrived at the end of long
chapters. They are now visible in the passage they apply to.

### Chapter grammar

Part I chapters follow one eight-section structure: Purpose, Rule,
Applicability, Requirements, Evidence required, Exceptions and recorded exceptions,
Implementation notes, Sources and confidence. Read only Purpose, Rule, and
Requirements across Part I and you have read the code.

Converted so far: **chapter 10**, as the reference implementation of the
grammar. The remaining chapters keep their earlier structure and are being
converted **without changing their requirements**. This is stated in the
conventions chapter rather than hidden.

### Vendor material pulled out of Part I

Part I now states platform-neutral requirements. Product names, config keys,
and version numbers live in `reference/platform-profiles/`, split per
product so each can be re-verified on its own schedule:

- [litellm.md](reference/platform-profiles/litellm.md)
- [n8n.md](reference/platform-profiles/n8n.md)
- [mcp.md](reference/platform-profiles/mcp.md)

Chapter 06 was the worst offender and is the biggest beneficiary. It opened
with an elegant five-hold-point model and then dropped into MCP revisions,
OAuth requirements, CVEs, and specific config flags. It now states the
generalizable requirements (pin tool definitions and alarm drift, review
descriptions untruncated and as a set, no publish gate means this is the
only control) and points at the templates and profiles for the rest. A new
check fails the build if a vendor config key reappears in Part I.

This also makes "Agent Studio" credible as a category, because the generic
rule and the n8n finding are now visibly separate documents.

### Duplication between chapters and templates reduced

Chapter 06 previously reproduced most of the MCP inspection checklist that
also exists as a template. The chapter now states the requirement and
rationale; the template holds the operational checklist. Same for the Agent
Studio material.

### One running example

[guide/02-running-example.md](guide/02-running-example.md) carries a
single system, an agent that triages emailed payment inquiries, through all
ten stages: need, classification, design review, concurrent reviews, authorization,
H1 to H5, occupancy, reuse in both directions, alteration, and delegated
authority. It is the fastest route to seeing how the mechanisms connect, and
it demonstrates a case most people misclassify as Tier 2.

### Concurrent reviews split by altitude

Chapter 11 held the parallel-review principle, ADA applicability and
deadlines, practical accessibility defects, security escalation criteria,
privacy questions, and turnaround rules. That was two or three chapters of
material. Now: [model/10](model/10-concurrent-reviews.md) holds the normative
rule, and [guide/04](guide/04-accessibility.md) and
[guide/05](guide/05-security-and-privacy-review.md) hold the practice.

### Also added

[guide/01-adoption.md](guide/01-adoption.md), a seven-phase sequence
ordered so the first thing shipped is a service rather than a requirement,
with a sample operating model including the honest FTE cost and a list of
what to expect to go wrong.

### Two new automated checks

`tools/check.sh` now fails if a vendor config key appears in Part I, and if
Part I loses its statement labels. Both are regressions that would
otherwise be invisible.

### Not changed

No requirement was altered, added, or removed. Chapter renumbering:
concurrent reviews 11 to 10, certified reusable components 12 to 11, delegated authority
13 to 12, and agentic products left Part I for the handbook, because it is a
path rather than a rule.

---

## Edition 2026.2 (2026-08-04)

Corrections following an independent external review. Three were
substantive defects in the model, not presentation problems.

### Fixed: certified pattern no longer overrides classification

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
are never deemed. A capability may hold a production approval with an
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
objective tier classification, timeboxed design review, authorizations with expiry,
five inspection verification points, production approval, deployed system record,
alterations with a legacy amnesty path, roles, agentic products,
concurrent reviews, certified reusable components, delegated authority.

Design commitments: gates at irreversibility rather than at milestones;
objective highest-wins tier triggers including the lethal trifecta;
existing work pre-existing and complying on alteration; the
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
