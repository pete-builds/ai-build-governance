---
title: "07. Production Approval and Records"
parent: "Core Governance Model"
nav_order: 7
---

## Purpose

Authorizes a capability to operate, as an act separate from finishing it, and
maintains an accurate record of what actually exists afterwards.

## Failure this prevents

Two failures. Software arriving in production by gradually being used more,
with nobody having decided. And the slower one: nobody being able to answer
what is running, what it can reach, who owns it, and who would notice if it
broke.

## Requirement

> **REQUIREMENT 7.1**
> Production approval **MUST** be a separate act from completion, with its own
> evidence and its own signer.

> **REQUIREMENT 7.2**
> Production approval requires H5 passed, every authorization condition
> verified individually, a complete registry entry, and a named owner and
> operator who have acknowledged the role.

| Tier | Issued by |
|---|---|
| 1 | Self-issued, within declared scope |
| 2 | A peer who is not the builder |
| 3 | The Final Decision Authority |

> **REQUIREMENT 7.3**
> The approval **MUST** state the authorized envelope: which data classes,
> which population, which tools, which egress paths, and what autonomy level.
> **Operating outside that envelope is operating without approval** and is
> grounds for stop-work.

> **REQUIREMENT 7.4**
> The approval **SHOULD** list what is explicitly **not** authorized,
> naming the near neighbours people will assume are included.

> **REQUIREMENT 7.5 Time-limited approval**
> Pilots **MUST** receive a time-limited production approval carrying a real
> expiry date. On that date exactly one of three things happens: it converts
> to full approval; it is renewed **once** with outstanding conditions
> restated and a named owner accountable; or **it is switched off.**

> **GUIDANCE**
> The third option must be genuinely available or the other two mean nothing.
> Default suggestion: 90 days, renewable once for 90. A pilot needing more
> than six months is unfunded production, and calling it that is more useful
> to everyone. This is the fix for the most durable object in institutional
> computing, the permanent pilot.

> **LOCAL AMENDMENT REQUIRED**
> The 90-day figure is invented and is probably the most arbitrary number in
> the framework.

> **REQUIREMENT 7.6 Operational handover**
> Approval **MUST** name a support commitment: who responds when it breaks,
> during what hours, how they are reached, and expected response time.

> **GUIDANCE**
> An AI capability with no named responder is not complete. It is abandoned in
> advance.

> **REQUIREMENT 7.7 Withheld completion**
> The institution **SHOULD** withhold something until the record is complete.
> The permanent credential, a production budget increase, an announcement, or
> being marked complete on whatever dashboard people care about are all
> acceptable.

> **GUIDANCE**
> This is the mechanism that makes record-keeping actually happen. Without it,
> records are a request. With it, they are a condition of being finished.

> **REQUIREMENT 7.8 The deployed system record**
> Every capability **MUST** have one registry entry, machine-readable, in
> version control, and generated from the platform wherever possible.

| Field | Notes |
|---|---|
| Identifier | Stable, from the Statement of Need |
| Name and plain-language description | For someone unfamiliar |
| Tier, and date last classified | |
| Owner | Standing institutional role |
| Operator | The person actually running it |
| Data classes | As authorized |
| Population and scale | |
| Tools and integrations | With scopes |
| Egress paths | Every one |
| Platform and location | |
| Approval status | Full, time-limited with expiry, or lapsed |
| Last and next record review | |
| Related decision records | |
| **Known limitations** | Plain language, including error behavior |

> **GUIDANCE**
> The last field is the one users benefit from most and the one most often
> omitted. A capability whose documented limitations are honest is one people
> can use safely.

> **REQUIREMENT 7.9**
> Anything that can be generated from the platform **SHOULD** be generated.
> Generated fields cannot drift.

> **REQUIREMENT 7.10 Reconciliation**
> The registry **MUST** be reconciled against reality on a schedule, and
> mismatches treated as findings.

| Mismatch | Meaning |
|---|---|
| In platform, not in registry | Unauthorized work. Chapter 08's pre-existing path applies. |
| In registry, not in platform | Decommissioned without closing the record, or the record was aspirational |
| Scope wider than authorized | Operating without approval |
| Owner no longer employed | Orphan. Escalate immediately. |

> **REQUIREMENT 7.11 Periodic record review**

| Tier | Interval |
|---|---|
| 1 | Annually, or on any trigger change |
| 2 | Every 6 months |
| 3 | Quarterly |

The review asks five questions in order: is it still used; is the record
accurate; has the tier changed; does the owner still exist; and are its
dependencies still supported.

> **GUIDANCE**
> Question one is the most valuable. "No" means decommission, and that
> **SHOULD** be recorded as a success.
>
> Question five has real teeth here. Models are retired on published
> schedules, platforms publish advisories, and pinned components accumulate
> known vulnerabilities. A capability correct at H5 decays without anyone
> touching it.

> **REQUIREMENT 7.12 Decommissioning**
> Closing a record is part of the record. Credentials **MUST** be revoked
> rather than merely unused; budget and pool membership removed; the tool or
> workflow unpublished so nothing can still call it; data retained or
> destroyed per policy with the choice stated; dependent systems identified
> and notified; and the entry marked decommissioned with date and reason and
> **kept**.

> **GUIDANCE**
> Keep decommissioned entries. The history of what an institution tried and
> retired is genuinely useful, not least for answering "why don't we just
> build a thing that does X" for the fourth time.

## Applicability

All tiers. Tier 1 self-issues within declared scope.

## Required evidence

The issued approval with its envelope and exclusions, the verified condition
list, the support commitment, the registry entry, and for time-limited
approvals the expiry date and renewal count.

## Exceptions

> **REQUIREMENT 7.13**
> A capability **MAY** hold production approval while an affirmative
> compliance determination is outstanding, provided the outstanding item is
> named and dated on the approval. See
> [requirement 10.6.4](10-concurrent-reviews.md).

## Implementation guidance

**Why records matter more than review.** Review is a moment. The record is the
only artifact that persists, and it is what answers the questions you will
actually be asked. A capability with no accurate record is ungoverned no
matter how carefully it was reviewed on the way in.

**Record what the platform cannot.** Some facts exist nowhere else. The
clearest example: where a gateway implements shared budget pools by name, the
platform may not store which team owns a pool. That mapping exists **only**
where a human wrote it down, and if the record is lost the information is
simply gone. See [platform profiles](../reference/platform-profiles/).

**On transient builders.** The record has to be good enough that the person
who built it can leave. Any framework implicitly relying on the builder still
being around has not accounted for its own workforce. See
[chapter 09](09-roles.md).

Templates: [production approval](../templates/production-approval.md).
Worked instance: [guide/02-running-example.md](../guide/02-running-example.md),
stage 7, where withheld completion forced the registry entry and a
renegotiated error target was recorded rather than quietly moved.

## Sources and confidence

> **DESIGN JUDGMENT**
> Every interval here is invented, including the 90-day time-limited approval
> and the three review cadences. The separation of approval from completion,
> the withheld-completion mechanism, and the reconciliation table are reasoned
> from construction closeout practice.
>
> **This framework bets heavily on the registry staying accurate**, and that
> bet is untested. Whether a registry survives without enforcement is one of
> the open empirical questions in
> [SOURCES.md](../SOURCES.md).

> **UNVERIFIED**
> The distinction between contractor field markups and the designer's final
> compilation, and the practices behind operational handover and withheld
> completion, are described from standard construction contract practice.
> Primary sources could not be retrieved.
