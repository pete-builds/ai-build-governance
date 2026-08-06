---
title: "07. Pilot Protocol"
parent: "Implementation Guide"
nav_order: 7
---

# Pilot Protocol

**Nobody has piloted this.** It is a design hypothesis with a documented
argument, not a validated practice. This page is the instrument for changing
that: what to run, what to measure, and what result should make an institution
abandon or amend parts of the framework.

Publishing how to disprove something is cheaper than claiming it works, and more
useful. Every number in this framework is a design judgment. A pilot is how they
stop being guesses.

**This page binds nobody.** It is a research protocol, not a requirement.

---

## What a pilot is testing

Not "is governance good". Four specific claims, each of which could be false:

| Claim | How the pilot could falsify it |
|:--|:--|
| Classification from stated triggers produces consistent tiers | Two reviewers classify the same capability differently, or a builder's self-classification is routinely overturned |
| Gates at irreversibility cost less than gates at milestones | Total builder and reviewer hours exceed what the institution's existing process spends |
| Reuse is faster than rebuilding | Nobody consumes a certified component, or consuming one takes longer than building fresh |
| The paperwork is proportionate | Builders work around requirements, or abandon builds at intake |

The fourth is the one most likely to fail, and the failure mode is quiet.
Builders do not file complaints about process weight. They stop coming.

---

## Three archetypes, and why these three

Run all three. One is not a pilot, because the framework's cost is concentrated
at the high tiers and its benefit at the low ones, so a single archetype will
flatter or condemn it depending on which you pick.

### Archetype A: internal retrieval assistant, expected low tier

A capability answering questions over an internal document corpus, output read by
a person, no write path, no external egress.

**Expected tier: 1 or 2.** Work the triggers rather than assuming. Trigger A
decides it, and the deciding fact is whether the corpus contains any regulated or
specially protected class. If it does, trigger A forces Tier 3 on its own,
regardless of how low-risk the capability feels. Note that a pure internal
retrieval assistant carries at most **one** leg of the trigger B combination, so
it does not approach the forcing rule.

**What this archetype tests:** whether the low path is actually light. If a Tier 1
capability generates meaningful reviewer hours, the tier structure is not doing
its job.

### Archetype B: automation-platform workflow with write authority

A workflow on an Agent Studio platform that writes to a real system.

**Expected tier: 2 at minimum, 3 in most realistic shapes.** Three separate
routes get it to Tier 3, and a pilot should record which one fired:

- Trigger C, if the writes happen without per-action human approval.
- Trigger B, if the workflow is triggered by content from outside the institution
  and writes to a system of record while touching private data. That is all three
  legs.
- Trigger A, depending on what it reads and writes.

**What this archetype tests:** the gap between a documented control and an
enforced one. On n8n specifically, and this finding is about n8n and does not
generalize to the category, [the platform has no publish
gate](../reference/platform-profiles/n8n.md): edit access is production change
authority, and changes limited to settings can republish without a click.
Sharing a workflow also grants editors implicit use of credentials never
explicitly shared with them. A pilot on such a platform is testing whether H4
inspection catches what the platform will not stop, which is the case the
framework was shaped around.

### Archetype C: MCP agent with delegated authority

An agent that takes action on a named person's behalf through tool servers.

**Expected tier: 3, and this one is close to determined.** Connecting a tool
server frequently supplies the external-communication leg of trigger B on its
own. If the delegation model treats a single approval as consent for subsequent
actions, requirement 12.5 independently forces Tier 3 on autonomy and requires
the capability be recorded as an exception.

**What this archetype tests:** whether the delegated-authority requirements
(chapter 12) are implementable on real platforms, or whether they describe
something no available tooling supports. If pilots consistently cannot satisfy
12.2's record of whose authority was used and what subset of it, that is a
finding about the requirement, not about the builders.

