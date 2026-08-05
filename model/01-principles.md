---
title: "01. Principles"
parent: "Core Governance Model"
nav_order: 1
---

## Purpose

The nine rules everything else derives from. Where a later chapter
conflicts with one of these, the principle wins.

## Failure this prevents

Governance that only ever grows. Every incident adds a step, no step is ever
removed, and eventually the framework is heavy enough that people route
around it entirely. At that point you have lost both the control and the
information.

## Requirement

### Where gates belong

> **REQUIREMENT 1.1 Default over approval**
> Where a failure can be prevented by a default, a template, or an automated
> check, the institution **SHOULD** do that instead of adding a review step.
> A governance programme whose first deliverable is a form rather than a
> template has built the wrong thing first.

> **REQUIREMENT 1.2 Gate on irreversibility**
> Gates **MUST** be placed where an action is hard to undo or where evidence
> is about to become unavailable. They **MUST NOT** be placed at milestones
> merely because a milestone feels significant.

| Irreversible or evidence-destroying | Reversible |
|---|---|
| Granting a credential a scope | Merging code |
| Writing to a system of record | Deploying to staging |
| Sending mail to real people | Rendering an interface |
| Training on collected data | Changing a prompt |
| Publishing a tool other agents will call | Adding a test |
| Hiding an agent's actions behind automation | Refactoring |

Gate the left column. Leave the right column alone.

> **REQUIREMENT 1.3 Every gate names its failure**
> Each gate **MUST** record the specific failure it prevents, whether that
> failure has occurred here, and how you would know the gate is working. A
> gate that cannot answer the first question **MUST** be removed.

### What humans do, and what the platform must

> **REQUIREMENT 1.4 Human attention on intent**
> Countable checks **MUST** be automated where the platform allows it. Human
> review **SHOULD** be reserved for questions no automated check can answer:
> whether the system should exist, whether a tool description is honest,
> whether anyone will maintain it in a year.

> **REQUIREMENT 1.5 No unenforceable claims**
> The institution **MUST NOT** document a control its platform does not
> enforce. Where a control depends on a person choosing correctly, it
> **MUST** be labelled as process-enforced and either inspected or
> explicitly accepted as a risk.

> **GUIDANCE**
> This is the principle most often violated by accident, and
> [Appendix B: What the Platform Enforces, and What a Human Has To](../reference/platform-controls.md) exists
> to make it checkable. Documented false assurance is worse than an
> acknowledged gap, because it stops people looking.

### Getting adopted, and staying adopted

> **REQUIREMENT 1.6 Adoption over mandate**
> Requirements **SHOULD** be enforced by making the compliant path the
> easiest path. Prohibitions **MUST** be limited to what law or
> unacceptable risk actually requires, and the institution **MUST** be able
> to say which.

> **REQUIREMENT 1.7 The record is part of the deliverable**
> A capability **MUST** have an accurate deployed system record, a named
> owner, and a review date. Absent those it is ungoverned regardless of how
> carefully it was reviewed on the way in.

### Shrinking, and proving it works

> **REQUIREMENT 1.8 Annual deletion**
> The institution **MUST** review its gates at least annually and delete
> those that have caught nothing. Deletions **SHOULD** be published.

> **REQUIREMENT 1.9 Measure the governance system itself**
> The institution **MUST** publish, on a stated interval, the numbers that show
> whether this framework is working rather than merely running. At minimum:
>
> | Number | What it tells you |
> |---|---|
> | Ratio of conforming to non-conforming capabilities, over time | Whether adoption is real. Rising is the only acceptable direction. |
> | Review turnaround against the stated turnaround | Whether the gates have become a queue |
> | Recorded exceptions granted, by requirement | Which requirement is wrong. A requirement excepted routinely is a defect, not a discipline problem. |
> | Approvals produced by turnaround expiry rather than by a decision | Whether deemed approval has quietly become the normal path |
> | Gates that caught nothing this period | The input to 1.8 |

> **GUIDANCE**
> Counting authorizations issued is not on this list, and neither is any
> measure of governance activity. Activity metrics rise when the framework is
> failing, because a framework people are routing around and a framework people
> are using both generate paperwork.
>
> The fourth row is the one that will be uncomfortable, and it is the reason it
> is here. Deemed approval exists so a silent reviewer cannot block work
> indefinitely, and it is also the mechanism most likely to become the default
> path while everyone believes review is happening. If most Tier 2 approvals are
> arriving by expiry, that is not a compliance finding against builders. It is
> a staffing finding against the institution.
>
> Publishing these internally is the requirement. Publishing them externally is
> not required and would be the single most valuable contribution any adopting
> institution could make, because **nobody has done it**. This framework is a
> design hypothesis, and these five numbers are what would test it.

## Applicability

All chapters, all tiers, all adopting institutions. These are the rules the
rest of the model is tested against, including by anyone proposing to amend
it.

## Required evidence

| Artifact | Demonstrates |
|---|---|
| Gate register, each entry naming its failure mode | 1.3 |
| Annual deletion review with published outcomes | 1.8 |
| Platform control inventory distinguishing enforced from process | 1.5 |
| Registry with owners and review dates | 1.7 |
| Published effectiveness numbers, with dates | 1.9 |

## Exceptions

None. A recorded exception against a principle is a signal that the
principle is wrong, and **SHOULD** be raised as an amendment rather than
granted as an exception.

## Implementation guidance

**On 1.1.** Platform engineering calls this the paved road or the golden
path, and the argument is mechanical: defaults determine behavior. Netflix is
generally credited with "paved road" and Spotify with "golden path."

> **DESIGN JUDGMENT**
> No rigorous measurement was located showing paved roads improve
> *governance* outcomes specifically. The case is plausible and widely
> adopted, not demonstrated. See
> [Appendix C: The Evidence on Gates](../reference/evidence-on-gates.md).

**On 1.2.** Building codes cluster inspections before work is concealed,
because verification after drywall costs an order of magnitude more. The
software equivalent is the moment a system stops showing its work, which
chapter 06 makes a formal verification point.

**On 1.3.** This cuts against the natural response to an incident, which is
to add approval. DORA's research finds that response backfires: adding
process "will make things worse because this drives up lead times and batch
sizes, creating a vicious cycle."

**On 1.6.** A corporation can require compliance. A university largely
cannot, and decentralized IT, unit budget autonomy, shared governance, and
academic freedom are operating conditions rather than obstacles. This is why
the framework is a model to adopt and amend rather than a policy to impose.

## What these cost you

Stated because 1.3 demands it of every gate, and therefore of the framework.

- **Fewer gates means some bad things ship.** The model bets on fast
  detection and reversibility over prevention, because the evidence says
  heavyweight gating produces worse outcomes overall.
- **Automation-first governance requires platform investment.** Without
  capacity to build templates and checks you will end up with the forms
  anyway. Say so rather than adopting something you cannot staff.
- **Refusing to claim unenforceable controls makes your posture look worse
  on paper.** It was always worse. The paper was wrong.

## Sources and confidence

> **VERIFICATION NOTE** (2026-08-04)
> The DORA quotes behind 1.2 and 1.3 were fetched and verified verbatim,
> including the nuance that peer review is the endorsed substitute rather
> than the absence of review.

> **DESIGN JUDGMENT**
> The nine-principle structure, the irreversibility table, and the annual
> deletion cadence are reasoned rather than measured. So is the choice of the
> five numbers in 1.9: they are the measures whose absence would let this
> framework look healthy while failing, which is a different question from
> which measures best predict outcomes. Nobody knows the answer to that one.
