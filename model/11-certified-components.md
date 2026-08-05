---
title: "11. Certified Reusable Components"
parent: "Core Governance Model"
nav_order: 11
---

## Purpose

Lets a capability that has already been checked be consumed by others without
being checked again, so that only the new integration is reviewed.

## Failure this prevents

**Reuse being harder than rebuilding.** Without this, the second group to want
a component enters the process at the beginning, the component is reviewed
again by different people against the same standard reaching the same
conclusion, and the originating team becomes an unpaid help desk. Since
rebuilding is then faster than adopting, people rebuild, and the institution
now governs four unreviewed copies of the same thing.

That is the failure people actually experience. It is worse than a bad gate,
because it punishes reuse specifically.

## Requirement

### What certification does, and does not do

> **REQUIREMENT 11.1**
> A component **MAY** be certified once, against published criteria, by a
> party independent of the builder. Consumers then inherit the certification
> and **only the integration is inspected**.

> **REQUIREMENT 11.2 Certification and classification are separate axes**
> Certification reduces **component** review. It **MUST NOT** lower a tier.

| Axis | Question | Reduced by certification? |
|---|---|---|
| **Component risk** | Is this thing built soundly? | **Yes.** That is what certification is for. |
| **Use risk** | What will this instance touch, decide, and affect? | **No. Never.** |

> **REQUIREMENT 11.3**
> A conforming instance **MUST** be classified in full against its own data
> classes, autonomy, blast radius, audience, consequential decisions,
> integrations, and external communication, per
> [chapter 03](03-classification.md).

> **GUIDANCE**
> An earlier edition got this wrong and said a conforming instance entered at
> Tier 1 regardless of its own triggers. That was a loophole: a certified
> scaffold could have carried education records, informed employment
> decisions, or held all three legs of the lethal trifecta and still entered
> at Tier 1 because the scaffold had a certificate.
>
> **EXAMPLE**
> The same certified read-only server over an internal API, pointed at two
> corpora:
>
> - Over a **public course catalog**, one unit: Tier 1 or 2 on its own
>   triggers, component review skipped. Fast.
> - Over **education records**, staff-facing: **Tier 3** on data
>   classification, component review still skipped. Design review covers the
>   corpus, the access model, and who sees what, not the server.
>
> Same component. Different tiers. Correctly.

### What a certification must state

> **REQUIREMENT 11.4 What a certification must state**

| Field | Why |
|---|---|
| Identifier and **version** | Certifications attach to versions, never to "latest" |
| **Scope of certification** | What it was checked to do, in plain language |
| **Tier ceiling** | The highest tier this certification supports |
| Data classes permitted | What it was checked to handle |
| Tools and egress | Everything it can reach |
| Tested configuration | The exact configuration checked, including versions |
| **Conditions of use** | What a consumer must do for it to apply |
| **Exclusions** | What it was explicitly **not** checked for |
| Certifying party | Never the builder |
| Inspection record | Which points it passed, and when |
| **Surveillance interval and next review** | When it stops being trusted |
| **Expiry** | |

> **GUIDANCE**
> A certification that says "approved" without saying approved *for what* is
> worse than nothing, because it invites use outside the conditions it was
> checked under.

### Consuming a certified component

> **REQUIREMENT 11.5 Consuming a certified component**
> The consumer **MUST** confirm the certification exists, is current, and has
> not expired; that the **version** consumed is the certified version; that
> the use is within scope and violates no stated exclusion; that their tier
> does not exceed the tier ceiling; that their data classes are permitted;
> and that every condition of use is met. They then **MUST** inspect their
> integration and **MUST NOT** re-review the component's internals.

> **REQUIREMENT 11.6**
> Use outside the certified terms **voids reliance on the certification**, and
> the full path applies.

> **GUIDANCE**
> Broader credential than the certification assumed, higher tier than its
> ceiling, excluded data classes, or an uncertified version means you are not
> consuming a certified component. You are consuming an unreviewed one.

### Who certifies, and keeping it alive

> **REQUIREMENT 11.7 Who may certify**
> Certification authority **MUST NOT** rest with the builder. It sits with the
> Final Decision Authority or a function it designates, and at Tier 3 the
> certifying reviewer **MUST** be independent of the originating team.

