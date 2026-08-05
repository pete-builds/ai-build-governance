---
title: Changelog
nav_order: 9
---

# Changelog

Model codes ship as dated **editions**, and jurisdictions adopt a specific
one. This model does the same, so an institution's amendments can say which
edition they adopt.

Edition numbering is `YYYY.N`. Anything that changes what a reviewer would
decide is a new edition. Wording and typo fixes are not.

---

## Unreleased

**A front-door restructure.** No requirement changed, no chapter was added or
removed, and no gate moved, so this is not an edition. It fixes the entry
experience, which was the part of this repository least subjected to its own
standards.

### Fixed: the front matter had become three diverged copies of itself

`README.md`, `index.md`, and `overview.md` each carried "what this is", "what
this is not", the eight-step sequence, the three-layer table, the DORA argument,
the origin of the borrowed mechanisms, and the adoption steps. The "start here by
role" table existed in **three** places, `README.md`, `index.md`, and
`guide/index.md`, with different rows in each.

It had already produced a factual error. `README.md` and `index.md` both said
**five** chapters are standing arrangements rather than stages. It is six, and
the one they dropped was chapter 11, the chapter this model calls its entry
point. Nothing caught it because no check compares two prose statements of the
same fact, and there is no good way to add one. The fix is to stop stating the
fact twice.

Each front-door page now has one job:

| Page | Job |
|:--|:--|
| `README.md` | The GitHub front door: what it is, and the map of every page |
| `index.md` | The site landing page: what it is, and which reader you are |
| `overview.md` | **The executive summary.** The argument, in prose |
| `quick-ref.md` | **New.** Everything binding, condensed onto one printable page |
| `contents.md` | Generated page inventory with reading times |

**This did not make the front matter shorter**, and the plan for it predicted
that it would. The four front pages grew slightly, because the executive summary
is genuinely new writing rather than relocated text. What changed is that each
fact has one home, and that the shortest route to "should I care about this" is
now one opening paragraph rather than a README that buried its argument below the
navigation. Single-sourcing was the goal. Brevity was a prediction that did not
hold, and saying so is cheaper than pretending otherwise.

### Changed: `overview.md` is the executive summary, not the reference card

It was titled "The model on one page" and it was a set of tables: tiers,
triggers, verification points, artifacts. That is the right artifact for someone
already committed and close to useless for someone deciding whether to spend four
hours. Nothing in the repository argued, in prose, why any of this exists.

`overview.md` keeps its filename so existing links and bookmarks land on the
better introduction. The tables moved to the new
[quick reference](quick-ref.md) unchanged. Two inbound links whose surrounding
text promised the condensed tables were retargeted there:
`model/index.md` and the generated line in `contents.md`. The link in
`model/00-conventions.md`, which points a reader without a standards background
at the most approachable page, now names the executive summary, which is more
accurate than what it said before.

The changelog entry for edition 2026.5 still calls `overview.md` "the model on
one page", because that is what shipped then and history is not rewritten here.

### Fixed: the README stated the price before the product

The first content after the heading was a six-link navigation bar, then "49,000
words across 38 pages, about 4 hours end to end", and only after that what the
framework is. The first thing a new reader learned was the cost.

### Removed: the front pages no longer advertise their own length

This reverses a decision edition 2026.6 made deliberately and defended in this
changelog, on the grounds that a contents page and reading times "make the size
visible and navigable. They do not make it smaller." Making the size visible was
right. Putting it on the front door, and then timing each individual page in its
own opening line, read as a warning label rather than as navigation, and it is a
strange thing for a document to say about itself.

The figures are gone entirely, including from the generated
[contents](contents.md) page, which had carried a word count and a reading
estimate for every layer and for each of the twenty chapters individually. The
contents page still lists every page and how many sit in each layer, because that
is navigation rather than a verdict on the reader's afternoon.

What survives is the useful half of the disclosure, and it appears on every front
page: the model is the only layer that binds, and reading only Purpose and
Requirement across the thirteen chapters is a supported way through.

`tools/build-nav.pl` no longer computes word counts at all. The `words` helper and
the reading-time function are deleted rather than left unused, so this cannot creep
back in through a regeneration.

### Added: routing by reader question rather than by job title

