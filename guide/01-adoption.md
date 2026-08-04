---
title: "01. Adoption"
parent: "Implementation Guide"
nav_order: 1
---

> **Part II: handbook. Non-binding.** How to stand this up at an
> institution. The requirements are in [Part I](../model/).

The failure mode to design against is not under-adoption. It is adopting
the paperwork without the platform work, which produces forms nobody can
satisfy and a governance function everyone routes around.

---

## Before anything: can you actually staff it?

Answer honestly, because three of these gate the rest.

| Question | If no |
|---|---|
| Is there an office that can say no and be obeyed? | Stop. A code with no [Final Decision Authority](../model/09-roles.md) is a style guide. Fixing that is the whole first project. |
| Can you build templates and automated checks, not just write policy? | Adopt the inspections and skip intake for now. Without platform capacity you will end up with forms. |
| Can you supply continuing-appointment Standing Owners? | Tier 3 is effectively capped at zero. Say so out loud and plan for time-boxed occupancy instead. |
| Do you already have an AI policy body? | Good. **Do not create another one.** This sits beneath it. |

The three-layer split that keeps this from becoming a turf fight:

| Layer | Question | Typical existing body |
|---|---|---|
| Policy | What is permissible here at all | AI council or equivalent |
| Investment | What gets funded | IT governance or capital process |
| **Operational** | **Does this specific build meet the code** | **This model. Usually a platform team.** |

---

## Sequence

Deliberately ordered so the first visible thing you ship is a service, not
a requirement. People forgive a slow gate; they do not forgive a gate that
arrived before the help.

### Phase 1: Automated inspections, read-only

Build the [H1](../model/06-inspections.md) checks against what you already
run: credential expiry set, budgets hard-capped, model allowlists explicit,
no wildcard scopes, no secrets in source.

Run them read-only. **Publish the results as a baseline, not as findings
against people.** This costs nothing politically and immediately tells you
the shape of your exposure.

### Phase 2: Amnesty inventory

Register everything already running, with a named owner and **no penalty
for having existed**. Per [chapter 08](../model/08-alterations.md), existing
work is pre-existing and complies on alteration.

Any penalty attached to disclosure buys you an inaccurate inventory, which
is worse than none because it gets believed. This is the single
highest-value step in the whole adoption.

Report the ratio of conforming to non-conforming over time. That is the
honest adoption metric. Counting authorizations issued is not.

### Phase 3: Close your platform unknowns

Fill in the platform reality table in the
[amendments template](../templates/amendments-template.md), starting from
the [platform profiles](../reference/platform-profiles/) and then verifying
against **your own instance and license tier**.

Expect to find that two or three controls you assumed you had are
enterprise-gated or simply absent. That is the point of the exercise.

### Phase 4: Intake, minimally

Add the four fields that set tier to whatever intake you already have:
declared data classes, authorization tier, Standing Owner, and cost centre. Do not
build a new intake system. Do not replace a working portfolio tracker.

### Phase 5: The concealment gate, new builds only

Introduce [H4](../model/06-inspections.md) for new Tier 2 and Tier 3 work.
**Do not apply retroactively.** This is the one gate worth a person's time,
and introducing it alone, on new work only, is how it gets accepted.

### Phase 6: List your first component

Take one finished, validated thing through
[listing](../model/11-certified-components.md) end to end. One worked example
demonstrates that this framework speeds reuse up rather than slowing builds
down, which is the argument you will need to make repeatedly.

### Phase 7: Delete

After two terms, delete every gate that never caught anything and **publish
which ones those were**. [Principle 3](../model/01-principles.md) requires
this and it is the step most likely to be skipped. A code that only grows
is a code that will be evaded.

---

## A sample operating model

> **EXAMPLE**
> One shape that works at a mid-size institution. Not a requirement.

| Role | Who | Time |
|---|---|---|
| Final Decision Authority | Platform team lead plus a named deputy | Occasional |
| Governance platform team (runs the process) | One platform engineer, part time | Roughly 0.3 FTE |
| Tier 2 design review | Any technical lead not on the project | 1 to 2 hours per review |
| Tier 3 independent review | Rotating pool from other units | 2 to 3 hours per review |
| Certifying function for certifications | Decision Authority | A few hours per listing, plus surveillance |
| Accessibility, security, privacy | Existing offices, concurrent | Their own capacity |

The 0.3 FTE is the honest cost of the automation and the registry, and it
is the line item most likely to be cut. If it is cut, adopt the inspections
only and say plainly that intake and listing are unstaffed.

---

## What to expect to go wrong

> **DESIGN JUDGMENT**
> Predictions, not observations. Nobody has run this yet.

**The reviews will become serial anyway.** Concurrency is a scheduling
discipline, and schedules erode. Watch for the second discipline waiting on
the first, and treat it as a defect in the process rather than a delay in
the project.

**Deemed permission will be used and someone will call it a loophole.** It
is not: [requirement 10.6](../model/10-concurrent-reviews.md) bounds it
tightly and forbids it producing a compliance determination. Frequent use
means you are understaffed, and the number is the argument for resourcing.

**Someone will ask to skip classification for a certified component.** The
answer is no, and
[chapter 11](../model/11-certified-components.md) explains why: certification
reduces component review and never lowers a tier.

**The registry will drift.** Generate what you can from the platforms;
anything generated cannot drift. Reconcile on a schedule and treat
mismatches as findings.

**Certifications will go stale and nobody will notice.** This is the most
dangerous failure in the model, because a stale listing is trusted
silently. The surveillance interval and the expiry date are what make
listing safe rather than a rubber stamp. If you cannot staff surveillance,
do not offer listing.

---

## Recording your adoption

Use the [amendments template](../templates/amendments-template.md). Name the
edition you adopted, record what you deleted and why, and keep the document
as a delta rather than a fork so you can see what changed when a new edition
ships.

Publishing your amendments, even without internal specifics, is the most
valuable contribution this project can receive. It is a design hypothesis
until somebody reports turnaround performance, exception rates, and failure
cases from real use.