> **REQUIREMENT 11.8 Surveillance and expiry**
> Every certification **MUST** carry a surveillance interval and an expiry
> date.

| Tier ceiling | Surveillance | Expiry |
|---|---|---|
| 1 | Annual | 24 months |
| 2 | 6 months | 18 months |
| 3 | Quarterly | 12 months |

> **LOCAL AMENDMENT REQUIRED**
> These intervals are invented. Set your own, and only offer certification if
> you can staff the surveillance.

Surveillance re-checks the five things most likely to have decayed: whether
the certified version is still in use; whether dependencies acquired
published vulnerabilities; whether the interface or tool definitions changed;
whether the originating owner still exists; and whether the model or platform
underneath changed behavior.

> **REQUIREMENT 11.9**
> Drift in a tool definition after certification **MUST** invalidate the
> certification immediately.

> **REQUIREMENT 11.10**
> When a certification lapses or is revoked, **every consumer MUST be
> notified**, which requires consumption to be recorded in the registry rather
> than informal.

> **GUIDANCE**
> A revoked certification with unknown consumers is an incident you cannot
> execute.

### Certified patterns

> **REQUIREMENT 11.11 Certified patterns**
> Where a pattern recurs, the **pattern** itself **MAY** be certified, and
> conforming instances then skip component review entirely. Classification
> still runs in full per 11.3. Departure from the pattern means the pattern
> does not apply and full component review resumes.

## Applicability

Any reusable thing with a stable interface and a definable scope: a server and
its tools, a retrieval index over a defined corpus, an Agent Studio
subworkflow or template, an agent scaffold with known behavior, a credential
pattern with fixed configuration, a validated dataset, or an authorization
pattern.

## Required evidence

The certification record with all 11.4 fields; per consumer, the confirmation
checklist from 11.5 and a recorded dependency on the certification; and the
surveillance history.

## Exceptions

None to 11.2. Certification never lowers a tier, and there is no exception
path for that because it is the safeguard the chapter exists around.

## Implementation guidance

**Why this works.** Nobody re-tests a fire-rated door assembly in every
building. It was tested once against a published standard by a competent
party and carries a mark. The official confirms the mark, confirms the
installation matches the terms, and moves on.

The mechanism has four parts, and the fourth is the one that gets dropped:
published criteria, testing by a competent independent party, a report stating
the **scope** of what was certified, and **ongoing surveillance**.

> **VERIFICATION NOTE** (2026-08-04)
> ICC Evaluation Service runs the full pattern for novel products where the
> code is silent: it develops acceptance criteria, tests against them, issues
> an evaluation report that building departments rely on, and conducts ongoing
> inspection and surveillance ([ICC-ES](https://icc-es.org/)). The
> surveillance part is why such a report is not a rubber stamp.

**The byproduct nobody expects.** Because certifications are referenced rather
than copied, the institution learns how many things depend on a given
component. Certification produces a dependency graph for free.

**The certified-pattern route is the strongest form.** It is the paved road
from [principle 1.1](01-principles.md) with a certificate attached, and the
most direct route to governance that speeds work up. The scaffold is an
approved **component**. It is never an approved **use**.

Worked instance: [Running Example: The Payment Inquiry Agent](../guide/02-running-example.md),
stage 8, which shows consumption in both directions and a second consumer
correctly landing at a *lower* tier than the original.

## Sources and confidence

> **VERIFICATION NOTE** (2026-08-04)
> ICC-ES's evaluation-report mechanism including ongoing surveillance was
> fetched and confirmed.

> **UNVERIFIED**
> The code definitions of "listed," "labeled," and "approved agency"; the rule
> that an official accepts a certification without retesting and inspects only
> the installation; and state-level approval of factory-built designs. Shape
> sound, details unconfirmed. See [the source ledger](../SOURCES.md).

> **DESIGN JUDGMENT**
> Every interval and expiry figure, the tier-ceiling concept, and the
> void-on-departure rule are reasoned rather than measured.
>
> **This is the most gameable mechanism in the framework.** A certification
> granted casually, never surveilled, and cited widely is a single point of
> institutional trust with nobody looking at it, and it would be worse than
> the queue it replaced. If you adopt one thing from this chapter, adopt the
> surveillance interval and the expiry date. They are what make the rest safe.