The known weakness recorded against edition 2026.5 was that thirteen chapters is
more than most people will read, and that a restructure around reader questions
would help. `index.md` now routes on "setting this up", "you built something and
want it live", "you want to use something someone else built", and "reviewing
someone else's build", rather than on a nine-row table of job titles. The
by-title table survives once, in `guide/index.md`, which already had the best
version of it.

This is a navigation layer, not a restructure. The chapters did not move.

---

## Edition 2026.6 (2026-08-05)

**A readability edition, and a correction.** No requirement changed in
substance. It is an edition rather than a wording pass because eleven
requirements became citable that were not, one previously unnumbered
requirement acquired a number, and a published count was wrong.

### Corrected: edition 2026.5 published the wrong requirement count

Edition 2026.5 said **119 numbered requirements**. The real figure was **130**,
and it is now **131**. This was not a counting slip. It was the symptom of the
defect below.

### Fixed: chapter 10 had been formatted differently for three editions

Chapter 10 numbered its requirements as inline bold text, `**10.1**`, while the
other twelve chapters used `> **REQUIREMENT 10.1**`. It was the reference
implementation of the chapter grammar when that grammar was introduced in
2026.3, and it kept the older convention while everything converted around it.

Three consequences, none of them visible from reading the chapter:

- **Eleven requirements were invisible to every count**, which is where the
  wrong figure came from.
- **The grammar check could not see it.** Check 10 greps for `^## Requirement`,
  which matches `## Requirements` as a prefix, so the chapter passed while
  carrying a heading no other chapter had. It also still carried
  `## Exceptions and recorded exceptions`, the pre-2026.4 name.
- **One requirement had no number at all.** The opening concurrency rule was an
  unnumbered `> **REQUIREMENT**` block, so the single most important statement
  in the chapter could not be cited in an amendment. It is now **10.0**,
  following the precedent chapter 03 already set with 3.0.

Chapter 10 is now formatted like the other twelve. **No requirement text
changed**, and 10.1 through 10.7 keep their numbers.

### Fixed: ten of thirteen chapters were a wall of requirements

Every chapter stated its requirements as a flat run of blockquotes under one
heading. Chapter 06 stacked **seventeen** that way, chapter 07 thirteen.
Nothing to scan, no anchor to link to, and no way to cite a group of related
provisions.

All thirteen chapters now group their requirements under subsection headings,
which is 42 new headings and **no change to any requirement**. Chapter 06 reads
H1 through H5 as before; chapter 01 now reads "Where gates belong," "What
humans do, and what the platform must," "Getting adopted, and staying adopted,"
"Shrinking, and proving it works."

### New: a table of contents, because this is a document

The repository was navigable and the document was not. There was no single page
listing what exists, and nothing told a reader how long any of it takes.

- **[Contents](contents.md)** lists every page, the requirement groupings inside
  each chapter, and **word counts and reading time per layer**. The honest
  headline is 49,000 words and about four hours end to end, of which the only
  binding layer is 95 minutes.
- **[Requirement index](reference/requirement-index.md)** lists all 131
  requirements by number, each linked to the subsection it sits in. The
  [amendments template](templates/amendments-template.md) has always recorded an
  adoption as a delta keyed to requirement numbers, and until now there was
  nowhere to look a number up.

**Both are generated** by `tools/build-nav.pl`, for the reason
[requirement 7.9](model/07-production-approval.md) gives about registries:
anything that can be generated should be, because generated content cannot
drift. Editing them by hand fails the build.

### New: three checks, because all three defects above were invisible

`tools/check.sh` now runs fourteen.

- **12. One requirement format across every chapter.** Catches inline-bold
  numbering and the two pre-2026.4 section headings that the prefix-matching
  grammar check cannot see.
- **13. Requirement-heavy chapters are subdivided.** More than six requirements
  requires at least two subsections.
- **14. Generated navigation is current.** Fails if the contents page or the
  requirement index no longer matches the chapters.

Every check in this suite exists because the corresponding mistake was made
here, and these three are no exception.

### Counts

| | 2026.5 as published | 2026.5 actual | 2026.6 |
|---|---|---|---|
| Numbered requirements | 119 | 130 | **131** |
| Requirement subsection headings | 12 | 12 | **54** |
| Checks in `tools/check.sh` | 11 | 11 | **14** |
| MUST, SHOULD, and MAY statements | 203 | 203 | **204** |

