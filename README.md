# The AI Building Code

**Edition 2026.3** · [Changelog](CHANGELOG.md) · [Source ledger](SOURCES.md) · [How to read this](code/00-conventions.md)

**A governance model for how AI capabilities get built at a university.**

Most institutional AI governance answers *may I use this?* This answers a
different question: *how does something get built, and how does it earn the
right to run in production?*

---

## This repository contains three separate things

Knowing which one you are reading is most of the difficulty, so it is
stated first.

| | Part | Binds you? | What it is |
|---|---|---|---|
| **I** | [**The code**](code/) | **Yes**, once you adopt and amend it | Requirements, stated normatively. Short by design. Read [conventions](code/00-conventions.md) first. |
| **II** | [**The handbook**](handbook/) | No | How to operate the code. Paths, worked examples, procedures. |
| **III** | [**Reference**](reference/) | No | Evidence, framework crosswalks, platform profiles, glossary. The volatile material. |
| | [**Templates**](templates/) | The completed artifact is evidence | The actual paperwork. Probably the most immediately useful part. |

**You can adopt Part I without reading Parts II or III.** That is why they
are separate.

---

## The whole model in seven lines

Before building, establish the need.
Classify the consequences.
Review the design without creating a queue.
Inspect the system before important behavior becomes hidden.
Authorize production separately from completion.
Maintain a record of what actually exists.
Reuse certified components rather than reviewing them repeatedly.

Everything else is detail in service of those seven.

---

## Where to start, by who you are

Every reader used to be handed the same linear sequence. Don't read it that
way.

| You are | Read | Skip |
|---|---|---|
| **An executive or policy owner** | This page, [principles](code/01-principles.md), [adoption](handbook/01-adoption.md) | All of Part III, all inspection detail |
| **Considering adoption** | [Adoption](handbook/01-adoption.md), [amendments template](templates/amendments-template.md), [classification](code/03-classification.md) | Part III except the [platform profiles](reference/platform-profiles/) for your own stack |
| **An AI platform lead** | [Classification](code/03-classification.md), [inspections](code/06-inspections.md), [listed components](code/11-listed-components.md), [platform profiles](reference/platform-profiles/) | Statement of need, roles |
| **A builder with something to ship** | [Running example](handbook/02-running-example.md) first, then [statement of need](code/02-statement-of-need.md), [plan review](code/04-plan-review.md), [agentic products](handbook/03-agentic-products.md) | Roles, listed components, all of Part III |
| **A security or privacy reviewer** | [Security and privacy review](handbook/05-security-and-privacy-review.md), [inspections](code/06-inspections.md), [platform profiles](reference/platform-profiles/) | Statement of need, alterations |
| **An accessibility reviewer** | [Accessibility](handbook/04-accessibility.md), [concurrent reviews](code/10-concurrent-reviews.md) | Everything else |
| **An auditor** | [Occupancy and records](code/07-occupancy-and-records.md), [framework crosswalk](reference/framework-crosswalk.md), [conventions](code/00-conventions.md) | The handbook |
| **Evaluating whether this is any good** | [Evidence on gates](reference/evidence-on-gates.md), then the refusal below | Start with the honest limits, not the pitch |

**New and want the fastest orientation:** the
[running example](handbook/02-running-example.md) carries one system
through the entire process end to end. It is the shortest route to seeing
how the pieces connect.

---

## The one thing this model refuses to do

**It will not put a review board in front of your deploys.**

