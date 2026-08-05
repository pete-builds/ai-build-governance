---
title: README
nav_exclude: true
search_exclude: true
---

# AI Build Governance

**Edition 2026.5** · [**The model on one page**](overview.md) · [Changelog](CHANGELOG.md) · [Source ledger](SOURCES.md) · [How to read this](model/00-conventions.md)

A governance framework for **how institutions build AI capabilities**, with
mechanisms adapted from building codes.

---

## What this is

An operating model for the decisions between "someone has an idea" and "it
is running in production affecting real people." It covers establishing
need, classifying risk, reviewing designs, verifying systems, approving
production, recording what exists, and reusing what has already been
checked.

It is written for a decentralized institution that **cannot simply mandate
compliance**, which is the situation most universities are actually in.

## What this is not

- **Not an AI use policy.** It says nothing about whether staff may use a
  chatbot, or what students may submit. Those are governed elsewhere.
- **Not a compliance certification.** Adopting it makes you compliant with
  nothing. Where law applies, this cites the provision and stops.
- **Not an ethics framework.** It assumes you have principles and asks how
  they get enforced at 4pm on a Thursday when something ships.
- **Not validated by adoption.** Nobody has run it yet. It is a design
  hypothesis with a documented argument, and
  [Appendix C: The Evidence on Gates](reference/evidence-on-gates.md) lists
  every place it reasons rather than measures.
- **Not a committee.** If adopting it produces a new standing board, it has
  been implemented backwards.

---

## The whole thing

Plain language, no analogy. Chapter numbers so you can go straight to what
binds.

**Before anything else: can you reuse something already checked?** If a
certified component fits, you confirm the certification and inspect **only your
integration** ([ch 11](model/11-certified-components.md)). That is the shortest
path here, and the only one that gets faster the more the institution governs.
If reuse is harder than rebuilding where you work, nothing else on this page
will save you.

If you are building something new, the sequence is eight steps:

1. **Establish the need** before choosing a solution ([ch 02](model/02-statement-of-need.md))
2. **Classify the consequences** using objective triggers, not judgment ([ch 03](model/03-classification.md))
3. **Review the design** without creating a queue ([ch 04](model/04-design-review.md))
4. **Authorize the build**, with conditions and an expiry ([ch 05](model/05-authorization-to-build.md))
5. **Verify the system** before important behavior becomes hidden ([ch 06](model/06-inspections.md))
6. **Approve it for production** as a separate act from finishing it ([ch 07](model/07-production-approval.md))
7. **Record what actually exists**, not what was planned ([ch 07](model/07-production-approval.md))
8. **Reassess it when it changes**, and on an interval when it does not ([ch 08](model/08-alterations.md))

Five chapters are **not** stages in that sequence. They are standing
arrangements that apply the whole way through: the
[principles](model/01-principles.md) everything is tested against,
[roles and authority](model/09-roles.md),
[concurrent reviews](model/10-concurrent-reviews.md),
[delegated authority](model/12-delegated-authority.md) wherever an agent acts
for a human, and [third-party capabilities](model/13-third-party.md) wherever a
build depends on something you do not operate.

Everything else is detail in service of those.

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

## Start here by role

| You are | Read | Skip |
|---|---|---|
| **An institutional leader** | This page, [principles](model/01-principles.md), [adoption](guide/01-adoption.md) | All of Layer III, all verification detail |
| **An institution considering adoption** | [Adoption](guide/01-adoption.md), [amendments template](templates/amendments-template.md), [classification](model/03-classification.md) | Layer III except the [platform profile](reference/platform-profiles/) for your own stack |
| **An AI platform team** | [Classification](model/03-classification.md), [inspections](model/06-inspections.md), [certified components](model/11-certified-components.md), [MCP approvals](guide/06-mcp-approvals.md), [platform profiles](reference/platform-profiles/) | Statement of need, roles |
| **A builder with something to ship** | [Running example](guide/02-running-example.md) first, then [statement of need](model/02-statement-of-need.md), [design review](model/04-design-review.md), [agentic products](guide/03-agentic-products.md) | Roles, certified components, Layer III |
| **Connecting a vendor or third-party tool server** | [MCP approvals](guide/06-mcp-approvals.md), then [third-party capabilities](model/13-third-party.md) | The rest of the sequence until you know which route you are on |
| **A security or privacy reviewer** | [Security and privacy review](guide/05-security-and-privacy-review.md), [inspections](model/06-inspections.md), [platform profiles](reference/platform-profiles/) | Statement of need, alterations |
| **An accessibility reviewer** | [Accessibility](guide/04-accessibility.md), [concurrent reviews](model/10-concurrent-reviews.md) | Everything else |
| **An auditor** | [Production approval and records](model/07-production-approval.md), [framework crosswalk](reference/framework-crosswalk.md), [conventions](model/00-conventions.md) | The guide |
| **Deciding whether this is any good** | [Evidence on gates](reference/evidence-on-gates.md) first | The pitch. Start with the limits. |