### Acknowledged, not fixed

**Four hours is still four hours.** A contents page and reading times make the
length honest rather than shorter. The single-file printable build that would
let an institution attach a whole edition to its adopting instrument does not
exist yet.

---

## Edition 2026.5 (2026-08-05)

**Three requirement areas added and a structural hole closed.** This edition
changes what a reviewer would decide, so it is an edition rather than a wording
pass. It was prompted by comparing this model against the *ITIL AI Governance*
white paper (PeopleCert, November 2025), which covers ground this model did not
and vice versa.

### New: third-party capabilities have a chapter

**The hole:** the model governed what an institution builds and what it
certifies internally. It said nothing about a component the institution
**depends on at runtime and does not operate**, which is neither a build nor
the procurement of a finished product. Since scope explicitly excluded
procurement, such components fell between two stools and had no requirement
attached to them at all.

Worse, the available instrument was actively misleading. Every verification
point in chapter 06 assumes the institution controls the artifact it is
checking. Run over a vendor-operated server, the same checklist produces a
document that looks like an inspection and verifies almost nothing.

New [chapter 13](model/13-third-party.md), ten requirements. The load-bearing
ones:

- **13.2** You cannot inspect what you do not run, so inspect the **boundary**
  instead, and do not record an inspection of the component.
- **13.3** Self-attestation is not certification. Vendor documentation, a trust
  page, a commissioned compliance report, and registry presence are all
  explicitly excluded. Requirement 11.7 already said certification authority
  cannot rest with the builder, and for a third-party component the operator
  **is** the builder, so this was that rule failing in the one case it was
  written for. **No exception path**, because permitting one would void the
  certification mechanism generally.
- **13.4** Connecting a component you do not operate transfers production change
  authority to its operator. Record that and have the Standing Owner accept it.
  This is requirement 6.12 pointed outward.
- **13.5** For a component you operate, pinning **prevents** change. For one you
  do not, pinning only **detects** it. Above Tier 1 there must therefore be a
  revocation path, and it must be **exercised** rather than documented.
- **13.7** A third-party dependency never lowers a tier, and the operator
  assuming risk is not a control the institution holds.