**Do not restate the worked example.** [The running
example](02-running-example.md) already carries a Tier 3 capability through all
ten stages including a delegated-authority design that was caught and revised.
Use its Stage 2 for the classification walk and Stage 10 for the delegation
pattern rather than reinventing either.

---

## What to record

Record these per archetype. The point of the list is that most of it is
uncomfortable, and a pilot that only reports the flattering half is not evidence.

### Effort

| Measure | Why it matters |
|:--|:--|
| Builder hours, by stage | The framework predicts intake and H4 dominate. If design review dominates instead, the gate is in the wrong place |
| Reviewer hours, by discipline | [Adoption](01-adoption.md) predicts 1 to 2 hours for a Tier 2 design review and 2 to 3 for Tier 3. Test those |
| Wall-clock from intake to production approval | Separate from effort. Queue time is the cost DORA associates with worse outcomes |
| Turnaround actually achieved against the published time | The 3-day and 10-day figures are invented. Report what was met |

### Outcomes

| Measure | Why it matters |
|:--|:--|
| Defects caught, and at which verification point | If H1 through H3 catch everything and H4 catches nothing, the framework's central claim about pre-concealment is wrong |
| Defects that reached production anyway | The more important half of the previous line |
| Reclassifications, and in which direction | Downward reclassification after review suggests the triggers over-trigger. Upward suggests self-classification is optimistic |
| Approvals avoided by consuming a certified component | The reuse mechanism's whole case. Zero means chapter 11 is decorative |
| Deemed approvals that occurred on turnaround expiry | Requirement 10.6 bounds what silence can produce. Count how often silence was the outcome |

### Friction

| Measure | Why it matters |
|:--|:--|
| Confusion points, quoted verbatim | Where a reader had to translate a term to work out what was being asked. Those are defects |
| Requirements ignored or worked around, and which | The single most valuable data a pilot produces |
| Builds abandoned at or before intake | The failure mode that does not announce itself |
| Exceptions recorded, by requirement number | A requirement excepted every time is a requirement that should be deleted |

Record the last two even when they make the framework look bad. Especially then.

---

## Running it

1. **Do not amend first.** Adopt the model close to unchanged for the pilot, so
   findings attach to the framework rather than to local edits. Data
   classifications and review turnarounds will need local values; note them as
   pilot parameters.
2. **Name the Final Decision Authority before intake**, per chapter 09. A pilot
   without one tests a different framework.
3. **Timebox to one term or one quarter.** Long enough for an alteration
   (chapter 08) to occur naturally, since change-after-production is where the
   framework claims an advantage and where a short pilot sees nothing.
4. **Have someone who is not the builder run H4 and H5.** If the institution
   cannot supply that person, that is itself the finding, and it is the same
   staffing question chapter 11's surveillance intervals raise.
5. **Record as you go.** Retrospective effort estimates are worthless.
6. **Publish, including the parts that did not work.** Use the
   [pilot findings template](../templates/pilot-findings.md).

---

## What would count as the framework failing

Stated in advance, because a hypothesis that cannot fail is not one:

- **Builders route around it.** Capabilities reaching production without going
  through intake, at a rate the institution would not tolerate.
- **Reviewer effort exceeds the estimates by more than roughly double.** The
  framework is then heavier than advertised and the estimates in
  [adoption](01-adoption.md) are wrong.
- **H4 catches nothing across all three archetypes.** The framework's
  load-bearing claim is that pre-concealment is the moment worth a human. If it
  is not, chapter 06 needs restructuring.
- **Nobody consumes a certified component.** The anti-queue mechanism is the best
  idea here and also the most gameable. If reuse never happens, the queue was
  never the real problem.
- **Every Tier 3 capability records an exception against the same requirement.**
  That requirement is unimplementable and should be deleted rather than excepted
  in perpetuity.

Any of these is worth more to this framework than a successful pilot, and
reporting one is a contribution. See
[contributing](https://github.com/pete-builds/ai-build-governance/blob/main/CONTRIBUTING.md).
