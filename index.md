---
title: Home
nav_order: 1
---

# AI Build Governance

{: .fs-9 }

How institutions build AI capabilities, as distinct from how people use them.
{: .fs-6 .fw-300 }

[Executive summary](overview.md){: .btn .btn-primary .mr-2 }
[Start with the running example](guide/02-running-example.md){: .btn .mr-2 }
[Quick reference](quick-ref.md){: .btn }

**Edition 2026.6.** The only layer that binds is the model.
[Contents](contents.md) lists every page, and
[how to read this](model/00-conventions.md) explains which sentences bind.
{: .fs-3 }

---

Most universities have a body that sets AI policy and nothing underneath it that
turns policy into a decision anyone can make on a Tuesday. Between the moment
someone has an idea and the moment it is running in production affecting real
people, six questions go unanswered: who established that this was needed, how
serious are the consequences, who reviewed the design against that need, what was
verified and when, who approved it going live, and where is it written down that
it exists.

This framework answers those six. Thirteen chapters of numbered requirements that
an institution adopts and amends for itself, in the way a state adopts a model
building code and writes its own amendments. It is written for a decentralized
institution that **cannot simply mandate compliance**, which is the situation most
universities are actually in.

Its one design rule: **gates belong where an action becomes hard to reverse, not
where a project hits a milestone.** The
[executive summary](overview.md) makes that case, including the published
evidence that review boards in front of deployment make delivery worse.

---

## Which of these are you?

| You are | Start | Then |
|:--|:--|:--|
| **Setting this up for an institution** | [Executive summary](overview.md) | [Adoption](guide/01-adoption.md), then the [amendments template](templates/amendments-template.md) |
| **You built something and want it live** | [Running example](guide/02-running-example.md) | [Statement of need](model/02-statement-of-need.md), [design review](model/04-design-review.md), and [agentic products](guide/03-agentic-products.md) if you built it with AI coding tools |
| **You want to use something someone else built** | [Certified components](model/11-certified-components.md) if it was certified here | [MCP approvals](guide/06-mcp-approvals.md) then [third-party capabilities](model/13-third-party.md) if a vendor operates it |
| **Reviewing someone else's build** | [Security and privacy review](guide/05-security-and-privacy-review.md) | [Inspections](model/06-inspections.md) and [concurrent reviews](model/10-concurrent-reviews.md) |
| **Deciding whether this is any good** | [Evidence on gates](reference/evidence-on-gates.md) | The limits before the pitch |

Narrower roles, including accessibility reviewers, auditors, and platform teams,
are routed in the [implementation guide index](guide/).

---

## What binds you, and what does not

The [**core governance model**](model/) is the only layer that binds, and only
once your institution adopts and amends it. Thirteen chapters, **131 numbered
requirements**, each citable by number so an amendment can reference `11.2`
directly.

Everything else supports it and binds nobody. The
[**implementation guide**](guide/) is how to operate the model. The
[**technical and evidence references**](reference/) hold vendor findings, legal
references, [crosswalks](reference/framework-crosswalk.md), and the
[evidence](reference/evidence-on-gates.md), and it is the most volatile material
here. The [**templates**](templates/) are the paperwork, and a completed template
is the evidence that a requirement was satisfied.

**Chapters 02 through 08 are a sequence. The other six are standing arrangements**
that apply throughout, and reading those as stages is most of why the model looks
heavier than it is. [The model index](model/) groups them that way.

---

## Honest limits

**Nobody has piloted this.** It is a design hypothesis with a documented
argument, not a validated practice. Adoption reports, turnaround performance,
exception rates, and failure cases are the most valuable contribution anyone
could make.

The rest of the honest accounting, which claims are unverified and why, which
numbers are design judgments you should change freely, and which mechanism here is
the most gameable, is in [what is not known](overview.md).

---

Licensed [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/). Adopt it,
amend it, say where it came from. Corrections and amendments from practice are
welcome: see [contributing](CONTRIBUTING.md).
