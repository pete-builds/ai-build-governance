---
title: README
nav_exclude: true
search_exclude: true
---

# AI Build Governance

**A governance framework for how institutions build AI capabilities, as distinct
from how people use them.**

Most universities have a body that sets AI policy and nothing underneath it that
turns policy into a decision anyone can make on a Tuesday. Between the moment
someone has an idea and the moment it is running in production affecting real
people, six questions go unanswered: who established that this was needed, how
serious are the consequences, who reviewed the design against that need, what was
verified and when, who approved it going live, and where is it written down that
it exists. This framework answers those six. It is thirteen chapters of numbered
requirements that an institution adopts and amends for itself, in the way a state
adopts a model building code and writes its own amendments. Free under CC BY 4.0,
no vendor dependency, and **nobody has piloted it**.

## New here?

Read the [**executive summary**](overview.md). It is the whole argument,
including the parts that count against it, and it opens with a short version if
that is all you want. Then either:

- [**The running example**](guide/02-running-example.md) carries one system, an
  agent that triages emailed payment inquiries, through every stage end to end.
  Fastest way to see how the pieces connect, and it demonstrates a case most
  people misclassify.
- [**Quick reference**](quick-ref.md) is everything binding condensed onto one
  printable page: the sequence, the tiers, the triggers, the verification points.

---

**Edition 2026.6** · [Contents](contents.md) · [Requirement index](reference/requirement-index.md) · [Changelog](CHANGELOG.md) · [Source ledger](SOURCES.md) · [How to read this](model/00-conventions.md)

**You do not need to read all of it.** The only layer that binds is the model,
and reading just Purpose and Requirement across its thirteen chapters is a
supported way through. [Contents](contents.md) lists every page.

---

## What this is not

- **Not an AI use policy.** It says nothing about whether staff may use a
  chatbot, or what students may submit. Those are governed elsewhere.
- **Not a compliance certification.** Adopting it makes you compliant with
  nothing. Where law applies, this cites the provision and stops.
- **Not an ethics framework.** It assumes you have principles and asks how they
  get enforced at 4pm on a Thursday when something ships.
- **Not a committee.** If adopting it produces a new standing board, it has been
  implemented backwards.

The [executive summary](overview.md) states the limits in full, including that
nobody has run this yet and which claims remain unverified.

---

## Three layers, and what binds you

| | Layer | Binds? | What it is |
|---|---|---|---|
| **I** | [**Core Governance Model**](model/) | **Yes**, once adopted and amended | Requirements. Short by design. Start with [conventions](model/00-conventions.md). |
| **II** | [**Implementation Guide**](guide/) | No | How to operate it. Worked examples, deployment paths, procedures. |
| **III** | [**Technical and Evidence References**](reference/) | No | Vendor findings, legal references, framework crosswalks, evidence, open questions. Volatile. |
| | [**Templates**](templates/) | The completed artifact is the evidence | The actual paperwork. Often the most immediately useful part. |

**You can adopt Layer I without reading Layers II or III.**

---

## Layer I: Core Governance Model

**Chapters 02 through 08 are a sequence**, one capability from idea to
production. **The other six are standing arrangements** that apply the whole way
through, and reading those as stages is most of why the model looks heavier than
it is. [The model index](model/) groups them that way. **Chapter 11 is an entry
point rather than a last step**, because consuming an already certified component
is the fastest path through all of this.

| # | Chapter | The failure it prevents |
|---|---|---|
| 00 | [How to read this](model/00-conventions.md) | Not knowing which sentences bind you |
| 01 | [Principles](model/01-principles.md) | Governance that grows and never shrinks |
| 02 | [Statement of Need](model/02-statement-of-need.md) | Building the wrong thing, solution-first |
| 03 | [Risk Classification](model/03-classification.md) | Risk decided by reviewer mood |
| 04 | [Design Review](model/04-design-review.md) | A design nobody read against the requirement |
| 05 | [Authorization to Build](model/05-authorization-to-build.md) | Approval becoming a permanent entitlement |
| 06 | [Inspections](model/06-inspections.md) | Verification after the evidence is gone |
| 07 | [Production Approval and Records](model/07-production-approval.md) | Nobody knowing what is running |
| 08 | [Alterations and Existing Systems](model/08-alterations.md) | Change that silently outruns its review |
| 09 | [Roles and Authority](model/09-roles.md) | Ownership evaporating when a builder leaves |
| 10 | [Concurrent Reviews](model/10-concurrent-reviews.md) | Review as a relay of queues |
| 11 | [Certified Reusable Components](model/11-certified-components.md) | Reuse being harder than rebuilding |
| 12 | [Delegated Authority](model/12-delegated-authority.md) | An agent exceeding the human it acts for |
| 13 | [Third-Party Capabilities](model/13-third-party.md) | Inspecting a component you do not run, and filing it as though you had |

