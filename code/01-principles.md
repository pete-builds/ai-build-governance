# 01. Principles

Seven rules. Everything else in this model is derived from them, and
when a later chapter conflicts with one of these, the principle wins.

---

## 1. Governance by default beats governance by approval

The most effective control is the one nobody has to remember. A
template that ships with logging already wired, a project scaffold with
secrets handling already correct, and a gateway key that already has a
budget cap will produce more compliance than any policy document.

Platform engineering calls this the **paved road** or the **golden
path**. The CNCF's platforms work frames it as "guardrails, not gates,"
and Team Topologies describes the platform team's job as enabling
governance by default rather than governance by gatekeeping. Netflix is
generally credited with "paved road" and Spotify with "golden path,"
the latter implemented through Backstage's software templates.
(Attributions here are widely reported but were not pinned to a single
dated primary post; see [appendix C](../reference/evidence-on-gates.md).)

The practical test: **if your governance model's first deliverable is a
form rather than a template, you have built the wrong thing first.**

Corollary: every time you find yourself adding a review step, first ask
whether the failure it catches could instead be made impossible, or at
least made loud, by the default path.

---

## 2. Gate on irreversibility, not on ceremony

A gate is justified where an action is hard to undo or where evidence is
about to become unavailable. It is not justified because a milestone
feels important.

Construction encodes this precisely. Inspections cluster before work
gets **concealed**, because after the drywall goes up, verification
costs an order of magnitude more. The rule is that work must not be
covered, closed in, or concealed until it has been inspected and
approved, and the building official can order concealed work uncovered
at the permit holder's expense.

Software has the same structure and almost never respects it:

| Irreversible or evidence-destroying | Reversible |
|---|---|
| Granting a credential a scope | Merging code |
| Writing to a system of record | Deploying to staging |
| Sending mail to real people | Rendering a UI |
| Training or fine-tuning on collected data | Changing a prompt |
| Publishing a tool other agents will call | Adding a test |
| Abstracting an agent behind a UI so its actions stop being visible | Refactoring |

Gate the left column. Leave the right column alone.

That last left-column row is the software equivalent of concealment,
and chapter 06 makes it a formal hold point.

---

## 3. Every gate names the failure it prevents

A gate with no named failure mode is overhead wearing a lanyard.

When you add one, write down: what specifically goes wrong without it,
whether it has ever actually gone wrong here, and how you would know
the gate is working. If you cannot answer the first question, delete
the gate. If you cannot answer the third, you have a ritual.

This cuts hard against the natural institutional response to an
incident, which is to add approval. The evidence says that response
backfires: adding process after an incident "will make things worse
because this drives up lead times and batch sizes, creating a vicious
cycle" ([DORA](https://dora.dev/capabilities/streamlining-change-approval/)).

Review this list annually and delete gates that never caught anything.
A code that only grows is a code that will be evaded.

---

## 4. Spend human review on intent, not arithmetic

Platforms are good at arithmetic and bad at intent. Budgets, rate
limits, key expiry, model allowlists, and retention windows are
enforced reliably because they are countable. Whether this system
should exist, whether the data flowing through it should be, whether a
tool description is honest, and whether anyone will maintain it in a
year are enforced nowhere by nothing.

So: automate every countable check, and stop congratulating yourself
for governing them. Point the scarce human attention at the questions
no machine will ever answer.

Concretely, a human reviewer should never be checking whether a budget
was set. A script checks that. A human reviewer should be asking
whether the thing is worth building.

---

## 5. Never document a control the platform does not enforce

Writing "workflow changes are reviewed before production" when the
platform has no publish gate does not create a review. It creates
**documented false assurance**, which is worse than a known gap because
it stops people looking.

If a control depends entirely on a person choosing to do the right
thing, label it as such, and then either inspect for it or accept the
risk explicitly. Both are honest. Pretending is not.

[Appendix B](../reference/platform-controls.md) is the worked example
of this principle: an inventory of what three real platforms enforce
versus what they leave to humans, including the places where the
documentation is silent and the honest answer is "unverified."

---

## 6. You cannot mandate, so make the right way the easy way

A corporation can require compliance. A university largely cannot, and
a model that assumes otherwise will be politely ignored. Decentralized
IT, unit-level budget autonomy, shared governance, and academic freedom
are not obstacles to route around. They are the operating conditions.

The construction analogy is instructive here, and it is the reason this
model is shaped as a *model code* rather than a policy. The ICC has no
authority over anyone. It writes a model; jurisdictions adopt it, amend
it, and enforce it themselves. Adoption is near-universal anyway,
because the alternative is writing a building code from scratch.

Apply the same logic internally. Make adoption obviously cheaper than
the alternative: better templates, faster provisioning, real support,
and a genuine answer when someone asks what they get for complying. Ban
things only where the law or an unacceptable risk actually requires it,
and be able to say which.

A gate you cannot enforce teaches people that the whole code is
optional. Prefer a smaller code you can actually hold.

---

## 7. The record is part of the deliverable

Construction distinguishes the drawings from the **record drawings**:
what was designed versus what was actually built. The second is the one
you need when something fails at 2am, and it is the one that never gets
made unless it is a condition of final payment.

The same is true here. A capability with no registry entry, no named
owner, and no record of what it can reach is not governed regardless of
how carefully it was reviewed on the way in. Review is a moment;
records are the only thing that persists.

This has a specific consequence for institutions whose builders are
students or other short-tenure contributors: **the record has to be
good enough that the person who built it can leave.** Any model that
implicitly relies on the builder still being around has not accounted
for its own workforce. Chapter 09 addresses this directly.

---

## What these principles cost you

Being straight about the trade-offs, since principle 3 demands it:

- **Fewer gates means some bad things ship.** This model accepts that,
  because the evidence says heavyweight gating produces worse outcomes
  overall, not better ones. It bets on fast detection and reversibility
  over prevention.
- **Automation-first governance requires platform investment.** If you
  have no capacity to build templates and checks, you will end up with
  the forms after all. Say so out loud rather than adopting a model you
  cannot staff.
- **Refusing to document unenforceable controls will make your posture
  look worse on paper.** It is worse on paper. It was always worse; the
  paper was wrong.
