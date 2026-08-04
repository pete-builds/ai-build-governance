# 04. Design Review

In construction, design review (or plan examination) sits between the
authorization application and the authorization. Somebody who did not draw the
drawings reads them against the code and against what the project is
supposed to accomplish. It happens before anyone breaks ground, because
that is when changes are cheap.

Two things about real design review are worth stealing before anything
else.

**It is bounded.** A jurisdiction publishes a turnaround time. Review is
a service with a deadline, not a queue of indefinite duration. A review
process without a stated turnaround becomes a bottleneck, and a
bottleneck becomes something people route around.

**It checks against a published standard.** The reviewer is not
expressing an opinion about whether they would have designed it this
way. They are checking it against the code. That distinction is what
separates design review from an architecture review board, and it is why
this chapter is safe while the boards described in
[appendix C](../reference/evidence-on-gates.md) frequently are not.

---

## The Design Response

The builder's deliverable at this stage is the **Design Response**: the
*how*, answering the Statement of Need's *what*. It is the Basis of
Design from chapter 02, and the reviewer's job is the Commissioning
Authority's job: **does this design deliver what was asked for**, not
"is this how I would build it."

Keep it short. Use
[`templates/design-review.md`](../templates/design-review.md). Three pages
maximum, and diagrams count against the limit.

### Required content, all tiers

**1. Data flow.** Where data originates, every system it passes
through, where it comes to rest, and where it leaves the institution.
This is the single most useful artifact in the packet, and drawing it
honestly is often what reveals the tier was wrong.

**2. Tool and permission inventory.** Every tool, integration, and
credential, with the scope of each and a one-line justification. The
question the reviewer is answering: could this do its job with less?

**3. Egress inventory.** Every path by which data can leave: outbound
requests, mail, webhooks, shared documents, model providers, logs
shipped to third parties. Cross-check against the lethal trifecta
trigger in chapter 03. Discovering an unlisted egress path during
inspection is a finding, not a surprise.

**4. Failure behavior.** What happens when the model is wrong, the
upstream service is down, or the input is malicious. "It returns an
error" is insufficient for anything that takes action; the question is
what state the world is left in.

**5. Human oversight point.** Where a person can see what happened and
intervene. For anything above Tier 1 there must be at least one, and it
must be a real point in the running system rather than a promise that
someone will check the logs.

**6. Decisions worth recording.** Any architecturally significant
choice becomes an ADR, using the format from Michael Nygard's original
2011 post: title, context, decision, status, consequences
([Nygard](https://cognitect.com/blog/2011/11/15/documenting-architecture-decisions)).
Nygard's scoping rule is the useful part: record decisions that are
"architecturally significant," and never delete a superseded one, mark
it superseded. Use
[`templates/adr.md`](../templates/adr.md).

### Additional for Tier 2 and above

**7. Pre-mortem.** Assume it has failed badly and embarrassingly.
Write down how. Specifically: who could be harmed, what unfair outcomes
are possible, and what assumptions are baked into the data or the
prompt. This is bias and harm analysis done as an exercise rather than
as a checkbox, and it has to be written by the builder rather than the
reviewer, because the builder knows where the bodies are.

**8. Prompt injection analysis.** Required for anything ingesting
content the institution does not control. State where untrusted content
enters, what the model can do once influenced, and what limits the
damage. Note that treating this as solvable by instructions is itself a
finding: the mitigations that work are structural, meaning reduced
scope, removed egress, or a human in the path.

### Additional for Tier 3

**9. Independent reviewer's assessment**, from someone who does not
report to the project. See chapter 09.

**10. Explicit statement of what was considered and rejected**,
including the do-nothing option and the non-AI option from chapter 02.
At Tier 3 the institution is accepting real risk, and it deserves to
know what it is buying instead of the alternatives.

---

## How review is conducted

### Timeboxes

Publish them. Miss them and the review has failed, not the builder.

| Tier | Target turnaround | If the deadline passes |
|---|---|---|
| 1 | No review | n/a |
| 2 | 3 working days | **Deemed approved.** Proceed and note it in the record. |
| 3 | 10 working days | Escalates to the Decision Authority, who must either review it or waive to Tier 2 in writing. |

The Tier 2 deemed-approval rule is deliberate and it is the most
important sentence in this chapter. A review process with no
consequence for its own delay will always slide toward being a
bottleneck, and the bottleneck is what the evidence says does the
damage. Making silence into approval puts the cost of slowness on the
reviewing function rather than on the builder.

If deemed approvals start happening often, that is a staffing signal,
not a discipline problem.

### Tier 2 uses an advice process, not an approval

For Tier 2, the reviewer advises. The builder may proceed over an
unresolved objection provided the objection is **recorded in the ADR
along with the reason for proceeding**. This is the architecture advice
process: anyone may decide, provided they consult the affected parties
and record the decision.

This will feel wrong to people used to approvals. The justification is
empirical: DORA's research found external approval "had a negative
impact on software delivery performance" and found "no evidence" that
formal external review reduced change failure rates
([DORA](https://dora.dev/capabilities/streamlining-change-approval/)).
Recording the disagreement preserves the information the reviewer
generated without paying the cost of a blocking gate.

Tier 3 is different. There, the reviewer can block, because at Tier 3
the institution's own exposure is at stake rather than the team's.

### Dispositions

Borrow the submittal review stamps from construction (AIA A201
practice), because they are more useful than approve/reject:

| Disposition | Meaning |
|---|---|
| **Approved** | Proceed. |
| **Approved as Noted** | Proceed, and make the noted changes. No re-review. |
| **Revise and Resubmit** | Specific things must change and be re-reviewed. Name them. |
| **Rejected** | The approach will not work. Return to chapter 02. |

"Approved as Noted" is the workhorse and should be the most common
outcome by a wide margin. Most review findings are real but do not
warrant another round trip. A review culture that cannot say "yes, and
fix these three things" will produce either rubber stamps or queues.

**Every disposition other than Approved must name what would change it.**
A finding a builder cannot act on is not a finding.

### The RFI

Construction has a formal **request for information** for when the
builder hits an ambiguity in the documents. Import it, and make it
lightweight: a builder who is uncertain whether something needs
re-review should be able to ask in a channel and get a recorded answer
within a day.

Without a cheap RFI path, builders resolve ambiguity by guessing, and
they guess in the direction of not asking. Most governance failures
that look like defiance are actually unanswered questions.

---

## What design review is not

**It is not a design critique.** If the design meets the need, is
within tier, has bounded permissions, and its failure behavior is
understood, it passes. Preferences about frameworks, structure, or
style belong in code review, where they are cheap and non-blocking.

**It is not a security assessment.** Security review is
[chapter 06](06-inspections.md), it happens against the running system,
and it is mostly automated. A reviewer reading a diagram cannot tell
you whether the credentials are actually scoped correctly.

**It is not a committee.** One reviewer for Tier 2, one independent
reviewer for Tier 3. If design review requires a meeting with more than
three people in it, this model has been implemented incorrectly.

---

## Output

A recorded disposition attached to the Statement of Need, plus a
**authorization** if approved. The authorization, its conditions, and its expiry are
[chapter 05](05-authorization-to-build.md).