## Layer II: Implementation Guide

Different audiences, and the numbering is not a reading order. The
[guide index](guide/) has the by-role table.

| Chapter | For |
|---|---|
| [01 Adoption](guide/01-adoption.md) | Standing this up without creating a committee, and which governance pattern you already are |
| [02 Running example](guide/02-running-example.md) | One system, end to end |
| [03 Agentic products](guide/03-agentic-products.md) | "We built an agent with AI coding tools and want it live" |
| [04 Accessibility](guide/04-accessibility.md) | Obligations, why AI fails them by default, what to check |
| [05 Security and privacy review](guide/05-security-and-privacy-review.md) | Running those without becoming the bottleneck |
| [06 MCP approvals](guide/06-mcp-approvals.md) | Building a tool server, and connecting to one you did not build |

## Templates

| Template | Used at |
|---|---|
| [Statement of Need](templates/statement-of-need.md) | Intake, [chapter 02](model/02-statement-of-need.md) |
| [Design Review](templates/design-review.md) | [Chapter 04](model/04-design-review.md), builder and reviewer halves |
| [ADR](templates/adr.md) | Any architecturally significant decision |
| [Inspection: gateway key](templates/inspection-gateway-key.md) | H1. Automate this one. |
| [Inspection: MCP server](templates/inspection-mcp-server.md) | H2, for a server you operate. Pin it to a protocol revision. |
| [Inspection: third-party server boundary](templates/inspection-third-party-mcp.md) | [Chapter 13](model/13-third-party.md), for a server you do not operate |
| [Inspection: Agent Studio workflow](templates/inspection-agent-studio.md) | H4, where no publish gate exists |
| [Inspection: agentic product](templates/inspection-agentic-product.md) | [Guide 03](guide/03-agentic-products.md), both halves |
| [Production Approval](templates/production-approval.md) | [Chapter 07](model/07-production-approval.md), full or time-limited |
| [Amendments](templates/amendments-template.md) | Your institution's adopting instrument |

## Layer III: Technical and Evidence References

| Document | Contains |
|---|---|
| [Platform profiles](reference/platform-profiles/) | What specific products actually enforce. **Findings about one product at one date.** |
| [Platform controls overview](reference/platform-controls.md) | The enforced-versus-human framing |
| [Framework crosswalk](reference/framework-crosswalk.md) | NIST AI RMF, ISO/IEC 42001, EU AI Act, OMB, with verification status per claim |
| [Evidence on gates](reference/evidence-on-gates.md) | What is known, what is contested, where this is guessing |
| [Glossary](reference/glossary.md) | Two-way term mapping, and where the analogy breaks |
| [Functional capability taxonomy](reference/capability-taxonomy.md) | Six functions as a **cross-check** on classification, never a second axis |
| [Requirement index](reference/requirement-index.md) | All 131 requirements by number. Generated, so it cannot drift. |

**On "Agent Studio":** used throughout as the generic category for low-code
platforms where people compose and publish automations and agents. **n8n is
the primary worked example, not the definition of the category.** Findings
about n8n are not generalized; see its
[profile](reference/platform-profiles/n8n.md).

---

## Scope

**In scope:** capabilities an institution builds or assembles itself. MCP
servers and their tools, Agent Studio automations and agents, agent products
built with AI coding tools, gateway credential and budget issuance,
retrieval over institutional data, and the accessibility, security, and
privacy reviews that run alongside.

**Accessibility is in scope and is not optional.** For public universities in
the United States it carries a statutory deadline. AI systems fail it by
default: generated interfaces without keyboard paths, streaming output that
breaks assistive technology, generated images without alternative text. If
an agent produces content for people, that content is subject to the
standard. See [Accessibility](guide/04-accessibility.md).

**Out of scope:** classroom and academic-integrity policy, procurement of
finished commercial products, research methodology, and anything touching
faculty academic freedom. Those are governed elsewhere by bodies with
standing to govern them.

---

## Adopting this

Six steps, what each one costs, and the recurring work most institutions
underestimate: see [what adopting it costs](overview.md) in the executive
summary, then [Adoption](guide/01-adoption.md) for the full sequence. Record your
adoption with the [amendments template](templates/amendments-template.md), which
is a delta against a named edition so you can see what changed when a new one
ships.

Four of the mechanisms here are adapted from how the built environment governs
construction, for reasons the [executive summary](overview.md) sets out and the
[glossary](reference/glossary.md) maps term by term. **You never need to know
anything about building codes to use this framework.** If you have to translate a
metaphor to work out what you are being asked to do, that is a defect worth
reporting.

---

## License

[CC BY 4.0](LICENSE). Adopt it, amend it, say where it came from.
Contributions welcome, especially amendments from practice and corrections to
borrowed source material. See [CONTRIBUTING](CONTRIBUTING.md).
