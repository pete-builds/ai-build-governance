---
title: "12. Delegated Authority"
parent: "Core Governance Model"
nav_order: 12
---

## Purpose

Governs an agent acting under a specific human's authority, so that the agent
cannot exceed the person it acts for and the record shows whose authority was
used.

## Failure this prevents

An agent exceeding the human it acts for, and an audit trail that cannot tell
the two apart. Done well this is the strongest control in the framework. Done
carelessly it hands an agent a human's full entitlements and erases the
distinction between them.

## Requirement

### An agent inherits, never exceeds

> **REQUIREMENT 12.1**
> Agents **MUST** delegate. Agents **MUST NOT** impersonate.

The distinction is standardized. [RFC 8693](https://datatracker.ietf.org/doc/html/rfc8693)
defines **impersonation** as the case where "A is given all the rights that B
has... it is indistinguishable from B," and **delegation** as the case where
"A still has its own identity separate from B... A is an agent for B."

> **GUIDANCE**
> Impersonation is attractive because it is easy: nothing downstream changes
> and the agent can do whatever the person could. Every one of those is the
> problem. When an impersonating agent does something wrong, the record says
> the human did it, and there is no way to establish otherwise.

> **REQUIREMENT 12.2**
> Every consequential action taken under delegated authority **MUST** record
> **whose authority** was used, **what subset** of it, and **who approved**
> what.

> **REQUIREMENT 12.3 Subset, never superset**
> An agent **MUST NOT** hold authority the delegating human lacks. An agent
> serving several users **MUST NOT** accumulate the union of their
> entitlements.

> **GUIDANCE**
> The test: **if the human could not do it manually through the normal system,
> the agent must not do it for them.** If your architecture cannot enforce
> that, you have impersonation with extra steps.
>
> The common violation is convenience: the agent runs with a service account
> that can reach everything, and a human identity is checked only at the front
> door. That is the confused deputy condition by construction, and front-door
> authentication does not fix it, because the authority being exercised is the
> agent's.

### Approval must reach a person

> **REQUIREMENT 12.4 Approval authenticated to a person**
> Where approval is claimed as a control, the approver **MUST** authenticate
> through the institution's identity system at approval time; the approval
> **MUST** name what is being approved in terms the approver can evaluate;
> it **MUST** be time-limited, single-use, or both; the record **MUST** be
> non-repudiable to the extent the identity system supports; approval
> **MUST** be separable from execution; and declining **MUST** be a supported
> outcome that leaves the system in a valid state.

> **GUIDANCE**
> "Allow this agent to act" is not an approval. "Send this message to these
> forty people" is. And a checkbox inside an application the agent also
> controls is not an authentication event.

> **REQUIREMENT 12.5 Standing consent**
> Where a single approval is treated as consent for subsequent actions, the
> capability **MUST** be recorded as a recorded exception and **MUST** be
> classified Tier 3 on autonomy per
> [chapter 03](03-classification.md).

> **GUIDANCE**
> Standing consent is sometimes the right engineering answer. What is not
> acceptable is holding standing consent while describing the system as
> human-approved. If you have it, you no longer have per-action human
> authority; you have an agent with a human's credentials and a historical
> record that someone once said yes.

### What is never permitted

> **REQUIREMENT 12.6 Prohibited patterns**
> The following **MUST NOT** be used:

| Pattern | Why it fails |
|---|---|
| Shared service account for all users | Loses whose authority was used; creates the confused deputy condition |
| **Token passthrough** | Forwarding a credential not issued for the receiving service breaks audience validation and the audit chain |
| Impersonation credentials | Downstream cannot distinguish agent from human |
| Union of entitlements | Every user transitively reaches everything |
| Standing consent presented as per-action approval | See 12.5 |
| Approval inside the agent's own trust boundary | If the agent can influence the approval record, the approval is not independent |
| Identity checked only at the front door | Authorization must be enforced where the action happens |

### The record

> **REQUIREMENT 12.7 The record**
> Each consequential action **MUST** record the acting identity (the agent,
> versioned), the authority identity (the named human), the approval
> reference, the action taken, the scope exercised, the **full delegation
> chain** where another agent or tool was invoked, the outcome including
> refusals, and a timestamp with timezone.

> **GUIDANCE**
> The delegation chain is the row that gets omitted and the one you will want
> most. Multi-agent systems produce chains, and a record showing only the last
> hop cannot answer whose authority was ultimately used.

## Applicability

Any capability where an agent takes action on a person's behalf. Not
applicable to systems that only produce output a human then acts on
themselves.

## Required evidence

The delegation model stated at design review; the 12.7 record for
consequential actions; and at H5, one approval and its resulting action traced
end to end by someone other than the builder.

| Verification point | What is checked |
|---|---|
| Design review | Delegation model stated. **Impersonation designs are a blocking finding.** |
| H1 | Agent credentials scoped so they cannot exceed a delegating human |
| H2 | No token passthrough; audience validation; per-client consent on proxies; scopes minimized |
| H4 | Approval events authenticated and recorded; delegation chain captured; standing consent declared |
| H5 | An approval traced to its action in the record by a third party |

## Exceptions

Standing consent under 12.5, recorded as an exception with its Tier 3
consequence accepted. No exception exists to 12.1 or 12.3.

## Implementation guidance

**You do not need to implement RFC 8693** to adopt this. You need the property
it encodes: the credential, and therefore the log, states both who acted and
whose authority was used. Its mechanics are worth knowing as a model: a
subject token identifies the party on whose behalf the request is made, an
optional actor token identifies the party acting and its presence signals
delegation rather than impersonation, an `act` claim records that delegation
occurred and supports nested chains, and a `may_act` claim states that a party
is authorized to become an actor for another.

> **VERIFICATION NOTE** (2026-08-04)
> The MCP specification does **not** use RFC 8693's delegation vocabulary. It
> addresses the adjacent concerns: the confused deputy problem, a prohibition
> on token passthrough, state handling, and scope minimization. So the
> protocol tells you what not to do, and RFC 8693 names what to do instead.

**The construction parallel, and its limit.** A contractor performs work under
an authorization issued to an owner, and an authorized agent may sign on the
owner's behalf where that authority is documented: delegated, bounded, written
down, and the party doing the work is not the party whose authority permits it.
Where it breaks: a contractor cannot act ten thousand times a second and
cannot be induced to misuse delegated authority by a carefully worded email.
Delegation in an agentic system needs rate limits and an injection analysis,
which no construction concept supplies.

Worked instance: [Running Example: The Payment Inquiry Agent](../guide/02-running-example.md),
stage 10, where a service-account design was caught and revised to delegation.

## Sources and confidence

> **VERIFICATION NOTE** (2026-08-04)
> RFC 8693's status, date, and its explicit impersonation-versus-delegation
> distinction were fetched and quoted, along with the subject token, actor
> token, `act`, and `may_act` mechanics. That the MCP specification addresses
> confused deputy and forbids token passthrough but does not adopt RFC 8693's
> vocabulary was verified directly.

> **UNVERIFIED**
> RFC 9068, the JWT access token profile, was not retrieved, so no claim is
> made here about how it represents actor claims.

> **DESIGN JUDGMENT**
> The three questions, the requirement that approval be separable from
> execution, the treatment of standing consent as an exception plus an
> automatic Tier 3 trigger, and the contents of the delegation record follow
> from the impersonation-versus-delegation distinction rather than being
> independently established.

> **A limit worth stating.** Delegated authority constrains what an agent
> **may** do. It does nothing about whether the agent should have been asked,
> whether its output is correct, or whether the approving human understood
> what they approved. **Approval fatigue is a real failure mode**: an approver
> clicking yes forty times an hour is a rubber stamp with an audit trail. Keep
> approval volume low enough that approvals remain real, which is an argument
> for narrower agent scope rather than for more approvals.
