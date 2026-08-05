---
title: "Template: Institutional Amendments"
parent: "Templates"
nav_order: 9
---

**Status:** Draft | Under review | **Adopted** (date)
**Adopts edition:** 2026.4
**Owner:** [name, role]
**Last reviewed:** YYYY-MM-DD

> This is your **adopting instrument**, in the same relationship a
> jurisdiction has to a model code: the model has no force until you adopt
> it, and adoption comes with local amendments.
>
> **Do not fork the model.** Amend it. Keep this document as the delta so
> that when a new edition ships you can see what changed and decide.
>
> Institution-specific detail (hostnames, account structures, group names,
> staff names, project names) belongs **here and only here**, never in the
> public model.
>
> Delete instruction blocks as you fill this in.

---

## 1. Final Decision Authority

> Name the office that can say no and be obeyed. Not the committee it
> reports to. If no such office exists, that is your finding, and the model
> cannot substitute for it.

| Function | Holder |
|---|---|
| Design review, Tier 2 | |
| Design review, Tier 3 (must not report to the builder) | |
| Production approval, Tier 3 | |
| Stop-work authority (small, reachable within a day) | |
| Certification authority (never the builder) | |
| Escalation: security | |
| Escalation: accessibility | |
| Escalation: privacy / lawful basis | |
| Escalation: policy question | |

**Do we already have a policy body and an investment process this sits
beneath?** If yes, name them, and state explicitly that this adds no
committee.

| Layer | Our body | Question it answers |
|---|---|---|
| Policy | | What is permissible here at all |
| Investment | | What gets funded |
| **Operational** | | **Does this specific build meet the code** |

## 2. Data classification mapping

> Substitute your own levels verbatim. Include a genuinely prohibited
> category if you have one; "not permitted" is not a tier.

| Our classification | Platform status | Authorization tier |
|---|---|---|
| | | 1 |
| | | 2 |
| | | 3 |
| | **Not allowed** | **Not permitted** |

**Decisions to make explicitly rather than by default:**

- [ ] Does a blank data field on a Statement of Need default to Tier 2?
      (Recommended: yes. Silence is not an exemption.)
- [ ] **Where do student education records land?** Many schemes place them
      mid-tier because they are not identity-theft-enabling. That can be
      the wrong answer for AI systems, where the concern is exposure and
      inference. Decide, and write down which.
- [ ] Does security engagement precede design review for the top tier?

## 3. Legal obligations that apply to us

> The model cites regulation and stops. This is where your counsel's
> answers go. Record the answer and who gave it, not your own reading.

| Question | Answer | Who determined it | Date |
|---|---|---|---|
| Accessibility: which standard and deadline binds us? | | | |
| Are we ADA Title II, Title III, or mixed across units? | | | |
| Student records: what does our lawful-basis analysis require? | | | |
| Other sector or jurisdiction obligations | | | |

## 4. What our platforms actually enforce

> The model's principle 5 forbids documenting a control your platform does
> not enforce. Fill this in honestly. Every row you cannot claim becomes an
> inspection or an accepted risk.
>
> Start from [appendix B](../reference/platform-controls.md), then verify
> against your own instance and license tier. Do not inherit its findings:
> they are about specific products at a specific date.

| Control we might claim | Reality on our instance | What we may actually write |
|---|---|---|
| | | |

**Open questions for our platform owners:**

| Question | Asked of | Answer |
|---|---|---|
| | | |

## 5. Local values

| Setting | Model default | Ours |
|---|---|---|
| Tier 2 design review turnaround | 3 working days | |
| Tier 3 design review turnaround | 10 working days | |
| Deemed approval at Tier 2 on missed turnaround | Yes (permission only, never a compliance determination) | |
| Key / credential maximum lifetime | Institutional maximum | |
| Authorization lapse if no inspection passes | 180 days | |
| Temporary production approval | 90 days, one renewal | |
| Record review: Tier 1 / 2 / 3 | Annual / 6 months / quarterly | |
| Certification surveillance: Tier 1 / 2 / 3 ceiling | Annual / 6 months / quarterly | |
| Certification expiry: Tier 1 / 2 / 3 ceiling | 24 / 18 / 12 months | |

## 6. Tier 1 exemption list

> Publish it. An unpublished exemption is an invitation to argue.

## 7. Transient workforce

> Skip only if everyone who builds here holds a continuing appointment.

- [ ] Standing Owner required above Tier 1, and may not be a fixed-term
      appointment
- [ ] Credentials expire no later than the holder's appointment end date
- [ ] Departure triggers record review
- [ ] Offboarding revokes rather than stops using, including group and
      cost-pool memberships
- [ ] Institutional work never on personal accounts

**Can we actually supply Standing Owners?** If not, Tier 3 is effectively
capped at zero. Better to say so here than to discover it later.

## 8. Existing work

> How you handle what is already running determines whether this gets
> adopted or resented.

- [ ] Amnesty inventory date: __________
- [ ] Existing work is pre-existing and complies on alteration
- [ ] **The unsafe list**, short and defensible, requiring immediate action
      regardless of when it was built:

1.
2.
3.

> If this list has fifteen items it is a compliance program wearing a
> safety costume, and it will be read that way.

## 9. Amendments to specific chapters

| Chapter | Amendment | Why |
|---|---|---|
| | | |

## 10. Deletions

> Which parts of the model are you **not** adopting? Deleting what you
> cannot enforce is required by principle 5, not a failure.

| Not adopted | Why | Accepted risk |
|---|---|---|
| | | |

---

## Adoption record

| | Name | Date |
|---|---|---|
| Prepared by | | |
| Reviewed by | | |
| Adopted by | | |

## Amendment history

| Date | Edition | Change |
|---|---|---|
| | 2026.4 | Initial adoption |

---

> **Consider publishing your amendments**, even just the structure without
> the internal specifics. Adoption reports, turnaround performance,
> exception rates, and failure cases are the most valuable contribution the
> model can receive, because it is otherwise a design hypothesis. See
> [CONTRIBUTING](../CONTRIBUTING.md).