**Fastest orientation:** the [running example](guide/02-running-example.md)
carries one system, an agent that triages emailed payment inquiries, through
every stage end to end. It is the shortest route to seeing how the pieces
connect, and it demonstrates a case most people misclassify.

---

## The one thing this framework refuses to do

**It will not put a review board in front of your deploys.**

DORA's published research on change approval finds that external approval
approaches "have a negative impact on software delivery performance," and
that "no evidence was found to support the hypothesis that a more formal,
external review process was associated with lower change fail rates"
([DORA](https://dora.dev/capabilities/streamlining-change-approval/)). It
also names the trap institutions fall into after an incident: adding process
"will make things worse because this drives up lead times and batch sizes,
creating a vicious cycle."

Read the nuance, because it is the design constraint. DORA does not say
review is useless. It endorses **peer review at check-in plus automation**
as the substitute, and reframes the review body "from gatekeeper to process
architect and information beacon."

So: automated checks on everything countable, peer review close to the work,
independent review only for genuinely high-consequence builds, and gates at
**irreversibility** rather than at ceremony.

---

## Layer I: Core Governance Model

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

**On "Agent Studio":** used throughout as the generic category for low-code
platforms where people compose and publish automations and agents. **n8n is
the primary worked example, not the definition of the category.** Findings
about n8n are not generalized; see its
[profile](reference/platform-profiles/n8n.md).

---

## Adopting this

1. **Name your Final Decision Authority.** The office that can say no and be
   obeyed. If none exists, that is the finding, and this cannot substitute
   for it.
2. **Establish which governance pattern you already are.** Directive, Guided,
   Federated, or Autonomous. Each one fails at adopting this differently, and
   [Adoption](guide/01-adoption.md) names the failure signal to watch for in
   each. Federated institutions should take certification early rather than
   last.
3. **Map the tiers to your own data classification.** Every
   `LOCAL AMENDMENT REQUIRED` label marks a decision left deliberately to
   you.
4. **Delete what you cannot enforce.** A documented control your platform
   does not implement is worse than an acknowledged gap.
5. **Start with inspections, not intake.** Automated checks on what you
   already run pay off fastest and are least resented.
6. **Publish the five numbers** in
   [requirement 1.9](model/01-principles.md). They are what would tell anyone,
   including you, whether this is working rather than merely running. Nobody has
   published them yet.

Full sequence in [Adoption](guide/01-adoption.md). Record your
adoption with the [amendments template](templates/amendments-template.md),
which is a delta against a named edition so you can see what changed when a
new one ships.

---

## Where the mechanisms came from

Four of the mechanisms here are adapted from how the built environment governs
construction: a model code adopted with local amendments, verification before
work is concealed, approval to occupy as an act distinct from completion, and
certification of reusable products. That domain solved this problem at scale,
for public safety, across thousands of independent jurisdictions, **without
central command authority**, which is why it fits universities.

The vocabulary here is plain AI-governance language. The
[glossary](reference/glossary.md) has the two-way mapping and the four places
the analogy breaks down. **You never need to know anything about building codes
to use this framework.** If you have to translate a metaphor to work out what
you are being asked to do, that is a defect worth reporting.

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

## License

[CC BY 4.0](LICENSE). Adopt it, amend it, say where it came from.
Contributions welcome, especially amendments from practice and corrections to
borrowed source material. See [CONTRIBUTING](CONTRIBUTING.md).