Also new: [MCP approvals](guide/06-mcp-approvals.md), which routes the three
real cases (you build it, you self-host someone else's, they operate it) and
names the distinction that actually matters, which is not who wrote the code but
**who can change what runs without asking you**. And a
[third-party boundary inspection template](templates/inspection-third-party-mcp.md)
whose most useful section is section 8, "what this inspection did NOT verify."

### New: behavior that changes without anyone changing anything

**The defect:** chapter 08 was triggered entirely by an act. Requirement 8.1
asks where a change re-enters, and something had to be changed for the question
to arise. The drift the model already covered was **configuration** drift:
pinned tool definitions, egress inventory, generated registry fields. A
capability whose behavior degrades while nobody touches it, because a provider
substituted a model behind the same name, or a retrieval corpus filled with
documents that outrank the validated ones, or an upstream field started
arriving empty, fired no requirement anywhere.

- **8.9** Above Tier 1, approved behavior is re-verified on an interval
  regardless of alteration, against a defined case set with a recorded
  threshold for action. The threshold is the part people omit, and a check with
  no action point produces a chart rather than a decision.
- **8.10** Where the institution does not control which version serves a
  capability, it records that the version is uncontrolled and treats a detected
  substitution as an alteration. Pin where the platform allows it. Writing
  "version: pinned" because a config field holds a version string, when the
  provider maps that string onto whatever it currently serves, is documented
  false assurance.

### New: the framework has to measure itself

**The defect:** two scattered GUIDANCE statements suggested reporting the
conforming-to-non-conforming ratio, and the repository stated in three places
that it remains a hypothesis until someone reports turnaround performance,
exception rates, and failure cases. Nothing required an adopting institution to
measure any of it. A governance system with no measurement cannot tell the
difference between working and being ignored.

**Requirement 1.9** names five numbers to publish on an interval. The
uncomfortable one is the count of approvals produced by turnaround expiry rather
than by a decision: deemed approval exists so a silent reviewer cannot block
work indefinitely, and it is also the mechanism most likely to become the normal
path while everyone believes review is happening. Counting authorizations issued
is explicitly **not** on the list, because activity metrics rise when a
framework is failing.

### New: which governance pattern are you already?

The model asserts on its front page that it is written for an institution that
cannot mandate compliance, and never asked an adopter to check whether that
describes them. A Directive institution adopting this will bolt these gates onto
an existing approval queue and produce exactly the outcome the DORA evidence
warns about.

[Adoption](guide/01-adoption.md) now opens with a four-pattern diagnostic
(Directive, Guided, Federated, Autonomous) and, for each, **the signal that your
adoption is failing**. Federated institutions are told to take certification
early rather than last. The axes, pattern names, and ten characteristics are
adapted from the ITIL white paper and attributed there; the failure signals and
the mapping are ours.

### New: two reference additions

- **[Appendix E](reference/capability-taxonomy.md)**, a six-function taxonomy
  (Creation, Curation, Clarification, Cognition, Communication, Coordination)
  as a **cross-check** on classification. It can raise a question and never
  lower a tier, the same rule as 11.2. The source publishes a risk matrix
  scoring each function against each risk; it is asserted with no stated
  method and is **deliberately not reproduced**.
- **ISO/IEC 38500:2024** added to [Appendix A](reference/framework-crosswalk.md).
  It is the only framework on that page that speaks to authority and delegation
  rather than risk, which is what chapters 09 and 12 are about. Marked **not
  verified**: the standard is paywalled and its activity names currently come
  from a secondary source.

**Not imported from that white paper:** its need-establishing survey statistics,
which are vendor-published figures of exactly the genre this project already
refuses; its risk matrix; and its maturity ladder, which is the device most
likely to produce the standing board the README refuses in writing.

### Structure: the chapter list was lying about itself

Thirteen chapters in one numbered list reads as thirteen sequential stages. Only
seven are. [The model index](model/index.md) now separates **the sequence**
(02 through 08) from **standing arrangements** (01, 09, 10, 11, 12, 13), which
required no renumbering.

**The eight-step summary on the front page omitted authorization to build
entirely.** It also silently dropped four other chapters while presenting itself
as "the whole thing." It now has chapter numbers on every step, includes
chapter 05, and names the five standing arrangements separately.

**Reuse was step 8 of 8 and chapter 11 of 13**, while this repository's own notes
call it the best idea here and the anti-queue mechanism. It is now the **entry
point**: the first question is whether a certified component fits, because that
is the only path that gets faster the more the institution governs.

New **[the model on one page](overview.md)**: the sequence, the tiers, all six
triggers, the five verification points, the artifact list, and the refusals.
Thirty-plus documents and nothing you could hand to a committee was a real gap.

The implementation guide's numbering is not a reading order, and its sidebar
presented adoption (for institutions) before the running example (for builders)
while the front page twice told builders to start with the example.
[Its index](guide/index.md) is now an audience routing table. Files were **not**
renumbered, to avoid breaking links.

### Fixed: one name per thing

The front page called the three layers **Layers**; seven other files called them
**Parts I, II, and III**, including the conventions page that defines the
structure. Edition 2026.4 renamed them to layers and missed everything except
the README. Standardized on **layer** everywhere, except in this changelog's
own 2026.3 and 2026.4 entries, which are dated records of what those editions
did and correctly use the term of their time.

### Fixed: defects found while doing the above

- **The conventions page stated the wrong chapter grammar.** It listed the
  pre-2026.4 section names (Rule, Requirements, Evidence required, Exceptions
  and recorded exceptions, Implementation notes) while every chapter and
  `tools/check.sh` used the current eight. The page defining the grammar was
  the only place still describing the old one.
- **Chapter 01 called itself seven principles and contained eight.** Now nine,
  and correct in both places it says so.
- **`tools/check.sh` would have silently skipped chapter 13.** Its conformance
  glob stopped at `model/1[0-2]*.md`, so a new chapter would have passed
  unchecked. This is the second time a check has needed widening for content it
  was written before, and it is worth noting that the check suite has the same
  decay problem as the citations.
- **Chapter 00 was titled "How to Read This Code."** After 2026.4 renamed the
  project away from "The AI Building Code" and `code/` to `model/`, "this Code"
  reinvited exactly the software-source ambiguity that rename removed.
- **`CITATION.cff` still described the model in pre-2026.4 vocabulary**: permits,
  hold points, certificate of occupancy, record drawings, listing. It is a
  user-facing file and no check covered it.
- **The 2026.4 changelog entry read "AI Build Governance is now AI Build
  Governance,"** a search-and-replace casualty that erased the old name from the
  one sentence whose entire job was recording it.
- Residual **"listing"** vocabulary in the adoption guide and amendments
  template, and **"punch list"** in the MCP inspection template, where a line
  break had hidden it from the jargon check.
- Stale cross-references: **"Principle 3"** and **"principle 5"** in two files,
  from a numbering scheme that no longer exists. Now 1.8 and 1.5.
- The framework crosswalk's "this model" column still said **AHJ**, **permit
  tier**, and **production authorization**.

### Requirement numbering is now a stated policy

Requirements are **never renumbered**. New ones are appended within their
chapter even where that leaves them out of positional order, which is why
chapter 08 now runs 8.1 to 8.6, then 8.9 and 8.10, then 8.7 and 8.8. An
amendment or exception record citing `8.7` has to mean the same provision three
editions later, and that matters more than reading tidily.

### Counts

| | 2026.4 | 2026.5 |
|---|---|---|
| Normative chapters | 12 | **13** |
| Numbered requirements | 106 | **119** |
| MUST, SHOULD, and MAY statements | 183 | **203** |
| Labelled statements in the model | 88 | **99** |
| `UNVERIFIED` labels in model, guide, references, and templates | 19 | **23** |
| Guide chapters | 5 | **6** |
| Templates | 9 | **10** |

### Acknowledged, not fixed

**Thirteen chapters is more than most people will read, and this edition added
one.** The grouping and the one-page overview are the mitigation, and they are a
mitigation rather than a fix. The alternative was extending chapters 06 and 11
with third-party requirements, which would have muddied two chapters that
currently each carry one clean idea. That trade is a judgment call and it could
be revisited.

Still unvalidated by adoption. Requirement 1.9 now at least names what
validation would look like.

---

## Edition 2026.4 (2026-08-04)

**Renamed, and the vocabulary inverted.** Previously this read as a building
code with AI terminology inserted. It now reads as an AI governance framework
that borrows building-code mechanisms. **No requirement changed in
substance.**

### Renamed

"The AI Building Code" is now **AI Build Governance**. The directory `code/`
is now `model/`, which also removes the ambiguity of a directory named
`code/` in a software repository that contains no source code. `handbook/` is
now `guide/`.

### Plain language is now primary

Construction terms appear only where they supply a concrete mental model,
paired with the plain term on first use and then dropped. The full two-way
mapping is in [How to Read This Code](model/00-conventions.md).

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

**All twelve normative chapters are now converted**, and conformance is
enforced by `tools/check.sh`. No requirement was altered, added, or removed in
the conversion.

The conversion made Part I both denser and more findable. Requirements are now
numbered and normatively worded (183 MUST, SHOULD, and MAY statements across
the model), qualifications sit next to the claims they affect rather than in a
closing section, and 88 labelled statements mark what is a requirement, what
is guidance, what is a local decision, and what is a design judgment.

Duplication with the templates was cut in the same pass: chapters state the
requirement and rationale, templates hold the operational checklists.

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

New [How to Read This Code](model/00-conventions.md) defines RFC 2119
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

- [Platform profile: litellm](reference/platform-profiles/litellm.md)
- [Platform profile: n8n](reference/platform-profiles/n8n.md)
- [Platform profile: mcp](reference/platform-profiles/mcp.md)

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

[Running Example: The Payment Inquiry Agent](guide/02-running-example.md) carries a
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

[Adoption](guide/01-adoption.md), a seven-phase sequence
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
- **[the source ledger](SOURCES.md)**, a source ledger grouped by decay rate with
  retrieval dates and review-by dates, plus a known-unreachable list and
  the open empirical questions
- **[tools/check.sh](tools/check.sh)**, runnable locally and in CI. Every
  check corresponds to a mistake actually made here, including one that
  fails if the count of `UNVERIFIED` labels drops, because someone
  "tidying" those away is a regression rather than an improvement.
- **CI workflow** with a weekly schedule, since sources decay whether or
  not anyone commits
- **[CITATION.cff](CITATION.cff)**
- **[Template: Institutional Amendments](templates/amendments-template.md)**
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
[CONTRIBUTING](CONTRIBUTING.md).
