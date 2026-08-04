---
id: PR-YYYY-NNN
statement_of_need: SON-YYYY-NNN
tier:
builder:              # the Responsible Builder. Signs the design response.
reviewer:             # must not be the builder. At Tier 3, must not report to them.
date_submitted:
target_turnaround:    # T2: 3 working days. T3: 10 working days.
disposition:          # Approved | Approved as Noted | Revise and Resubmit | Rejected
---

# Design Response and Design Review

> **Three pages maximum, diagrams included.**
>
> This is the *how*, answering the Statement of Need's *what*. The
> reviewer's job is not "is this a good design" but **"does this deliver
> what was asked for, within its tier, with bounded permissions, and
> with understood failure behavior."**
>
> **Tier 2 is an advice process.** The builder may proceed over an
> unresolved objection if the objection and the reason for proceeding are
> recorded in an ADR. **Tier 3 the reviewer can block.**
>
> **If the target turnaround passes with no response, Tier 2 is deemed
> approved.** Proceed and note it below. That is a staffing signal, not a
> discipline problem.

---

# Part A: Design Response (builder completes)

## A1. Data flow

> Where data originates, every system it passes through, where it rests,
> and where it leaves the institution. Drawing this honestly is often
> what reveals the tier was wrong. ASCII, image, or link.

```
```

## A2. Tool and permission inventory

> Every tool, integration, and credential. The question being answered:
> **could this do its job with less?**

| Tool / integration | Credential and scope | Why this scope is the minimum |
|---|---|---|
| | | |

## A3. Egress inventory

> **Every** path by which data can leave. Outbound requests, mail,
> webhooks, shared documents, model providers, logs shipped to third
> parties, and anywhere output is rendered that an attacker can read.
> An unlisted egress path discovered at inspection is a finding.

| Destination | What can reach it | Necessary because |
|---|---|---|
| | | |

## A4. Failure behavior

| Failure | Behavior | State the world is left in |
|---|---|---|
| Model returns something wrong | | |
| Model returns nothing / times out | | |
| Upstream dependency is down | | |
| Input is malicious | | |
| Budget or rate limit is hit | | |

> "It returns an error" is insufficient for anything that takes action.
> The question is what state the world is left in.

## A5. Human oversight point

> Where a person can see what happened and intervene. Required above
> Tier 1. Must be a real point in the running system, not a promise that
> someone will check the logs.

- Where:
- Who:
- What they can see:
- What they can do about it:

## A6. Decisions recorded

| ADR | Decision |
|---|---|
| | |

---

# Part B: Tier 2 and above

## B1. Pre-mortem

> Assume it has failed badly and embarrassingly. **The builder writes
> this**, because the builder knows where the bodies are.

- How it failed:
- Who was harmed, and how:
- What unfair or unequal outcomes are possible:
- Assumptions baked into the data, the prompt, or the retrieval set:
- Which of the above are we accepting, and why:

## B2. Prompt injection analysis

> Required for anything ingesting content the institution does not
> control.

| | |
|---|---|
| Where untrusted content enters | |
| What the model can do once influenced | |
| What structurally limits the damage | |

**Lethal trifecta check** (chapter 03):

- [ ] Access to private data
- [ ] Exposure to untrusted content
- [ ] Ability to communicate externally

> All three checked is **Tier 3**. If so, state which leg could be
> removed and why it cannot be:

> Note: treating injection as solvable by instructions is itself a
> finding. What works is structural: reduced scope, removed egress, or a
> human in the path.

---

# Part C: Tier 3 only

## C1. Alternatives considered and rejected

| Option | Why rejected |
|---|---|
| Do nothing | |
| Non-AI approach | |
| Buy instead of build | |
| Narrower scope | |

## C2. Independent reviewer

| | |
|---|---|
| Name | |
| Unit | |
| Confirms they do not report to the builder or the builder's manager | [ ] |

## C3. Standing Owner confirmed

| | |
|---|---|
| Name | |
| Continuing appointment | [ ] |
| Has accepted that this becomes theirs when the builder leaves | [ ] |

---

# Part D: Reviewer completes

## D1. Checks

- [ ] Design plausibly delivers the Statement of Need
- [ ] Tier is correct; triggers re-run independently
- [ ] Permissions are the minimum, and I asked what breaks without each
- [ ] Egress inventory is complete as far as the diagram shows
- [ ] Failure behavior is understood, not asserted
- [ ] Oversight point is real and reachable
- [ ] Data classes match the Statement of Need
- [ ] Existing-tooling check was done and its answer is reasonable

## D2. Findings

> **Every finding must name what would resolve it.** A finding the
> builder cannot act on is not a finding.

| # | Finding | Blocking? | What would resolve it |
|---|---|---|---|
| | | | |

## D3. Disposition

- [ ] **Approved.** Proceed
- [ ] **Approved as Noted.** Proceed, make the noted changes, no
      re-review *(this should be the most common outcome by a wide
      margin)*
- [ ] **Revise and Resubmit.** Named items must change and be
      re-reviewed
- [ ] **Rejected.** The approach will not work; return to Statement of
      Need

## D4. Authorization conditions

> Each condition must be verifiable at a named verification point. A condition
> nobody checks is a wish. Write conditions against the paths in A1, not
> against a settings page.

| Condition | Verified at |
|---|---|
| | H1 / H2 / H3 / H4 / H5 |

## D5. Unresolved objections proceeded over (Tier 2)

| Objection | Builder's reason for proceeding | ADR |
|---|---|---|
| | | |

---

| | Name | Date |
|---|---|---|
| Builder | | |
| Reviewer | | |
| Deemed approved on turnaround expiry | n/a | |
