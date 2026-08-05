---
title: "00. How to Read This"
parent: "Core Governance Model"
nav_order: 0
---

Read this page once. It tells you which sentences bind you and which are
just explanation, which is the thing model codes usually leave implicit and
readers usually get wrong.

---

## Normative keywords

Used as in [RFC 2119](https://datatracker.ietf.org/doc/html/rfc2119).

| Word | Meaning |
|---|---|
| **MUST**, **MUST NOT** | Absolute. A build that violates one does not comply. |
| **SHOULD**, **SHOULD NOT** | Strong default. Departing requires a recorded reason, and at Tier 3 a recorded exception. |
| **MAY** | Genuinely optional. No justification needed either way. |

If a sentence in the core governance model contains none of these words, it is
explanation and you can skip it without losing anything binding.

---

## Statement labels

Every consequential passage carries a label, so you never have to infer
whether you are reading a rule, an opinion, or a fact about a vendor.

> **REQUIREMENT**
> Binding. This is the code. A Tier 3 reviewer MUST be independent of the
> builder.

> **GUIDANCE**
> Non-binding explanation of how to satisfy a requirement, or why it
> exists. Ignore it if you have a better way.

> **EXAMPLE**
> Illustration only. Never a requirement, even when it looks like one.

> **LOCAL AMENDMENT REQUIRED**
> The code deliberately does not decide this. Your institution MUST fill
> it in, and until it does, the surrounding requirement is incomplete.
> Data classifications and review turnarounds are the main ones.

> **DESIGN JUDGMENT**
> A choice made on reasoning rather than evidence. Every specific number
> in this code is one of these unless labelled otherwise. Change them
> freely; they are not load-bearing.

> **VERIFICATION NOTE**
> A fact about a platform, standard, or regulation, with the date it was
> checked. Facts decay. [the source ledger](../SOURCES.md) holds every retrieval
> date and review-by date.

> **UNVERIFIED**
> Something the authors could not confirm from a primary source, stated so
> you do not rely on it by accident. These are deliberate. Do not remove
> them to make a section read better; `tools/check.sh` fails the build if
> their count drops.

**The most important label is the last one.** A governance document that
cannot distinguish what it knows from what it assumes has no business
asking anyone else for rigor.

---

## The three layers, and what binds

| Layer | Binds? | What it is |
|---|---|---|
| **Core Governance Model** (`model/`) | **Yes**, once adopted and amended | Requirements. Short by design. |
| **Implementation Guide** (`guide/`) | No | How to operate the model. Worked examples, paths, procedures. |
| **Technical and Evidence References** (`reference/`) | No | Evidence, framework crosswalks, platform profiles, glossary. Volatile. |
| **Templates** (`templates/`) | The completed artifact is evidence | The actual paperwork. |

You can adopt the model without reading the guide or the references. That is
the point of separating them.

**One name per thing.** These three are called layers throughout. Editions
2026.3 and 2026.4 also called them Parts I, II, and III, and the changelog
still does where it describes what those editions changed.

---

## Chapter structure

Every chapter in the model follows the same eight-section grammar, so you can
find what you need without reading linearly:

| Section | Contains |
|---|---|
| **Purpose** | What this chapter is for |
| **Failure this prevents** | The specific thing that goes wrong without it |
| **Requirement** | Numbered normative provisions |
| **Applicability** | Who and what it covers, and what it excludes |
| **Required evidence** | What record demonstrates compliance |
| **Exceptions** | What may differ, and who approves |
| **Implementation guidance** | Non-binding explanation |
| **Sources and confidence** | What is verified, what is judgment |

If you only ever read **Purpose** and **Requirement** across the model, you
have read the model.

> **VERIFICATION NOTE** (2026-08-05)
> All thirteen normative chapters conform to this grammar as of edition 2026.6,
> and `tools/check.sh` fails the build if one drifts. The eight headings above
> are the exact strings the check looks for.

Requirements are numbered by chapter, so `11.2` is the second requirement of
chapter 11 and can be cited directly in an amendment or an exception.

> **A requirement is never renumbered.** Editions add requirements by appending
> a number within the chapter, even where that leaves them out of positional
> order, because an amendment or an exception record citing `8.7` must still
> mean the same provision three editions later.

---

## Where platform specifics live

The model states requirements in **platform-neutral verbs**:

> **REQUIREMENT**
> Logging MUST NOT be suppressible by the caller.

The corresponding vendor fact lives in a platform profile in the references:

> **VERIFICATION NOTE** (2026-08-04)
> On LiteLLM, a per-request `"no-log": true` suppresses logging unless an
> administrator has set `global_disable_no_log_param`.

This separation exists for three reasons. The requirement outlives the
product. The profile can be re-verified on its own schedule without
touching the code. And a reader running different platforms is not
misled into thinking a finding about someone else's stack applies to
theirs.

**Platform profiles are findings about one product at one date. They do not
generalize to a category**, however tempting that is.

---

## Terminology: plain language first

**The primary vocabulary here is plain AI-governance language.** Construction
terms are borrowed only where they supply a concrete mental model. Where one
appears, it is paired with the plain term on first use in that document and
then dropped.

You never need to know anything about building codes to use this framework.

> **What "plain language" does and does not mean here.** It means no unexplained
> construction metaphor, and no term used in a requirement without being stated
> plainly in the same requirement. It does **not** mean this reads easily
> without background. The model assumes a reader who is comfortable with
> normative standards language, has some exposure to institutional governance,
> and can follow a security or architecture argument. A capable manager without
> that background will find the front page and
> [the model on one page](../overview.md) approachable and the chapters
> demanding, and that is a real gap rather than a failure of effort on their
> part.
>
> The gap is largest where several chapters bear on one project at once, which
> is what the [running example](../guide/02-running-example.md) exists to show
> and the only place it is shown. If you are learning this rather than auditing
> it, read that first and come back.
>
> New vocabulary is the other cost. Final Decision Authority, Standing Owner,
> Authorization to Build, Deployed System Record, certified reusable component,
> delegated authority, pre-concealment, deemed permission, and surveillance
> interval are each defined where introduced, and accumulate faster than any one
> definition suggests. The
> [glossary](../reference/glossary.md) collects them.

| Plain term (primary) | Construction analogy | What it means |
|---|---|---|
| **Final Decision Authority** | authority having jurisdiction | The office that can say no and be obeyed |
| **Authorization to Build** | permit | Approval to start work. Not approval to run. |
| **Design Review** | plan review | Someone who is not the designer reads the design against the need |
| **Independent Review** | special inspection | Tier 3 review by someone who does not report to the builder |
| **Inspection / Verification Point** | hold point | A defined stage where work stops for checking |
| **Pre-Concealment Verification (H4)** | concealment inspection | Checking before behavior becomes hidden behind automation or an interface |
| **Production Approval** | certificate of occupancy | Authorization to operate. A separate act from finishing. |
| **Time-Limited Production Approval** | temporary certificate of occupancy | Expiring approval. The honest form of "pilot." |
| **Deployed System Record** | record drawings, as-builts | What actually exists, as opposed to what was designed |
| **Certified Reusable Component** | listed and labeled product | Checked once, then consumed by others |
| **Certified Pattern** | type approval | A whole pattern certified, so conforming instances skip component review |
| **Operational Handover** | substantial completion | The point support obligations begin |
| **Withheld Completion** | retainage | Holding something back until records are done |
| **Accepted Defect List** | punch list | Known, owned, deferred defects |
| **Change Record** | change order | A recorded, agreed modification |
| **Clarification Request** | RFI | A cheap recorded question when the documents are ambiguous |
| **Recorded Exception** | variance | A justified, approved departure from a requirement |
| **Pre-Existing System** | lawfully non-conforming building | Something built before this framework, grandfathered until altered |
| **Governance Platform Team** | building official | The office that runs the process and builds the automation |

### Terms kept because they are already plain

Statement of Need · Risk Classification · Tier 1, 2, 3 · Standing Owner ·
Responsible Builder · Stop-work · Alteration · Registry

### One construction term kept deliberately

**The do-not-conceal rule.** Work must not be covered up before it has been
checked. The name is vivid, the idea transfers exactly, and no plain
paraphrase is as memorable. It stays.

### The category names

**Agent Studio** means any low-code platform where people compose and publish
automations and agents. **AI gateway** means a model proxy that issues scoped
credentials and enforces budgets. Both are categories. Specific products are
worked examples in their [profiles](../reference/platform-profiles/), and
findings about one product are never generalized to its category.

---

## A note on the construction vocabulary

This model borrows real mechanisms from building governance: authorizations,
design review by someone other than the designer, verification points before
work is concealed, approval to operate as an act distinct from completion, a
record of what was actually built, and certification of reusable products. The
borrowing is functional rather than decorative, and
[Appendix D: Glossary, and Where the Analogy Breaks](../reference/glossary.md)
gives the term-by-term mapping plus the four places the analogy genuinely
breaks down.

You do not need to know anything about building codes to use the model. Where
a construction term appears in a requirement, the requirement also states
the thing plainly. If you ever have to translate a metaphor to work out
what you are being asked to do, that is a defect in this document, and
worth reporting.
