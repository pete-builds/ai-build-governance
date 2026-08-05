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

### Change that arrives without anyone changing anything

Everything above is triggered by an act. Requirement 8.1 asks where a change
re-enters, and something has to have been changed for the question to be
asked at all. A capability can also stop behaving as it was approved to behave
while nobody touches it.

> **REQUIREMENT 8.9 Behavior is re-verified on an interval, not only on change**
> Above Tier 1, a capability's approved behavior **MUST** be re-verified on a
> stated interval regardless of whether it has been altered. The check
> **MUST** be a defined set of cases with a recorded expected result and a
> recorded threshold for action, exercised against the running system.

> **GUIDANCE**
> This is the gap the alteration table cannot cover, and it is not
> hypothetical: the provider substitutes a model behind the same name, a
> retrieval corpus fills up with newer documents that outrank the ones the
> answers were validated against, an upstream field starts arriving empty, a
> refusal boundary moves. In each case the system's behavior changed, its
> configuration did not, and no requirement above fires.
>
> Keep the case set small and keep the ones that would embarrass you. Ten cases
> re-run monthly with a recorded threshold is worth more than a hundred nobody
> runs, and the threshold is the part people omit: a check with no stated
> action point produces a chart rather than a decision.

> **REQUIREMENT 8.10 Version substitution you did not perform**
> Where the institution does not control which model or component version
> serves a capability, it **MUST** record that the version is uncontrolled, and
> **MUST** treat a detected substitution as an alteration entering at the row
> in 8.1 the substitution corresponds to. Where the platform permits pinning a
> version, above Tier 1 the institution **SHOULD** pin it.

> **GUIDANCE**
> The order here matters. Pin if you can, because prevention beats detection.
> Where you cannot, the honest record is "we do not control this," which is
> [principle 1.5](01-principles.md) applied to a control the institution would
> like to have and does not. Writing "model version: pinned" because a
> configuration field contains a version string, when the provider maps that
> string onto whatever it currently serves, is documented false assurance.
>
> Third-party components reached across an institutional boundary have the same
> problem in a sharper form, and [chapter 13](13-third-party.md) handles it.

## Applicability

8.1 applies to every capability holding production approval. 8.2 through 8.6
apply during and after adoption to anything predating it. 8.9 and 8.10 apply
above Tier 1 to anything holding production approval, including pre-existing
systems, which are the population most likely to have drifted furthest.

## Required evidence

For alterations: the re-entry stage taken, and any reclassification. For
pre-existing systems: a registry entry with named owner, an assigned tier,
and the date inventoried. For 8.9: the case set, the recorded threshold, and
the dated results of each run. For 8.10: whether the version is pinned or
recorded as uncontrolled.

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
