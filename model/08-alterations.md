---
title: "08. Alterations and Existing Systems"
parent: "Core Governance Model"
nav_order: 8
---

## Purpose

Handles change to things already running, and the large population of
capabilities built before the framework existed.

## Failure this prevents

Change that silently outruns its review. And the adoption failure that kills
frameworks on contact: telling every existing builder that their work is now
a violation.

## Requirement

> **REQUIREMENT 8.1**
> A change **MUST** re-enter the process at the stage where its risk actually
> changes, and no earlier.

| Change | Re-enters at |
|---|---|
| Prompt wording, output formatting, non-functional refactor | Nowhere. Automated checks only. |
| New tool, integration, or egress path | **H2**, plus reclassification |
| Data classes widened | **Chapter 03**, then design review |
| Autonomy increased, or a confirmation step removed | **H4** |
| Audience widened | **Chapter 03**, then an approval amendment |
| Model swapped within the same capability class | Automated checks, note in record |
| Model swapped to a different capability class | **H5** |
| Purpose changed | **Chapter 02. This is a new project.** |

> **GUIDANCE**
> Three rows deserve attention because platforms will not tell you they
> happened.
>
> *Removing a confirmation step* looks like a usability improvement and is a
> change in autonomy tier.
>
> *Adding an integration* is the most common way a Tier 2 system silently
> becomes Tier 3, because it is often the third leg of the lethal trifecta
> arriving on its own. Egress inventory drift **SHOULD** alarm automatically
> rather than depend on someone remembering this chapter.
>
> *Purpose change* is the row that gets skipped. A capability repurposed for
> something its Statement of Need never described is new work on an old
> foundation.

> **REQUIREMENT 8.2 Pre-existing systems**
> Capabilities built before adoption are **pre-existing and permitted**.
> Compliance is triggered by **alteration**, and applies to the altered
> portion.

> **GUIDANCE**
> This is borrowed directly, and it is what makes adoption of a new edition
> possible at all. Building codes do not retroactively condemn every existing
> structure, because a code that did would never be adopted.

> **REQUIREMENT 8.3 Amnesty inventory**
> Adoption **MUST** begin with an inventory in which every existing capability
> receives a registry entry and a named owner, **with no penalty for having
> existed**.

> **GUIDANCE**
> Any penalty attached to disclosure buys an inaccurate inventory, which is
> worse than none because it gets believed. This is the single highest-value
> step in adopting the framework.

> **REQUIREMENT 8.4**
> Pre-existing capabilities **MUST** be classified so exposure is known, and
> **MUST NOT** be required to satisfy their tier's gates retroactively.

> **REQUIREMENT 8.5 The unsafe list**
> Immediate action **MUST** be required only for conditions that are actively
> dangerous rather than merely non-conforming. The list **MUST** be short and
> defensible.

Starting set:

- Credentials exposed, unscoped, or non-expiring
- Data classes the institution forbids on that platform
- The full lethal trifecta with no human in the path
- No owner at all

> **GUIDANCE**
> Every item added here is a retroactive demand on people who did nothing
> wrong, and the credibility of the whole amnesty depends on the list being
> obviously about danger rather than tidiness. **If your unsafe list has
> fifteen items, it is a compliance programme wearing a safety costume, and it
> will be read that way.**

> **REQUIREMENT 8.6**
> An unowned running capability **MUST** either receive an owner or be
> switched off. There is no third resolution.

## Applicability

8.1 applies to every capability holding production approval. 8.2 through 8.6
apply during and after adoption to anything predating it.

## Required evidence

For alterations: the re-entry stage taken, and any reclassification. For
pre-existing systems: a registry entry with named owner, an assigned tier,
and the date inventoried.

## Exceptions

> **REQUIREMENT 8.7 Accepted defect list**
> Known defects **MAY** be deferred rather than fixed, provided they are
> recorded with owners and dates rather than held in someone's head or
> silently converted into "known limitations."

> **REQUIREMENT 8.8 Clarification requests**
> A builder unsure whether a change needs re-review **MUST** be able to ask
> cheaply and receive a recorded answer quickly. See
> [requirement 4.9](04-design-review.md).

> **GUIDANCE**
> Absent that, people guess, and they guess toward not asking. Most governance
> failures that look like defiance are unanswered questions.

## Implementation guidance

**Change records.** A construction change order is signed by owner, architect,
and contractor together, covering scope, cost, and schedule as one instrument.
The transferable discipline is that tri-party structure: a change is not
something the builder decides alone, and it accounts for what the change
costs.

**Sunset by attrition.** Most pre-existing non-conforming work resolves
itself, and you should expect that rather than driving it. It gets changed and
complies on alteration; it stops being used and the record review
decommissions it; or its owner leaves and it surfaces as an orphan. The
periodic record review in [chapter 07](07-production-approval.md) is what
makes attrition work. Without it, "pre-existing" becomes a synonym for "never
looked at again."

> **GUIDANCE**
> Report the ratio of conforming to non-conforming capabilities over time. It
> is the honest measure of whether adoption is real, and a much better metric
> than counting authorizations issued.

Worked instance: [Running Example: The Payment Inquiry Agent](../guide/02-running-example.md),
stage 9, where an auto-send request was declined in its original form and
approved in a narrower one that removed the harm path.

## Sources and confidence

> **DESIGN JUDGMENT**
> The re-entry table is the substantive content of this chapter and is
> reasoned rather than measured. The amnesty approach and the short unsafe
> list are strategic judgments about adoption, informed by how building codes
> handle existing structures.

> **UNVERIFIED**
> The treatment of existing buildings as lawfully non-conforming with
> compliance triggered by alteration, and the change record and accepted
> defect list instruments, are described from standard practice. Primary
> sources could not be retrieved. See [the source ledger](../SOURCES.md).
