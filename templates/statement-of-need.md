---
id: SON-YYYY-NNN
status: draft | submitted | returned | approved | withdrawn
date_submitted:
owner:            # the person with the problem. Signs this.
operator:         # who will run it in 18 months
tier_assigned:    # filled in at classification, not by the author
---

# Statement of Need: <plain-language name>

> **Two pages maximum.** If it needs more, the need is not yet clear.
>
> **This must be authored or signed by someone other than the builder.**
> A need statement written by the person who wants to build the thing is
> a proposal wearing a costume.
>
> Delete every instruction block before submitting.

---

## 1. The problem

> State what is wrong today. **No solution, no technology.** If this
> section contains "AI", "agent", "LLM", "automate", or a product name,
> rewrite it.
>
> Forcing question: who is worse off today, and how would *they*
> describe it?

## 2. Who is affected, and how many

> Named population and rough scale. Be honest about scale: it sets the
> tier.

| | |
|---|---|
| Population | |
| Approximate number of people | |
| Internal only, or external too | |

## 3. What happens if we do nothing

> The honest answer is sometimes "not much." That is a legitimate
> finding, and writing it down is the point. A project can still proceed
> as a labelled experiment, it just does not get to claim operational
> urgency.
>
> Quantify the current cost where you can: time, error rate, delay,
> money, people turned away.

## 4. What "done" looks like

> At least one criterion **that could fail**. "Improved efficiency"
> cannot fail. "Reduces median handling time from 3 days to under 1" can.

| Measure | Today | Target | How measured |
|---|---|---|---|
| | | | |

### Tolerance for being wrong

> AI systems produce wrong answers routinely, not exceptionally. Answer
> all four. A need statement that has not confronted its own error rate
> is not finished.

- What kind of wrong output is possible here:
- What error rate is acceptable:
- Who bears the cost when it is wrong:
- How would an affected person find out and contest it:

## 5. Data required

> What it **needs**, not what would be nice. Use your institution's own
> classification labels. This field sets the tier, and widening it later
> is an alteration requiring re-review.

| Data | Classification | Why it is necessary |
|---|---|---|
| | | |

- [ ] I have confirmed no listed data class is prohibited on the
      intended platform
- [ ] Regulated data is involved and the relevant office has been
      engaged (name and date): ______

## 6. Ownership and decision authority

| Role | Name | Appointment type |
|---|---|---|
| Owner (decides it is worth doing, signs this) | | |
| Operator (runs it in 18 months) | | continuing / fixed-term |
| Standing Owner, if the operator is fixed-term | | must be continuing |

> If the operator is a student, fellow, intern, or other fixed-term
> appointment, a **Standing Owner** is required before this may pass plan
> review. See chapter 09. If none can be found, the institution does not
> have capacity to operate this, and that is the answer.

---

## 7. Does this already exist

> The cheapest step in the whole model. An honest "yes" here is the
> highest-value outcome this process can produce and should be recorded
> as a success, not a failed intake.

| Question | Finding |
|---|---|
| Does the vendor publish an official MCP server, SDK, or CLI for this? | |
| Does something equivalent already exist in our registry? | |
| Can this be bought as a supported product? | |
| Can this be done without AI (script, query, fixing the upstream process)? | |

> If any answer is yes, state why building anyway is justified. "I want
> to build it" is not a justification. "The official SDK does not expose
> X, which is the whole requirement" is.

**Justification for building despite the above:**

---

## Signatures

| | Name | Date |
|---|---|---|
| Owner | | |
| Received by | | |

---

## For office use

| | |
|---|---|
| Tier assigned | |
| Triggers fired | |
| Disposition | approved / returned / rejected |
| Reason, if returned | |
| Registry ID | |
