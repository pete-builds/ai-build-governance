---
title: The model on one page
nav_order: 2
---

# The model on one page

Everything binding, condensed. Print it, hand it to a committee, put it on a
wall. Chapter numbers link to the requirement that actually binds.

Edition **2026.6**. Full text: [core governance model](model/). Every page:
[contents](contents.md). Every requirement: [index](reference/requirement-index.md).

---

## Start here, not at step 1

**Can you reuse something already certified?** If yes, confirm the
certification is current, that your version matches, that your tier does not
exceed its ceiling, and that you break no stated exclusion. Then inspect
**only your integration** and skip the component entirely
([chapter 11](model/11-certified-components.md)).

This is the shortest path through the framework and the one most likely to be
missed, because it is the only path that gets faster the more the institution
governs. If reuse is harder than rebuilding at your institution, nothing else
on this page will save you.

---

## If you are building something new: the sequence

| # | Do this | Chapter | The failure it prevents |
|:--|:--|:--|:--|
| 1 | **Establish the need** before choosing a solution | [02](model/02-statement-of-need.md) | Building the wrong thing, solution-first |
| 2 | **Classify** from stated triggers, highest wins | [03](model/03-classification.md) | Risk decided by reviewer mood |
| 3 | **Review the design** against the need, timeboxed | [04](model/04-design-review.md) | A design nobody read against the requirement |
| 4 | **Authorize the build**, with conditions and an expiry | [05](model/05-authorization-to-build.md) | Approval becoming a permanent entitlement |
| 5 | **Verify** at five points, before behavior is hidden | [06](model/06-inspections.md) | Verification after the evidence is gone |
| 6 | **Approve for production** as an act separate from finishing | [07](model/07-production-approval.md) | Shipping treated as approval |
| 7 | **Record what exists**, not what was planned | [07](model/07-production-approval.md) | Nobody knowing what is running |
| 8 | **Reassess when it changes**, and on an interval when it does not | [08](model/08-alterations.md) | Change that silently outruns its review |

## Running throughout, not stages

| | Chapter | Why it is not a step |
|:--|:--|:--|
| **Principles** | [01](model/01-principles.md) | Nine rules the rest is tested against. Where a chapter conflicts, the principle wins. |
| **Roles and authority** | [09](model/09-roles.md) | Someone must hold this from before step 1 until decommissioning |
| **Concurrent reviews** | [10](model/10-concurrent-reviews.md) | Accessibility, security, and privacy run **alongside**, never as a relay of queues |
| **Certified components** | [11](model/11-certified-components.md) | Both an output of finishing and the entry point above |
| **Delegated authority** | [12](model/12-delegated-authority.md) | Applies whenever an agent acts for a human, at any stage |
| **Third-party components** | [13](model/13-third-party.md) | Applies whenever a build depends on something you do not operate |

---

## The tiers

| Tier | Design review | Verification | Production approval |
|:--|:--|:--|:--|
| **1** | Self-certified | Automated only | Self-issued |
| **2** | Peer review, timeboxed | Automated plus one human point | Issued by a peer |
| **3** | Independent reviewer, off the project | Full set, human sign-off | Final Decision Authority |

**Six triggers, worked in order. Highest wins. Never lower a tier because most
answers were low** ([chapter 03](model/03-classification.md)).

| | Trigger | Tier 3 when |
|:--|:--|:--|
| A | Data classification *(substitute your own scheme)* | Regulated or specially protected data. A forbidden class is **not permitted**, which is not a tier. |
| B | **Lethal trifecta**: private data, untrusted content, external communication | All three. The remedy is usually to remove a leg. |
| C | Autonomy | Consequential action with no per-action approval. Self-modifying tools or permissions: Tier 3 plus explicit sign-off. |
| D | Blast radius | The whole institution, or anyone outside it positioned to be harmed |
| E | **Consequential decisions about people**: admission, grading, aid, hiring, promotion, discipline, accommodation, service access | Always. "It is only advisory" does not work. If the override rate is not measured, assume it decides. |
| F | Unbounded cost | Tier 2 minimum with no hard cap. The cap is an authorization condition. |

---

## The five verification points

Each must pass in order. H3 requires H1 and H2 recorded as passed.

| | Point | Checked before |
|:--|:--|:--|
| **H1** | Identity and credentials | any real data moves |
| **H2** | Connections, permissions, egress | wiring to real systems of record |
| **H3** | End-to-end path | going further, using synthetic data and a genuinely broken dependency |
| **H4** | **Pre-concealment** | behavior becomes hidden behind an interface, a schedule, or a removed confirmation step |
| **H5** | Final verification | production approval, with rollback **exercised** rather than documented |

**H4 is the most important gate in the framework.** Human sign-off is required
there at Tier 2 and above. Most other cells are automated, and that is the
design working rather than a gap.

---

## The artifacts

The completed artifact is the evidence. Nothing here is satisfied by a
description of itself.

Statement of Need · Design Review · Decision record · Authorization to Build ·
Inspection records H1 to H5 · Production Approval · Deployed System Record
(registry entry) · Certification, where a component is reused ·
Recorded exceptions · [Templates for all of them](templates/)

---

## What this framework refuses to do

- **It will not put a review board in front of your deploys.** Gates sit at
  irreversibility, not at milestones. A recurring inspection meeting is a
  change advisory board that has not admitted it yet.
- **It will not document a control your platform does not enforce.**
  Documented false assurance is worse than an acknowledged gap, because it
  stops people looking.
- **It will not let a certification lower a tier.** Certification reduces
  component review. Classification always runs in full.
- **It will not let a missed deadline produce a compliance determination.** A
  turnaround expiry can grant permission to proceed. Accessibility conformance
  and lawful-basis findings are never deemed.
- **It will not make you compliant with anything.** Where law applies, it cites
  the provision and stops.

---

## Adopting it

1. **Name your Final Decision Authority.** The office that can say no and be
   obeyed. If none exists, that is the finding.
2. **Establish which governance pattern you already are**, because each fails
   at this differently ([adoption](guide/01-adoption.md)).
3. **Map the tiers to your own data classification.** Every
   `LOCAL AMENDMENT REQUIRED` label is a decision left to you.
4. **Delete what you cannot enforce.**
5. **Start with inspections, not intake.** Automated checks on what you already
   run pay off fastest and are least resented.
6. **Publish the five numbers** in
   [requirement 1.9](model/01-principles.md), because nobody has, and they are
   what would tell anyone whether this works.

Record your adoption as a delta against this edition using the
[amendments template](templates/amendments-template.md).
