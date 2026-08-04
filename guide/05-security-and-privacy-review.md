# 05. Security and Privacy Review

> **Part II: handbook. Non-binding.** The requirement that these reviews
> run concurrently lives in
> [model/10-concurrent-reviews.md](../model/10-concurrent-reviews.md). This
> page is how to actually do one.

---

Two reviews, both concurrent with design review, both deliberately narrow.

---

## Security review

Chapters 06 and the inspection templates already do most of the security
work. What was missing was a **named touchpoint**, so this states it.

**Concurrent with design review**, security review answers three questions
and nothing else:

1. Does this fit an already-reviewed pattern, or is it novel?
2. Does the tier match what the design actually does?
3. Is there anything here the institution's security office must see?

Most builds should clear on question 1. That is the paved road working:
if it uses the standard scaffold, the standard gateway pattern, and
already-inspected components, security review is a confirmation rather
than an investigation.

**Escalate to the institution's security office when:**

- The tier is 3 on data classification
- The full lethal trifecta is present and no leg can be removed
- The build touches authentication, authorization, or credential issuance
  for anyone other than itself
- It exposes a new externally reachable surface
- A component has a published vulnerability with no available fix
- It processes data the institution's policy prohibits on that platform

**Do not route everything to the security office.** A security function
that receives every build becomes the serial queue this chapter exists to
prevent, and it will be routed around. Escalation criteria that are
narrow and published are what make escalation credible.

---

## Privacy review

Concurrent, and narrower than people assume. Three questions:

1. **Are the declared data classes right?** The single most common defect,
   and the one that changes the tier.
2. **Is there a lawful basis and a policy fit for each class?** This is
   the question for your privacy office and counsel, not for this model.
   Where student records are involved, the relevant hook in US law is the
   FERPA school official exception at
   [34 CFR 99.31(a)(1)](https://www.law.cornell.edu/cfr/text/34/99.31),
   discussed in [chapter 03](../model/03-classification.md).
3. **What is retained, where, and for how long?** Including the places
   people forget: execution logs, prompt and response logs, vector stores,
   and agent scratchpads. As [appendix B](../reference/platform-controls.md)
   notes, retention is frequently a property of a downstream sink rather
   than of the platform anyone is looking at.

---

---

## Why both are kept narrow

A function that receives every build becomes the serial queue that
[model/10](../model/10-concurrent-reviews.md) exists to prevent, and it will
be routed around rather than argued with. Narrow, published escalation
criteria are what make escalation credible.

Note the asymmetry the code imposes. Security clearance **may** be deemed
at Tier 2 on a missed turnaround, but never for an escalated build. Privacy
and lawful-basis determinations may **never** be deemed, because they are
determinations rather than permissions. See requirement 10.6.

The running example shows privacy review producing the single most valuable
finding in that whole process, an unintended data spread across three
retention regimes, without blocking anything:
[guide/02, stage 4](02-running-example.md#stage-4-concurrent-reviews).
