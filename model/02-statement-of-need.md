---
title: "02. Statement of Need"
parent: "Core Governance Model"
nav_order: 2
---

## Purpose

Establishes what problem a capability solves, and who says so, before anyone
chooses a solution.

## Failure this prevents

Solution-first building. Someone demonstrates a capability, the demo is
impressive, a project forms around the demo, and the need is written
afterwards to justify what already exists. The second failure it prevents is
cheaper and more common: building something that already exists.

## Requirement

> **REQUIREMENT 2.1**
> Every capability above Tier 1 **MUST** have a Statement of Need that is
> **authored or signed by someone other than the builder**.

That signature is the entire control. A need statement written by the person
who wants to build the thing is a proposal in disguise.

> **REQUIREMENT 2.2**
> The Statement of Need **MUST** contain all six of:

| # | Section | Must contain |
|---|---|---|
| 1 | Problem | What is wrong today, stated **without a solution in it** |
| 2 | Affected population | Named group and rough scale |
| 3 | Cost of inaction | What happens if nothing is built |
| 4 | Definition of done | At least one measurable criterion **that could fail** |
| 5 | Data required | Data classes needed, in the institution's own scheme |
| 6 | Ownership | Who decides it is worth doing, and who owns it in eighteen months |

> **REQUIREMENT 2.3 Tolerance for error**
> Section 4 **MUST** state the acceptable error rate, who bears the cost of
> an error, and how an affected person would find out and contest an output.

> **GUIDANCE**
> AI systems produce wrong answers as routine operation, not as defects. A
> need statement that has not confronted its own tolerable error rate is
> not finished.

> **REQUIREMENT 2.4 Prior-art check**
> Four questions **MUST** be answered in writing before design begins:
> whether the vendor already publishes an official integration; whether an
> equivalent already exists in the institution's registry; whether this can
> be bought; and whether it can be done without AI.

> **REQUIREMENT 2.5**
> Where the answer to any 2.4 question is yes, the Statement of Need
> **MUST** state why building anyway is justified.

> **REQUIREMENT 2.6 Standing Owner**
> Where the named operator holds a fixed-term appointment, a Standing Owner
> on a continuing appointment **MUST** be identified before design review
> completes. See [chapter 09](09-roles.md).

## Applicability

Required above Tier 1. At Tier 1 the builder records the need and proceeds
without a second signature.

A Statement of Need is **not** a funding decision, though it usually feeds
one. Recording a valid unfunded need is a useful outcome, and a register of
them is how an institution notices the same need arriving from four units.

## Required evidence

A signed Statement of Need in the registry carrying a permanent identifier,
owner and operator names, declared data classes, declared population and
scale, the four prior-art findings, and the stated error tolerance.

## Exceptions

> **REQUIREMENT 2.7 Grounds for return**
> A Statement of Need **MUST** be returned rather than classified where the
> problem statement remains a solution statement after one revision; no
> named owner will exist in eighteen months and none can be found; the data
> required includes classes the institution forbids on the intended platform
> and no alternative design is offered; the success criterion cannot fail; or
> 2.4 found an official integration and the only stated reason to build is
> preference.

Returning at this stage is cheap. Returning after six weeks of building is
not.

## Implementation guidance

**The split worth understanding.** Building commissioning practice separates
the owner's statement of requirements (the *what*, written by the owner) from
the basis of design (the *how*, written by the designer), and has a third
party audit one against the other. This chapter is the first document;
[chapter 04](04-design-review.md) is the second and the audit.

| Document | Author | Answers |
|---|---|---|
| Statement of Need | The person with the problem | What must be true |
| Design response | The builder | How it will be made true |
| Design review | Neither | Does the design deliver the need |

**On section 1.** If the problem statement contains "AI," "agent," "LLM," or
a product name, it is a solution statement. The forcing question: who is
worse off today, and how would *they* describe it?

**On section 3.** "Not much, but it would be nice" is a legitimate answer. The
project can proceed as a labelled experiment. It does not then get to claim
operational urgency or skip classification on the grounds of being a pilot.

**On section 5.** This is the field most often filled in optimistically, and
it sets the tier. Widening it later is an alteration requiring re-review,
because "we also connected it to the student records" is how a Tier 1 project
becomes Tier 3 unnoticed.

**On 2.4.** The cheapest step in the framework. An honest "this already
exists" is the highest-value outcome the whole process can produce and
**SHOULD** be recorded as a success rather than a failed intake.

Template: [Template: Statement of Need](../templates/statement-of-need.md).
Worked instance: [Running Example: The Payment Inquiry Agent](../guide/02-running-example.md),
stage 1, where the prior-art check surfaced a non-AI fix that shipped first.

## Sources and confidence

> **DESIGN JUDGMENT**
> The six required sections, the four prior-art questions, and the return
> criteria are reasoned from institutional capital-planning practice, not
> measured. No study was located on whether structured intake reduces wasted
> effort more than it suppresses useful experimentation.

> **UNVERIFIED**
> The owner-requirements and basis-of-design split is attributed to building
> commissioning practice associated with ASHRAE Guideline 0. The guideline
> text could not be retrieved. See [the source ledger](../SOURCES.md).