DORA's published research on change approval finds that external approval
approaches "have a negative impact on software delivery performance," and
that "no evidence was found to support the hypothesis that a more formal,
external review process was associated with lower change fail rates"
([DORA](https://dora.dev/capabilities/streamlining-change-approval/)). It
also names the trap institutions fall into after an incident: adding
process "will make things worse because this drives up lead times and batch
sizes, creating a vicious cycle."

Read the nuance, because it is the design constraint. DORA does not say
review is useless. It endorses **peer review at check-in plus automation**
as the substitute, and reframes the review body "from gatekeeper to process
architect and information beacon." So this model puts automated gates on
everything countable, peer review close to the work, independent review
only on genuinely high-consequence builds, and gates at **irreversibility**
rather than at ceremony.

If you adopt this and it becomes a queue in front of a committee, you have
implemented the thing it was written to prevent.

---

## Part I: The code

Requirements. Chapters follow the eight-section grammar described in
[conventions](code/00-conventions.md).

| # | Chapter | The failure it prevents |
|---|---|---|
| 00 | [Conventions](code/00-conventions.md) | Not knowing which sentences bind you |
| 01 | [Principles](code/01-principles.md) | Governance that grows without ever shrinking |
| 02 | [Statement of Need](code/02-statement-of-need.md) | Building the wrong thing, solution-first |
| 03 | [Classification](code/03-classification.md) | Risk decided by reviewer mood |
| 04 | [Plan Review](code/04-plan-review.md) | A design nobody read against the requirement |
| 05 | [Permits](code/05-permits.md) | Authorization becoming a permanent entitlement |
| 06 | [Inspections](code/06-inspections.md) | Verification after the evidence is gone |
| 07 | [Occupancy and Records](code/07-occupancy-and-records.md) | Nobody knowing what is running |
| 08 | [Alterations and Existing Work](code/08-alterations.md) | Change that silently outruns its review |
| 09 | [Roles](code/09-roles.md) | Ownership evaporating when a builder leaves |
| 10 | [Concurrent Reviews](code/10-concurrent-reviews.md) | Review as a relay of queues |
| 11 | [Listed Components](code/11-listed-components.md) | Reuse being harder than rebuilding |
| 12 | [Delegated Authority](code/12-delegated-authority.md) | An agent exceeding the human it acts for |

## Part II: The handbook

Non-binding. How to actually run it.

| Chapter | For |
|---|---|
| [01 Adoption](handbook/01-adoption.md) | Standing this up without creating a committee |
| [02 Running example](handbook/02-running-example.md) | One system, end to end, every stage |
| [03 Agentic products](handbook/03-agentic-products.md) | "We built an agent with AI coding tools and want it live" |
| [04 Accessibility](handbook/04-accessibility.md) | Obligations, why AI fails them by default, what to check |
| [05 Security and privacy review](handbook/05-security-and-privacy-review.md) | Running those reviews without becoming the bottleneck |

## Templates

The paperwork. Completed instances are the evidence that a requirement was
satisfied, so these are load-bearing even though they are not normative
text.

| Template | Used at |
|---|---|
| [Statement of Need](templates/statement-of-need.md) | Intake, [chapter 02](code/02-statement-of-need.md) |
| [Plan Review](templates/plan-review.md) | [Chapter 04](code/04-plan-review.md), builder and reviewer halves |
| [ADR](templates/adr.md) | Any architecturally significant decision |
| [Inspection: gateway key](templates/inspection-gateway-key.md) | H1. Mostly automatable, and should be automated. |
| [Inspection: MCP server](templates/inspection-mcp-server.md) | H2. Pin it to a protocol revision. |
| [Inspection: Agent Studio workflow](templates/inspection-agent-studio.md) | H4, where no publish gate exists |
| [Inspection: agentic product](templates/inspection-agentic-product.md) | [Handbook 03](handbook/03-agentic-products.md), both halves |
| [Certificate of Occupancy](templates/certificate-of-occupancy.md) | [Chapter 07](code/07-occupancy-and-records.md), full or temporary |
| [Amendments](templates/amendments-template.md) | Your institution's adopting instrument |

---

## Part III: Reference

Volatile or evidentiary. Check dates before relying on anything here.

| Document | Contains |
|---|---|
| [Platform profiles](reference/platform-profiles/) | What specific products actually enforce. **Findings about one product at one date.** |
| [Platform controls overview](reference/platform-controls.md) | The enforced-versus-human framing, and why it decides chapter shape |
| [Framework crosswalk](reference/framework-crosswalk.md) | NIST AI RMF, ISO/IEC 42001, EU AI Act, OMB, with verification status per claim |
| [Evidence on gates](reference/evidence-on-gates.md) | What is known, what is contested, where this model is guessing |
| [Glossary](reference/glossary.md) | Construction term to software term, and where the analogy breaks |

---

## Adopting this

Adopt it the way a jurisdiction adopts a model code: **take it, amend it,
publish your amendments.** Start with
[handbook/01-adoption.md](handbook/01-adoption.md) and the
[amendments template](templates/amendments-template.md), which is a delta
against a named edition so you can see what changed when a new one ships.

1. **Name your Authority Having Jurisdiction.** The office that can say no
   and be obeyed. If none exists, that is the finding, and this cannot
   substitute for it.
2. **Map the tiers to your own data classification.** Every
   `LOCAL AMENDMENT REQUIRED` label marks a decision the code deliberately
   leaves to you.
3. **Delete what you cannot enforce.** A documented control your platform
   does not implement is worse than an acknowledged gap.
4. **Start with inspections, not intake.** Automated hold points on what
   you already run pay off fastest and are least resented.

---

## Why construction, briefly

Because the built environment solved this at scale, for public safety,
across thousands of independent jurisdictions, **without central command
authority.** That last part matters for universities more than anything
else in the analogy.

What it supplies concretely: a model code adopted with local amendments, so
authorship is separated from authority. A statement of need before design.
Plan review by someone who is not the designer. Inspections at hold points,
before work is **concealed**. Occupancy as an event distinct from
completion. Record drawings of what was actually built. And certification of
components, so nobody re-tests a fire-rated door in every building.

Full mapping, and the four places it genuinely breaks down, in the
[glossary](reference/glossary.md).

---

## Scope and honest limits

**In scope:** capabilities an institution builds or assembles itself. MCP
servers and their tools, Agent Studio automations and agents, agent products
built with AI coding tools, gateway credential and budget issuance,
retrieval over institutional data, and the accessibility, security, and
privacy reviews that run alongside.

**Out of scope:** classroom and academic-integrity policy, procurement of
finished commercial products, research methodology, and anything touching
faculty academic freedom. Those are governed elsewhere by bodies with
standing to govern them, and a build-governance document that wanders into
them will be correctly ignored.

**What this cannot do:** make an institution compliant with anything. It is
a structure for making and recording decisions. Your counsel, security
office, privacy office, and accessibility office decide what the law
requires. Where law is implicated, this document cites the provision and
stops.

**Not validated by adoption.** Nobody has piloted this. It is a design
hypothesis with a coherent argument behind it, and
[reference/evidence-on-gates.md](reference/evidence-on-gates.md) lists every
place it reasons rather than measures. Adoption reports, turnaround
performance, exception rates, and failure cases are the most valuable
contribution anyone could make.

---

## License

[CC BY 4.0](LICENSE). Adopt it, amend it, say where it came from.
Contributions welcome, especially amendments from practice and corrections
to borrowed source material. See [CONTRIBUTING.md](CONTRIBUTING.md).
