---
title: "04. Design Review"
parent: "Core Governance Model"
nav_order: 4
---

## Purpose

Someone who did not produce the design reads it against the stated need,
before build effort is sunk.

## Failure this prevents

A design nobody checked against the requirement. And its opposite failure,
which this chapter works equally hard to prevent: a review queue that
becomes the bottleneck.

## Requirement

### Who reviews, and how long they get

> **REQUIREMENT 4.1**
> Design review **MUST** answer one question: does this design deliver the
> Statement of Need, within its tier, with bounded permissions, and with
> understood failure behavior. It **MUST NOT** be a critique of how the
> reviewer would have built it.

> **REQUIREMENT 4.2 Published turnaround**
> Each tier **MUST** have a published turnaround time.

| Tier | Turnaround | If the deadline passes |
|---|---|---|
| 1 | No review | n/a |
| 2 | 3 working days | **Deemed approved.** Proceed and note it. |
| 3 | 10 working days | Escalates to the Decision Authority, who **MUST** either review it or waive to Tier 2 in writing |

> **LOCAL AMENDMENT REQUIRED**
> These numbers are invented. Pick ones you can actually meet.

> **REQUIREMENT 4.3**
> At Tier 2 the reviewer **advises**. The builder **MAY** proceed over an
> unresolved objection provided the objection and the reason for proceeding
> are recorded in a decision record. At Tier 3 the reviewer **MAY** block.

### What the builder submits

> **REQUIREMENT 4.4 Design response contents**
> The builder **MUST** provide, at all tiers above 1:

| # | Item | Why |
|---|---|---|
| 1 | Data flow | Where data originates, every system it crosses, where it rests, where it leaves |
| 2 | Tool and permission inventory | Every tool and credential with scope and justification |
| 3 | Egress inventory | **Every** path by which data can leave |
| 4 | Failure behavior | What state the world is left in when things break |
| 5 | Human oversight point | Where a person can see and intervene, in the running system |
| 6 | Decisions worth recording | Architecturally significant choices, as decision records |

> **REQUIREMENT 4.5**
> At Tier 2 and above the builder **MUST** additionally provide a
> **pre-mortem** (how this failed, who was harmed, what unfair outcomes are
> possible, what assumptions are baked in) and, for anything ingesting
> content the institution does not control, a **prompt injection analysis**.

> **REQUIREMENT 4.6**
> At Tier 3 the builder **MUST** additionally record the alternatives
> considered and rejected, including the do-nothing and non-AI options, and
> the independent reviewer's assessment.

### Dispositions, and what follows

> **REQUIREMENT 4.7 Dispositions**
> Every review **MUST** close with one of four dispositions, and every
> disposition other than Approved **MUST** name what would change it.

| Disposition | Meaning |
|---|---|
| **Approved** | Proceed |
| **Approved as Noted** | Proceed, make the noted changes, no re-review |
| **Revise and Resubmit** | Named items must change and be re-reviewed |
| **Rejected** | The approach will not work. Return to chapter 02. |

> **GUIDANCE**
> "Approved as Noted" **should be the most common outcome by a wide margin.**
> Most findings are real but do not warrant a round trip. A review culture
> that cannot say "yes, and fix these three things" produces either rubber
> stamps or queues.

## Applicability

Tier 2: one peer who is not the builder. Tier 3: one reviewer who does not
report to the builder or the builder's manager.

> **REQUIREMENT 4.8**
> Design review **MUST NOT** require a meeting of more than three people. If
> it does, this chapter has been implemented incorrectly.

Accessibility, security, and privacy review run **concurrently** with this,
not after. See [chapter 10](10-concurrent-reviews.md).

## Required evidence

The design response, the recorded disposition with findings and resolutions,
any unresolved objections proceeded over with their decision records, the
authorization conditions produced, and where used, the note that the
turnaround expired.

## Exceptions

Deemed approval under 4.2 is not an exception and needs no approval. It is a
designed outcome. Frequent use is a **staffing signal**, not a discipline
problem, and the rate **SHOULD** be tracked.

### Asking a question cheaply

> **REQUIREMENT 4.9 Clarification requests**
> A cheap, recorded path **MUST** exist for a builder to ask whether
> something needs re-review, and **SHOULD** be answered within one working
> day.

> **GUIDANCE**
> Without this, builders resolve ambiguity by guessing, and they guess in the
> direction of not asking. Most governance failures that look like defiance
> are unanswered questions.

## Implementation guidance

**Why the reviewer advises rather than approves at Tier 2.** DORA's research
found external approval "had a negative impact on software delivery
performance" and found "no evidence" that formal external review reduced
change failure rates. Recording the disagreement preserves the information
the reviewer generated without paying the cost of a blocking gate. Tier 3
differs because the institution's own exposure is at stake rather than the
team's.

**Why the deemed-approval rule exists.** A review process with no consequence
for its own delay always slides toward being a bottleneck, and the bottleneck
is what the evidence says does the damage. Making silence into approval puts
the cost of slowness on the reviewing function.

> **REQUIREMENT 4.10**
> Deemed approval under 4.2 grants **permission to proceed only**. It
> **MUST NOT** be recorded as a compliance determination. See
> [requirement 10.6](10-concurrent-reviews.md).

**What this is not.** Not a security assessment: that happens against the
running system in [chapter 06](06-inspections.md) and is mostly automated. A
reviewer reading a diagram cannot tell you whether credentials are actually
scoped correctly.

**On item 3.** The egress inventory is the highest-value artifact in the
packet. Drawing it honestly is frequently what reveals the tier was wrong,
and an unlisted egress path discovered during inspection is a finding rather
than a surprise.

Template: [Template: Design Review](../templates/design-review.md).
Decision records: [Template: Decision Record (ADR)](../templates/adr.md).

## Sources and confidence

> **VERIFICATION NOTE** (2026-08-04)
> The DORA quotes were fetched and verified verbatim. The decision record
> format follows Michael Nygard's 2011 post, fetched and confirmed, including
> its "architecturally significant" scoping rule and the mark-superseded
> convention.

> **DESIGN JUDGMENT**
> The four dispositions are adapted from construction submittal review. The
> turnaround numbers, the deemed-approval rule, and the three-person meeting
> limit are reasoned, not measured. The deemed-approval mechanism resembles
> the Rust RFC final comment period, which resolves to merge, close, or
> postpone on a fixed clock.
