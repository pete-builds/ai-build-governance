# 13. Delegated Authority

**The requirement this chapter answers:** an agent acts, and the thing
that authorizes the action is a specific human's identity. Not a shared
service account. Not a standing blanket consent. A named person, whose
authority the agent is borrowing, for this action, recorded.

Done properly this is the strongest control in the whole model, because
it makes an agent structurally incapable of exceeding the authority of
the person it acts for. Done carelessly it is the most dangerous, because
it hands an agent a human's full entitlements and erases the distinction
between them in the audit log.

The difference between those two outcomes has a name.

---

## Delegation, not impersonation

OAuth 2.0 Token Exchange (**RFC 8693**, Proposed Standard, January 2020)
draws the distinction precisely, and it is the vocabulary to use
([RFC 8693](https://datatracker.ietf.org/doc/html/rfc8693)):

- **Impersonation**: "A is given all the rights that B has... it is
  indistinguishable from B." Downstream systems cannot tell the
  difference, and neither can your logs.
- **Delegation**: "A still has its own identity separate from B... A is
  an agent for B."

**The governing rule of this chapter: agents delegate. Agents never
impersonate.**

Impersonation is attractive because it is easy. It requires no changes
downstream, everything just works, and the agent can do whatever the
person could. Every one of those is the problem. When an impersonating
agent does something wrong, the record says the human did it, and there
is no way to establish otherwise.

RFC 8693 also supplies the mechanics worth knowing, because they show
what "recorded properly" looks like:

- A **`subject_token`** identifies the party on whose behalf the request
  is made. An optional **`actor_token`** identifies the party acting, and
  its presence is what signals delegation rather than impersonation.
- An **`act`** claim expresses that delegation occurred and identifies
  the actor. It supports **nested chains**, where the outermost element
  is the current actor.
- A **`may_act`** claim is a forward-looking statement that a party is
  authorized to become an actor for another.

You do not need to implement RFC 8693 to adopt the idea. You need the
property it encodes: **the token, and therefore the log, states both who
acted and whose authority was used.**

Note that the MCP specification does not use RFC 8693's vocabulary. It
addresses the adjacent concerns: the confused deputy problem, a
prohibition on token passthrough, session and state handling, and scope
minimization. So MCP tells you what not to do; RFC 8693 gives you the
name for what to do instead.

---

## The three questions

Every agent action taken under delegated authority must answer all three,
and the answers must be in the record:

1. **Whose authority?** A named human, resolved through the institution's
   identity system. Not a team, not a role alias, not a service account
   standing in for a person.
2. **What subset of it?** The agent receives a **subset** of that human's
   entitlements, scoped to the task. Never the union of several people's
   rights. Never more than the human has.
3. **Who approved, and to what?** An authenticated approval event, bound
   to a described action, time-limited.

### On question 2, which is where designs fail

An agent must **never** hold authority the delegating human does not
have. This sounds obvious and is violated constantly, usually by
convenience: the agent runs with a service account that can reach
everything, and a human's identity is checked only at the front door.

That design has a name in the MCP specification's own threat list: the
**confused deputy** problem. The agent holds broad authority and is
induced to use it on behalf of someone who should not have it. Front-door
authentication does not fix it, because the authority being exercised is
the agent's, not the user's.

The test: **if the human could not do it manually, the agent must not be
able to do it for them.** If your architecture cannot enforce that, you
have impersonation with extra steps.

---

## Approval authenticated to a person

"Human identity as authentication" means the approval event is itself
authenticated, producing a record that a specific person authorized a
specific thing.

Requirements:

- [ ] The approver authenticates through the institution's identity
      system at approval time. A checkbox in an application the agent
      also controls is not an authentication event.
- [ ] The approval names **what** is being approved in terms the approver
      can evaluate. "Allow this agent to act" is not an approval. "Send
      this message to these 40 people" is.
- [ ] The approval is **time-limited**, or single-use, or both
- [ ] The record is **non-repudiable** to the extent your identity system
      supports: who, what, when, from where
- [ ] Approval is **separable from execution**. The identity that
      approves is not the identity that performs, or the approval means
      nothing.
- [ ] Declining is a supported outcome that leaves the system in a valid
      state

### The standing-consent trap

The most common way this control is quietly destroyed: a user is asked
once, approves once, and the agent treats that as consent for everything
it does thereafter.

If you have standing consent, you no longer have per-action human
authority. You have an agent with a human's credentials and a historical
record that someone once said yes.

Standing consent is sometimes the right engineering answer. When it is,
say so explicitly, record it as a variance under
[chapter 05](05-permits.md), and note that the capability is now Tier 3
under chapter 03's autonomy trigger, because it takes consequential
action without per-action approval. What is not acceptable is holding
standing consent while describing the system as human-approved.

---

## Anti-patterns

| Anti-pattern | Why it fails |
|---|---|
| **Shared service account for all users** | Loses whose authority was used. Every action attributes to the agent. Creates the confused deputy condition by construction. |
| **Token passthrough** | Forwarding a token that was not issued for the receiving service. The MCP spec forbids this: servers **MUST NOT** accept tokens not explicitly issued for them. It breaks audience validation and the audit chain. |
| **Impersonation tokens** | Downstream cannot distinguish agent from human. Your incident review has nothing to work with. |
| **Union of entitlements** | An agent serving several users accumulating the superset of their rights. Now every user can reach everything, transitively. |
| **Standing consent presented as approval** | Described above. |
| **Approval inside the agent's own trust boundary** | If the agent can influence the approval UI or the approval record, the approval is not independent. |
| **Identity checked at the front door only** | Authorization must be enforced where the action happens, not where the conversation starts. |

---

## What the record must contain

Per [chapter 07](07-occupancy-and-records.md), if it is not recorded it
did not happen. For each consequential action under delegated authority:

| Field | Notes |
|---|---|
| Acting identity | The agent, versioned |
| Authority identity | The named human |
| Approval reference | The authenticated approval event |
| Action | What was actually done, specifically |
| Scope used | Which entitlement was exercised |
| Delegation chain | If the agent invoked another agent or tool, the full chain, outermost actor first |
| Outcome | Success, failure, or refusal, and any external effect |
| Timestamp | With timezone |

The delegation chain row is the one that gets omitted and the one you
will want most. Multi-agent systems produce chains, and a record that
shows only the last hop cannot answer whose authority was ultimately
used.

---

## Where this is checked

| Hold point | Check |
|---|---|
| Plan review | Delegation model stated: which identity acts, whose authority, how approval is authenticated. Impersonation designs are a blocking finding. |
| H1 Foundation | Agent's own credentials are scoped so they cannot exceed a delegating human's rights. No shared account standing in for people. |
| H2 Rough-in | No token passthrough. Audience validation. Per-client consent on any proxy. Scopes minimized. |
| H4 Concealment | Approval events are authenticated and recorded. Delegation chain is captured. Standing consent, if any, is declared and tiered accordingly. |
| H5 Final | An approval and its resulting action have been traced end to end in the record by someone other than the builder. |

---

## The construction parallel, and its limit

Construction has this concept. A contractor performs work under a permit
issued to an owner, and an authorized agent may sign on the owner's
behalf where that authority is documented. The authority is delegated,
bounded, and written down, and the party performing the work is not the
same as the party whose authority permits it.

Where the parallel breaks: a contractor cannot act ten thousand times a
second, and cannot be induced to misuse delegated authority by a
carefully worded email. Delegation in an agentic system needs rate limits
and a prompt-injection analysis, which no construction concept supplies.
See [chapter 10](../handbook/03-agentic-products.md).

---

## Honest accounting

**Verified:** RFC 8693's existence, status, and date; its explicit
distinction between impersonation and delegation, quoted; the
`subject_token`, `actor_token`, `act`, and `may_act` mechanics; that the
MCP specification addresses confused deputy, forbids token passthrough,
and covers scope minimization, but does **not** use RFC 8693's delegation
vocabulary.

**Not verified:** RFC 9068, the JWT access token profile, was not
retrieved, so no claim is made here about how it represents actor claims.

**Design judgment, not findings:** the three questions; the requirement
that approval be separable from execution; the treatment of standing
consent as a variance plus an automatic Tier 3 trigger; and the contents
of the delegation record. These follow from the impersonation-versus-
delegation distinction rather than being independently established.

**A limit worth stating:** delegated authority constrains what an agent
*may* do. It does nothing about whether the agent should have been asked
in the first place, whether its output is correct, or whether the human
approving understood what they approved. That last one is the real
weakness of every human-in-the-loop control, and no token format
addresses it. Approval fatigue is a genuine failure mode: an approver who
clicks yes forty times an hour is a rubber stamp with an audit trail.
Keep the volume of approvals low enough that they remain real, which is
an argument for narrower agent scope rather than for more approvals.
