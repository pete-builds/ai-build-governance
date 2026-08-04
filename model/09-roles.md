# 09. Roles

Construction assigns responsibility to named parties with defined
liability. That precision is the point: when something fails, it is
knowable who was accountable.

---

## Final Decision Authority

The **Decision Authority** is the office that holds enforcement authority. The term
comes from NFPA codes and is deliberately defined by *function* rather
than job title, because local enforcement structures vary too much for a
fixed title to work.

That is exactly why it suits universities, where structures differ
wildly between institutions and often between units.

**Your amendments document must name the Decision Authority.** Not the committee it
reports to: the office that can say no and be obeyed. Requirements:

- It can be reached in under a day
- It can issue a stop-work action, per chapter 05
- It is small. One or two named people with a documented deputy.
- **It is not the same party as the builder.** At Tier 3 it must also not
  be the party that reports to the builder.

If no such office exists at your institution, that is the finding, and
this model cannot substitute for it. A code with no Decision Authority is a style guide.

### On not creating another committee

Most institutions adopting this will already have an AI policy body: a
council, a steering group, a task force. **Do not create a second one.**
Those bodies set policy. This model is the operational layer beneath
them, and the Decision Authority should be an operational office, not a deliberative
one.

The division that works:

| Layer | Answers | Typical body |
|---|---|---|
| Policy | What is permissible here at all | Existing AI council or equivalent |
| Investment | What we fund | Existing IT governance or capital process |
| **Operational** | **Does this specific build meet the code** | **The Decision Authority. This model.** |

An Decision Authority that meets monthly to discuss submissions has become a change
advisory board, and [appendix C](../reference/evidence-on-gates.md)
explains precisely why that is the failure mode to avoid.

---

## The stamp: Design Professional of Record

A professional engineer or registered architect **seals** drawings. The
seal certifies that the work was performed under that person's
"responsible charge," and it creates personal liability that generally
survives the corporate form. Boards discipline licensees for "plan
stamping," meaning sealing work they did not actually supervise.
(Liability substance is well attested; the specific NCEES rule numbering
was not verified.)

The construction roles split usefully:

- **Design Professional of Record**: overall responsibility and
  coordination
- **Engineer of Record**: technical responsibility for a specific system

### The software version

Every capability above Tier 1 has a named **Responsible Builder** who
signs the design response. Signing asserts three things:

1. I understand what this system can reach and what it can do
2. The declared inventories are complete to the best of my knowledge
3. I will be reachable when it misbehaves, or I have named who will be

The second is the load-bearing one. Nearly every serious failure in this
domain traces to an undeclared capability: an egress path nobody listed,
a credential scope nobody questioned, a tool nobody knew was connected.

**Do not attach personal liability to this.** The construction analogy
breaks here and it is important to say so. PE liability rests on
licensure, standardized education, examination, and insurance. None of
that exists for this work. Borrowing the *accountability* without the
*professional infrastructure* would just mean punishing individuals for
systemic failures, and it would make people refuse to sign.

What the signature buys is a name to ask, not a person to blame.

---

## The transient workforce problem

This is the hardest structural problem in university AI governance and
the place where the construction analogy fails most usefully.

**A stamp cannot be held by someone who graduates.**

Universities build with students, fellows, interns, and fixed-term
staff. That is not a defect to be corrected: it is the institution doing
its job, and short-tenure builders are frequently the best builders
available. But it means any model implicitly assuming the builder will
still be here has not accounted for its own workforce.

Construction has no clean equivalent, because a licensed engineer's
obligations persist. So the rule here is structural rather than borrowed:

### The two-signature rule

Everything above Tier 1 carries **two** names:

| Role | Who | Persists? |
|---|---|---|
| **Responsible Builder** | The person who built it. May be a student. | No |
| **Standing Owner** | A continuing institutional role. May not be a fixed-term appointment. | **Yes** |

The Standing Owner is not a formality and is not a co-author. They accept
that when the builder leaves, this becomes theirs: to operate, to hand
off, or to switch off. **A capability with no Standing Owner may not
receive a production approval above Tier 1.**

This will be unpopular, because it makes someone with a permanent role
accept ongoing responsibility for work they did not do, and there are
never enough of those people. That constraint is real, and it is
information: **if no standing owner can be found, the institution does
not actually have capacity to operate this thing.** Better to learn that
at design review than at graduation.

### Handoff as a first-class deliverable

Where a roll-on/roll-off model exists, use it, and make the record the
handoff artifact rather than a conversation.

- The registry entry, per chapter 07, is the handoff document. If it is
  accurate, handoff is possible. If it is not, handoff is archaeology.
- Overlap before departure, with the incoming operator running it while
  the outgoing builder is still reachable. This is the equivalent of
  commissioning: prove it works in the new hands, not just in the old.
- **Departure is a trigger for record review**, not a calendar event.

### Credential lifecycle

Short tenure makes credential hygiene a governance problem rather than
an IT chore:

- Credentials issued to a fixed-term person **expire no later than their
  appointment**. This is the single most effective control available and
  it is usually free to configure.
- Prefer service-account credentials owned by the standing role over
  personal credentials held by the builder, so departure does not break
  the system and remaining employed does not perpetuate access.
- Offboarding revokes, it does not merely stop using. Include pool and
  group memberships, which are frequently missed because they are not
  visible from the key.
- Never authorization institutional work on personal accounts. Departure makes
  personal-account work unrecoverable, which converts a person leaving
  into a data loss event.

---

## Special inspector

At Tier 3, review is performed by someone **independent of the project**.
This borrows the IBC's independent review concept, and specifically its
best feature: the independent inspector is engaged by the **owner**, not
by the contractor, so the person inspecting is not paid by the person
being inspected.

Translated: **the Tier 3 reviewer must not report to the builder or to
the builder's manager.** Peers from another unit, a central platform or
security function, or a rotating pool all work. What does not work is a
reviewer whose performance evaluation the reviewed party influences.

Independence is a structural property. It cannot be achieved by asking
someone to be objective.

---

## Governance platform team

The office that runs the process: maintains the code, publishes the
turnaround times, keeps the registry, runs the automated checks, and
holds the templates.

In practice this is a platform or enablement team, and its most important
work is not enforcement at all. It is the paved road from
[chapter 01](01-principles.md). **The governance platform team who spends their
time reviewing is failing; the one who spends it making the compliant
path the easy path is succeeding.**

Concretely, this office owns:

- The templates and scaffolds, so compliance is the default
- The automated checks at H1 through H5
- The registry, and its reconciliation against reality
- Published turnaround times, and being accountable for missing them
- The recorded exception log, and noticing when repeated recorded exceptions mean the code is
  wrong

---

## Summary

| Role | Count | Tenure | Cannot be |
|---|---|---|---|
| Final Decision Authority | 1 or 2 plus deputy | Continuing | The builder |
| Responsible Builder | 1 per capability | Any | Anonymous |
| Standing Owner | 1 per capability above Tier 1 | **Must be continuing** | Fixed-term |
| Special Inspector | 1 per Tier 3 | Any | Reporting to the builder |
| Building Official | 1 office | Continuing | Primarily a reviewer |

The two rows to argue about in your amendments are Standing Owner and
Special Inspector, because both consume scarce continuing-staff capacity.
That argument is worth having explicitly. Resolving it by quietly
dropping the requirements means Tier 3 does not exist, and it is better
to say that out loud than to discover it later.
