---
title: "10. Concurrent Reviews"
parent: "Core Governance Model"
nav_order: 10
---

## Purpose

Runs the accessibility, security, and privacy reviews alongside design review
rather than after it.

## Failure this prevents

Review becoming a relay of queues, in which accessibility waits for security,
which waits for privacy, and the builder waits for all three in sequence. The
complaint people actually have about institutional review is rarely that it
happens. It is that it happens **serially**.

## Requirement

> **REQUIREMENT 10.0 The concurrency rule**
> Accessibility, security, and privacy review **MUST** run concurrently
> with design review, against published standards, on one clock. They **MUST
> NOT** be sequenced after it or after each other.

### One submittal, one clock

> **REQUIREMENT 10.1**
> One submittal, several reviewers, one clock. Every engaged discipline
> **MUST** receive the design response at the same time.

> **REQUIREMENT 10.2**
> Each discipline **MUST** review against a **published standard**, not a
> preference. A reviewer with no standard to cite is offering an opinion, and
> the institution **SHOULD** either publish the standard or drop the review.

> **REQUIREMENT 10.3**
> Each discipline **MUST** publish a turnaround time and **MUST** be
> accountable for missing it.

> **REQUIREMENT 10.4**
> Every finding **MUST** name what would resolve it. A finding the builder
> cannot act on is not a finding.

> **REQUIREMENT 10.5**
> Disagreement between disciplines **MUST** be resolved by the Final Decision
> Authority, not by the builder. Making a builder mediate between two
> institutional functions is how projects stall for months.

### Permission versus determination

**The clock can grant permission. It cannot grant absolution.** This is the
distinction an earlier edition got wrong, and it is the most important thing in
the chapter.

> **REQUIREMENT 10.6 The permission and determination rule**
> A missed turnaround **MAY** produce administrative permission to proceed. It
> **MUST NOT** produce a compliance determination.

| | Administrative permission to proceed | Compliance determination |
|---|---|---|
| Means | The build may continue to the next stage | The obligation is satisfied |
| A missed turnaround can produce it? | **Yes**, at Tier 2 | **Never** |
| Who can produce it | The reviewing function, or the clock | Only the accountable office, affirmatively |
| Recorded as | "Proceeded on turnaround expiry, date" | A signed determination |

> **REQUIREMENT 10.6.1**
> Accessibility conformance **MUST NOT** be deemed. A missed turnaround lets
> the build proceed; it does not make the build conformant, and it does not
> transfer the obligation to the builder.

> **REQUIREMENT 10.6.2**
> Privacy and lawful-basis determinations **MUST NOT** be deemed.

> **REQUIREMENT 10.6.3**
> Security clearance **MAY** be deemed at Tier 2 only, and **MUST NOT** be
> deemed for any build meeting the institution's escalation criteria. Those
> escalate and wait.

> **REQUIREMENT 10.6.4**
> A capability **MAY** hold a production approval while an affirmative
> determination is outstanding, provided the outstanding item is **named and
> dated on the approval**.

> **REQUIREMENT 10.7**
> Documentation of a known gap **MUST NOT** be recorded as satisfying the
> underlying obligation. Recording improves management and accountability. It
> does not make a non-conforming system conforming.

> **LOCAL AMENDMENT REQUIRED**
> Turnaround time per discipline, and the security escalation criteria under
> 10.6.3. The model deliberately does not set these, because they depend on
> staffing you have and obligations that bind you.

## Applicability

Applies at Tier 2 and above. At Tier 1 these reviews are not required,
though the classification triggers that would raise the tier still apply.

A discipline is engaged only where implicated:

| Discipline | Engaged when |
|---|---|
| Accessibility | The build has a user interface **or** produces content a person reads |
| Security | Always at Tier 2 and above |
| Privacy | Any data class above the institution's lowest |

> **GUIDANCE**
> One person may hold several disciplines at a small institution. That is
> normal. What matters is that the standards are published and the reviews
> share a clock, not that there are separate people.

## Required evidence

| Artifact | Demonstrates |
|---|---|
| Dated disposition per engaged discipline | 10.1, 10.3 |
| Named standard cited in each disposition | 10.2 |
| Findings list with resolutions | 10.4 |
| Affirmative determinations, signed, where required | 10.6.1, 10.6.2 |
| "Proceeded on turnaround expiry" note, where used | 10.6 |
| Outstanding determinations named on the approval | 10.6.4 |

## Exceptions

A discipline **MAY** be waived where plainly not implicated, with a one-line
recorded reason. "No user interface and no user-facing output" is a
sufficient accessibility waiver. "We are in a hurry" is not.

Deemed permission under 10.6 is not a recorded exception and needs no
approval. It is a designed outcome, and frequent use is a **staffing signal**
rather than a discipline problem. Track the rate, which
[requirement 1.9](01-principles.md) requires you to publish.

## Implementation guidance

Borrowed from how building design review actually works: a submittal goes to
building, structural, fire, mechanical, electrical, plumbing, and
accessibility **at once**. Each checks against its own code. The authorization
issues when all clear. Nobody waits in the fire marshal's queue for the
structural reviewer to finish.

The deemed-permission rule exists because a review process with no
consequence for its own delay slides toward being a bottleneck, and
[the evidence](../reference/evidence-on-gates.md) says the bottleneck is
what does the damage. Putting the cost of slowness on the reviewing
function rather than on the builder is the point.

But it is bounded deliberately. The evidence behind deemed approval concerns
**change approval and delivery performance**. It says nothing about
statutory duties, and a legal obligation does not lapse because a reviewer
had a backlog. An earlier edition of this model blurred that and was wrong.

Practical guidance per discipline is in the implementation guide:
[accessibility](../guide/04-accessibility.md) and
[security and privacy review](../guide/05-security-and-privacy-review.md).
Worked instance in [the running example, stage 4](../guide/02-running-example.md).

## Sources and confidence

> **VERIFICATION NOTE** (2026-08-04)
> The DORA findings underlying timeboxing were fetched and quoted verbatim,
> including the nuance that peer review is the endorsed substitute rather
> than the absence of review. See
> [evidence on gates](../reference/evidence-on-gates.md).

> **DESIGN JUDGMENT**
> The concurrency requirement, the permission-versus-determination split,
> and the Decision Authority as tie-breaker are reasoned from how
> multi-discipline construction design review works. No study was located
> comparing concurrent against serial institutional review.

> **UNVERIFIED**
> The multi-discipline structure of building design review is described from
> standard practice; primary code sources could not be retrieved. See the
> known-unreachable list in [the source ledger](../SOURCES.md).
