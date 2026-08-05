---
title: "09. Roles and Authority"
parent: "Core Governance Model"
nav_order: 9
---

## Purpose

Assigns responsibility to named parties, so that when something fails it is
knowable who was accountable.

## Failure this prevents

Ownership evaporating when a builder leaves. In an institution that builds
with students, fellows, and fixed-term staff, this is not an edge case: it is
the default trajectory of every project.

## Requirement

### The Final Decision Authority

> **REQUIREMENT 9.1 Final Decision Authority**
> The institution **MUST** name the office that can refuse a build and be
> obeyed. It **MUST** be reachable within one working day, **MUST** be able to
> order stop-work, **SHOULD** be one or two named people with a documented
> deputy, and **MUST NOT** be the builder. At Tier 3 it **MUST NOT** be a
> party the builder reports to.

> **GUIDANCE**
> This role is called the *authority having jurisdiction* in the construction
> analogy, defined by function rather than job title because local
> enforcement structures differ too much for a fixed title to work. That is
> exactly why it suits universities.
>
> If no such office exists, that is the finding. This framework cannot
> substitute for it. A code with no decision authority is a style guide.

> **REQUIREMENT 9.2 No new committee**
> The Decision Authority **MUST** be an operational office, not a
> deliberative body. Where the institution already has an AI policy body, the
> framework **MUST NOT** create a second one.

| Layer | Answers | Typical body |
|---|---|---|
| Policy | What is permissible here at all | Existing AI council |
| Investment | What gets funded | Existing IT governance process |
| **Operational** | **Does this build meet the requirements** | **The Decision Authority** |

> **GUIDANCE**
> A Decision Authority that meets monthly to discuss submissions has become
> the review board this framework exists to avoid. See
> [Appendix C: The Evidence on Gates](../reference/evidence-on-gates.md).

### The Responsible Builder

> **REQUIREMENT 9.3 Responsible Builder**
> Every capability above Tier 1 **MUST** have a named Responsible Builder who
> signs the design response, asserting that they understand what the system
> can reach and do, that the declared inventories are complete to the best of
> their knowledge, and that they will be reachable when it misbehaves or have
> named who will be.

> **REQUIREMENT 9.4**
> The institution **MUST NOT** attach personal legal liability to the
> Responsible Builder signature.

> **GUIDANCE**
> This is where the construction analogy breaks and it matters. A licensed
> engineer's seal creates personal liability, and that is fair because
> licensure, standardized examination, continuing education, disciplinary
> boards, and professional insurance exist behind it. None of that
> infrastructure exists for AI engineering. Borrowing the consequence without
> the infrastructure would punish individuals for systemic failures and would
> make people refuse to sign.
>
> What the signature buys is **a name to ask, not a person to blame.**

> **REQUIREMENT 9.5 The two-signature rule**
> Every capability above Tier 1 **MUST** carry two names.

| Role | May be fixed-term? | Persists after the builder leaves? |
|---|---|---|
| **Responsible Builder** | Yes | No |
| **Standing Owner** | **No. MUST be a continuing appointment.** | **Yes** |

> **REQUIREMENT 9.6**
> A capability without a Standing Owner **MUST NOT** receive production
> approval above Tier 1.

> **GUIDANCE**
> This will be unpopular, because it asks someone with a permanent role to
> accept ongoing responsibility for work they did not do, and there are never
> enough of those people. **That constraint is information.** If no Standing
> Owner can be found, the institution does not have capacity to operate the
> thing, and it is better to learn that at design review than at graduation.

### Independent review

> **REQUIREMENT 9.7 Independent reviewer**
> At Tier 3, review **MUST** be performed by someone who does not report to
> the builder or the builder's manager.

> **GUIDANCE**
> Borrowed from the construction practice of independent inspection engaged
> by the owner rather than the contractor, so the inspector is not paid by
> the party being inspected. Independence is a structural property. It cannot
> be achieved by asking someone to be objective.

### Credentials, and departure

> **REQUIREMENT 9.8 Credential lifecycle**
> Credentials issued to a fixed-term appointment **MUST** expire no later
> than that appointment. Institutional work **MUST NOT** be performed on
> personal accounts. Offboarding **MUST** revoke rather than merely stop
> using, including group and shared-pool memberships.

> **GUIDANCE**
> The expiry rule is the single most effective control available for a
> transient workforce, and it is usually free to configure. Pool memberships
> are the ones routinely missed at offboarding, because they are not visible
> from the credential itself.

## Applicability

All tiers for 9.1 and 9.2. Above Tier 1 for 9.3 through 9.6. Tier 3 for 9.7.
All personnel for 9.8.

## Required evidence

| Artifact | Demonstrates |
|---|---|
| Named Decision Authority and deputy, published | 9.1 |
| Responsible Builder signature on the design response | 9.3 |
| Standing Owner acknowledgement on the production approval | 9.5, 9.6 |
| Independent reviewer's confirmation of non-reporting relationship | 9.7 |
| Credential expiry matching appointment end dates | 9.8 |
| Departure-triggered record review | see below |

## Exceptions

None for 9.6. A capability that cannot find a Standing Owner **MAY** proceed
under a time-limited production approval as an explicitly labelled
experiment, which is a different thing from an exception.

## Implementation guidance

**Handover as a deliverable.** Where a roll-on, roll-off model exists, the
registry entry **is** the handover document. If it is accurate, handover is
possible. If it is not, handover is archaeology.

> **REQUIREMENT 9.9**
> Departure of a Responsible Builder **MUST** trigger a record review, and
> the incoming operator **SHOULD** run the system while the outgoing builder
> is still reachable.

**The Governance Platform Team.** The office that maintains the framework,
publishes turnaround times, keeps the registry, runs the automated checks,
and holds the templates. Its most important work is not enforcement.

> **GUIDANCE**
> A governance platform team that spends its time reviewing is failing. One
> that spends it making the compliant path the easy path is succeeding. See
> [principle 1.1](01-principles.md).

**Summary.**

| Role | Count | Tenure | Cannot be |
|---|---|---|---|
| Final Decision Authority | 1 or 2 plus deputy | Continuing | The builder |
| Responsible Builder | 1 per capability | Any | Anonymous |
| Standing Owner | 1 above Tier 1 | **Must be continuing** | Fixed-term |
| Independent reviewer | 1 per Tier 3 | Any | Reporting to the builder |
| Governance Platform Team | 1 office | Continuing | Primarily a reviewer |

The two rows worth arguing about in your amendments are Standing Owner and
independent reviewer, because both consume scarce continuing-staff capacity.
Have that argument explicitly. Resolving it by quietly dropping the
requirements means Tier 3 does not exist, and saying so is better than
discovering it later.

## Sources and confidence

> **VERIFICATION NOTE** (2026-08-04)
> The professional-seal liability substance is well attested. The specific
> NCEES rule numbering could not be confirmed and is not cited.

> **DESIGN JUDGMENT**
> The two-signature rule is structural reasoning about a transient workforce,
> not evidence. **No published higher-education practice on student-builder
> credential lifecycle or knowledge transfer was located**, which is a genuine
> gap in the literature rather than a gap in this search.

> **UNVERIFIED**
> The construction independent-inspection arrangement, including owner
> engagement of the inspector, is described from standard practice; primary
> sources could not be retrieved.
