---
title: Home
nav_order: 1
---

# AI Build Governance

{: .fs-9 }

A governance framework for **how institutions build AI capabilities**.
{: .fs-6 .fw-300 }

[The model on one page](overview.md){: .btn .btn-primary .mr-2 }
[Contents](contents.md){: .btn .mr-2 }
[Start with the running example](guide/02-running-example.md){: .btn .mr-2 }
[How to read this](model/00-conventions.md){: .btn }

**Edition 2026.6.** 49,000 words, about 4 hours end to end. The only layer that
binds is the model, at 95 minutes.
{: .fs-3 }

---

## What this is

An operating model for the decisions between "someone has an idea" and "it is
running in production affecting real people." It covers establishing need,
classifying risk, reviewing designs, verifying systems, approving production,
recording what exists, and reusing what has already been checked.

It is written for a decentralized institution that **cannot simply mandate
compliance**, which is the situation most universities are actually in.

## What this is not

- **Not an AI use policy.** It says nothing about whether staff may use a
  chatbot or what students may submit.
- **Not a compliance certification.** Adopting it makes you compliant with
  nothing. Where law applies, it cites the provision and stops.
- **Not an ethics framework.** It assumes you have principles and asks how they
  get enforced at 4pm on a Thursday when something ships.
- **Not validated by adoption.** Nobody has run it yet. It is a design
  hypothesis with a documented argument, and
  [evidence on gates](reference/evidence-on-gates.md) lists every place it
  reasons rather than measures.
- **Not a committee.** If adopting it produces a new standing board, it has
  been implemented backwards.

---

## The whole thing

**Start by asking whether you can reuse something already checked.** If a
certified component fits, confirm the certification and inspect **only your
integration** ([chapter 11](model/11-certified-components.md)). It is the
shortest path through the framework and the only one that gets faster as the
institution governs more.

Building something new is eight steps:

1. **Establish the need** before choosing a solution ([02](model/02-statement-of-need.md))
2. **Classify the consequences** against stated triggers, highest wins, rather than by reviewer judgment ([03](model/03-classification.md))
3. **Review the design** without creating a queue ([04](model/04-design-review.md))
4. **Authorize the build**, with conditions and an expiry ([05](model/05-authorization-to-build.md))
5. **Verify the system** before important behavior becomes hidden ([06](model/06-inspections.md))
6. **Approve it for production** as a separate act from finishing it ([07](model/07-production-approval.md))
7. **Record what actually exists**, not what was planned ([07](model/07-production-approval.md))
8. **Reassess when it changes**, and on an interval when it does not ([08](model/08-alterations.md))

Five chapters are standing arrangements rather than stages, true throughout:
[principles](model/01-principles.md),
[roles](model/09-roles.md),
[concurrent reviews](model/10-concurrent-reviews.md),
[delegated authority](model/12-delegated-authority.md), and
[third-party capabilities](model/13-third-party.md).

Everything else is detail in service of those.

---

## Start here by role

| You are | Read | Skip |
|:--------|:-----|:-----|
| **An institutional leader** | This page, [principles](model/01-principles.md), [adoption](guide/01-adoption.md) | The whole reference layer, all verification detail |
| **Considering adoption** | [Adoption](guide/01-adoption.md), [amendments template](templates/amendments-template.md), [risk classification](model/03-classification.md) | Reference, except the [platform profile](reference/platform-profiles/litellm.md) for your own stack |
| **An AI platform team** | [Risk classification](model/03-classification.md), [inspections](model/06-inspections.md), [certified components](model/11-certified-components.md), [MCP approvals](guide/06-mcp-approvals.md) | Statement of need, roles |
| **Connecting a vendor tool server** | [MCP approvals](guide/06-mcp-approvals.md), then [third-party capabilities](model/13-third-party.md) | The rest, until you know your route |
| **A builder with something to ship** | [Running example](guide/02-running-example.md), then [statement of need](model/02-statement-of-need.md), [design review](model/04-design-review.md), [agentic products](guide/03-agentic-products.md) | Roles, certified components, reference |
| **A security or privacy reviewer** | [Security and privacy review](guide/05-security-and-privacy-review.md), [inspections](model/06-inspections.md), [platform profiles](reference/platform-profiles/mcp.md) | Statement of need, alterations |
| **An accessibility reviewer** | [Accessibility](guide/04-accessibility.md), [concurrent reviews](model/10-concurrent-reviews.md) | Everything else |
| **An auditor** | [Production approval and records](model/07-production-approval.md), [framework crosswalk](reference/framework-crosswalk.md), [conventions](model/00-conventions.md) | The implementation guide |
| **Deciding whether this is any good** | [Evidence on gates](reference/evidence-on-gates.md) first | The pitch. Start with the limits. |

---

## Three layers, and what binds you

| Layer | Binds? | What it is |
|:------|:-------|:-----------|
| [**Core Governance Model**](model/) | **Yes**, once adopted and amended | Thirteen chapters, **131 numbered requirements**, each citable and indexed. |
| [**Implementation Guide**](guide/) | No | How to operate it. Worked example, deployment paths, procedures. |
| [**Technical and Evidence References**](reference/) | No | Vendor findings, legal references, [crosswalks](reference/framework-crosswalk.md), [evidence](reference/evidence-on-gates.md), the [capability taxonomy](reference/capability-taxonomy.md), the [requirement index](reference/requirement-index.md), open questions. Volatile. |
| [**Templates**](templates/) | The completed artifact is the evidence | The actual paperwork. |

**You can adopt the model without reading the other two layers.**

---

## The one thing this framework refuses to do

**It will not put a review board in front of your deploys.**

DORA's published research on change approval finds that external approval
approaches "have a negative impact on software delivery performance," and that
"no evidence was found to support the hypothesis that a more formal, external
review process was associated with lower change fail rates"
([DORA](https://dora.dev/capabilities/streamlining-change-approval/)). It also
names the trap institutions fall into after an incident: adding process "will
make things worse because this drives up lead times and batch sizes, creating a
vicious cycle."

Read the nuance, because it is the design constraint. DORA does not say review
is useless. It endorses **peer review at check-in plus automation** as the
substitute, and reframes the review body "from gatekeeper to process architect
and information beacon."

So: automated checks on everything countable, peer review close to the work,
independent review only for genuinely high-consequence builds, and gates at
**irreversibility** rather than at ceremony.

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

## Honest limits

Stated here rather than buried, because the framework asks the same of anyone
adopting it.

- **Nobody has piloted this.** Adoption reports, turnaround performance,
  exception rates, and failure cases are the most valuable contribution anyone
  could make.
- **Some claims are unverified and labelled as such.** ISO/IEC 42001's control
  structure is paywalled. Several construction primary sources would not load,
  which is why the chapters borrowing that vocabulary carry `UNVERIFIED` labels.
- **Every specific number is a design judgment.** Turnaround times, expiry
  intervals, review cadences. Change them freely; they are not load-bearing.
- **Certification is the most gameable mechanism here.** A certification
  granted casually and never surveilled would be worse than the queue it
  replaces. [Chapter 11](model/11-certified-components.md) says so itself.

---

Licensed [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/). Adopt it,
amend it, say where it came from.
