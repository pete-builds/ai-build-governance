---
title: "Template: Third-Party Tool Server Boundary Inspection"
parent: "Templates"
nav_order: 7
---

> Copy this file. The metadata block below is part of the template:
> fill it in at the top of your copy.

```yaml
id: INSP-TP-YYYY-NNN
dependent_capability:
registry_id:
tier:
component_name:
operator:
operator_is_reachable: yes | no
spec_revision_observed: "2026-07-28"
definitions_pinned_at:
inspector:
date:
result: pass | fail | pass with findings
```

# Inspection: Third-Party Tool Server Boundary

> **Use this instead of the
> [MCP server template](inspection-mcp-server.md) when you do not operate the
> server.** That template asks questions only an operator can answer. Answering
> them from vendor documentation produces a record that looks like an
> inspection and verifies nothing, which is the failure
> [chapter 13](../model/13-third-party.md) exists to prevent.
>
> If you self-host someone else's server, you **are** the operator. Use the
> other template.

This inspection covers the boundary: what crosses outward, what comes back,
what the component holds, and whether you can cut it off. Every item below is
answerable without the operator's cooperation. That is the design.

---

## Section 1: What crosses outward (H2)

- [ ] The operator is named in the **egress inventory** from design review as a
      destination in its own right *(13.6)*
- [ ] Data classes permitted to cross are stated **positively**, as a list of
      what may go, not as a list of what may not
- [ ] Actual outbound payloads observed on a real call, and they match the
      permitted list. Do not infer this from configuration.
- [ ] Free-text and unused parameters reviewed: any field that can carry
      arbitrary content is an exfiltration path regardless of its name
- [ ] Regulated or restricted data confirmed absent from what crosses, or
      explicitly approved as crossing with the approver named

## Section 2: What comes back, and what may act on it (H2)

- [ ] Returned content treated as **untrusted input**. Output is not data the
      model may act on unconditionally.
- [ ] Output cannot alter behavior toward other connected servers
- [ ] Output sanitized for control characters and escape sequences before
      rendering or logging
- [ ] Output size bounded
- [ ] Any action the returned content can trigger is enumerated, and each is
      either reversible or gated on human confirmation

## Section 3: Credentials the component holds (H1)

- [ ] Credential issued to this component is **its own**, not shared with any
      other consumer or capability
- [ ] Scope cut to the minimum, with each remaining scope justified in writing
- [ ] Expiry set, and within institutional maximum
- [ ] No credential passed through to the component that was issued for
      something else *(no token passthrough)*
- [ ] Budget cap and rate limit set as hard stops, verified live rather than
      read from a settings page
- [ ] Revoking this credential is confirmed to disable the connection, and
      nothing else

## Section 4: Change authority and drift detection (H2, H4)

- [ ] **The operator is recorded as holding production change authority** over
      the dependent capability *(13.4)*
- [ ] Standing Owner has accepted that, on the record, by name and date
- [ ] Tool definitions **pinned by hash** as observed on this date
- [ ] **Drift alarm live and tested** by actually changing a pinned value and
      confirming the alarm fires. An untested alarm is a hypothesis.
- [ ] Alarm routes to a named person who can act, not to a shared mailbox
- [ ] Full untruncated tool descriptions read by a human, **alongside the other
      servers this client runs with** *(6.7)*
- [ ] Protocol revision observed and recorded. You cannot pin the operator to a
      revision, so record what you saw and when.

> **Pinning here detects. It does not prevent.** For a server you operate,
> pinning stops the change. For this one it tells you afterward. Which is why
> section 5 is not optional.

## Section 5: Revocation (H5)

- [ ] A revocation path exists that disconnects the component **without
      silently degrading** the dependent capability
- [ ] The dependent capability's behavior with the component absent is defined
      and observed: it fails visibly, or it degrades in a stated way
- [ ] **The path has been exercised.** Date, who ran it, how long it took,
      what broke *(13.5)*
- [ ] Someone reachable outside business hours can execute it
- [ ] Exercising it did not require the operator's cooperation

| | Answer |
|---|---|
| Date revocation was exercised | |
| Time from decision to disconnected | |
| What broke that was not expected | |

## Section 6: Classification after connection (chapter 03)

- [ ] Capability **reclassified** with the component connected *(13.7)*
- [ ] Lethal trifecta re-tested: private data, untrusted content, external
      egress. Note which legs the connection newly supplied.
- [ ] Tier recorded, and any tier change from before the connection

| Leg | Present before | Present after |
|---|---|---|
| Private data | | |
| Untrusted content | | |
| External communication | | |

- [ ] If the connection created all three legs: the remedy considered was
      **removing a leg**, and if it was not removed, why not is recorded

## Section 7: Re-check (13.8)

- [ ] Re-check interval set
- [ ] A **named person** holds it, not a team
- [ ] Interval recorded in the registry entry so it survives that person leaving

| | Answer |
|---|---|
| Re-check interval | |
| Holder (named) | |
| Next re-check due | |

## Section 8: What this inspection did NOT verify

> **Fill this in. It is the most useful section here.** An inspection of a
> component you do not operate has a large and specific blind spot, and writing
> it down is what stops the record being read as broader assurance than it is
> *(principle 1.5, requirement 13.2)*.

State plainly, for the record:

- [ ] The component's internals were **not** inspected
- [ ] The component's own egress was **not** enumerated
- [ ] The operator's controls are **not** verified by the institution, and any
      compliance report the operator supplied is **not** recorded as a
      certification *(13.3)*
- [ ] Nothing prevents the operator changing behavior after this date

Anything else this inspection could not reach:

| Not verified | Why not | Compensating control, if any |
|---|---|---|
| | | |

---

## Findings

| # | Section | Finding | Blocking? | What would resolve it |
|---|---|---|---|---|
| | | | | |

## Result

- [ ] **Pass**
- [ ] **Pass with findings.** Non-blocking items tracked on the accepted
      defect list
- [ ] **Fail.** Blocking items above. The connection must not carry real data
      past this verification point.

> **At Tier 3, a fail on section 5 is not resolvable by compensating control.**
> Detection without a working cutoff is not detection. Self-host a pinned
> version instead, which moves this to the
> [MCP server template](inspection-mcp-server.md), or decline the connection.

| | Name | Date |
|---|---|---|
| Inspector | | |
| Standing Owner, accepting 13.4 | | |
| Builder notified | | |

> **Re-inspect on:** any drift alarm firing, any credential change, any
> observed protocol revision change, any widening of what crosses outward, and
> at the interval set in section 7.
