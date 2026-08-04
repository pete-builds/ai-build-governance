---
title: "Template: Production Approval"
parent: "Templates"
nav_order: 8
---

> Copy this file. The metadata block below is part of the template:
> fill it in at the top of your copy.

```yaml
id: CO-YYYY-NNN
type: full | temporary
statement_of_need: SON-YYYY-NNN
plan_review: PR-YYYY-NNN
tier:
issued:
expires:            # REQUIRED for temporary. Blank for full.
registry_id:
```

# Production Approval

> **"It works" and "it may operate" are different events with different
> evidence and different signers.** This document is the second one.
>
> For a pilot, issue a **temporary** certificate with a real expiry date.
> "Pilot" is otherwise the most durable state in institutional
> computing.

---

## Capability

| | |
|---|---|
| Name | |
| Registry ID | |
| Tier | |
| Responsible Builder | |
| Standing Owner | *(required above Tier 1, must be a continuing appointment)* |
| Platform and location | |

---

## Authorized envelope

> **Operating outside this envelope is operating without a certificate**,
> and is grounds for a stop-work action. This is what makes the scope
> statement enforceable rather than decorative. Be specific.

| | Authorized |
|---|---|
| Data classes | |
| Population served | |
| Approximate scale | |
| Tools and integrations | |
| Egress destinations | |
| Autonomy level | produces output / acts with per-action approval / acts without per-action approval |

**Explicitly NOT authorized:**

> List the near neighbours people will assume are included. This section
> prevents the most common scope creep.

---

## Prerequisites verified

- [ ] H1 Identity and Credentials passed. Date: ______ By: ______
- [ ] H2 Connections and Permissions passed. Date: ______ By: ______
- [ ] H3 End-to-End Path passed. Date: ______ By: ______
- [ ] H4 Pre-Concealment passed. Date: ______ By: ______
- [ ] H5 Final Verification passed. Date: ______ By: ______

### Authorization conditions

> Each verified individually. Not as a block.

| Condition | Verified | Date | By |
|---|---|---|---|
| | [ ] | | |

### Records

- [ ] Registry entry complete: owner, operator, data classes, tools,
      egress, tier, review date
- [ ] Known limitations documented in plain language
- [ ] Rollback **exercised**, not merely documented
- [ ] Someone other than the builder has operated it successfully

---

## Support commitment

> Construction's operational handover starts the warranty. An AI
> capability with no named responder is not complete, it is abandoned in
> advance.

| | |
|---|---|
| Who responds when it breaks | |
| During what hours | |
| How they are reached | |
| Expected response time | |
| Commitment reviewed on | |

---

## Temporary certificates only

| | |
|---|---|
| Expiry date | |
| Outstanding conditions | |
| Renewal count | 0 / 1 *(one renewal maximum)* |

**On the expiry date, exactly one of these happens:**

- [ ] Converts to full CO, outstanding conditions met
- [ ] Renewed once, conditions restated, named owner accountable
- [ ] **Switched off**

> The third option must be genuinely available or the other two mean
> nothing. Suggested default: 90 days, renewable once for 90. A pilot
> needing more than six months is unfunded production, and calling it
> that is more useful to everyone.

---

## Withheld completion

> Hold something back until the records are done. This is the mechanism
> that makes record-keeping actually happen. In construction it is money;
> here it might be the permanent credential, the production budget
> increase, the announcement, or being marked complete on the dashboard
> people care about.

| Held back | Released on | Released? |
|---|---|---|
| | | [ ] |

---

## Issue

| | Name | Date |
|---|---|---|
| Issued by | | |
| Standing Owner acknowledges | | |

| Tier | Must be issued by |
|---|---|
| 1 | Self, within declared scope |
| 2 | A peer who is not the builder |
| 3 | The Final Decision Authority |

---

## Review schedule

| Tier | Interval | Next due |
|---|---|---|
| 1 | Annually or on trigger change | |
| 2 | 6 months | |
| 3 | Quarterly | |
