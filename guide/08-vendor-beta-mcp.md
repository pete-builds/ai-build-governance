---
title: "08. Vendor Beta Connections"
parent: "Implementation Guide"
nav_order: 8
---

# Vendor Beta Connections

**The situation.** A vendor has built a tool server. They want help beta testing
it, and they want it connected to your AI gateway so your people can use it
against real work. It is free, they are responsive, and somebody senior is
already enthusiastic.

This is the hardest third-party case in practice and the one most likely to skip
governance entirely, because nothing about it feels like a procurement and
nobody thinks they are deploying anything.

[Route C](06-mcp-approvals.md) already covers connecting to a vendor-operated
server, and everything there applies. This page covers the four things a **beta**
changes, and they are not small.

**This page binds nobody.** The requirements it operates are in
[chapter 13](../model/13-third-party.md), [chapter 05](../model/05-authorization-to-build.md),
and [chapter 07](../model/07-production-approval.md). It adds none.

---

## Why a beta is not just an early version of route C

### 1. There is nothing to pin

Route C's central control is to pin tool definitions and alarm on drift, because
[detection is all you have left once prevention is gone](../model/13-third-party.md).
A beta breaks that control at the root: the software changes continuously, that
is what a beta is for, and a drift alarm that fires every few days gets muted
within a fortnight.

**What to do instead.** Do not pretend to pin. Record that you cannot, name it as
the reason the connection carries higher residual risk, and shift the control
from detection-of-change to bounding-the-blast-radius: narrow credential scope,
narrow permitted data classes, narrow what the output is allowed to act on.
[Scope is unilateral](06-mcp-approvals.md), and during a beta it is the only
control that holds still.

Then set the re-check interval by calendar rather than by change event, per
[13.8](../model/13-third-party.md), and accept that its holder is signing up for
recurring work for as long as the beta runs.

### 2. Your usage is the consideration, and nobody classified that flow

The beta is free because you are paying in telemetry. Bug reports, usage
patterns, prompts, failure cases, and often the content those prompts carried.
That is an outbound data flow to a party outside the institution, and it is
routinely the only data flow in the whole arrangement that never gets written
down, because it does not look like an integration.

**Classify it.** It is an egress path and belongs in the egress inventory with the
operator named, per [13.6](../model/13-third-party.md). Then answer, in writing:

- What leaves in a bug report or a support session, including screenshots.
- Whether the vendor's telemetry is on by default, and whether you can turn it off.
- Whether prompts and tool arguments are retained on their side, and for how long.
- Whether your traffic trains anything.
- What happens to all of it when the beta ends.

If the answer to any of these is "we would have to ask", the connection is not
ready, and asking is free.

### 3. The people evaluating it want it to succeed

A beta creates a relationship. Your staff are now collaborating with the vendor,
have a channel to their engineers, and are getting attention they do not get from
incumbent suppliers. That is genuinely valuable and it compromises the review.

The framework already holds this principle elsewhere: the certifier is never the
builder, and [requirement 6.13](../model/06-inspections.md) wants somebody other
than the builder to have operated the thing. Apply the same separation here. **The
person who owns the vendor relationship does not sign the boundary inspection.**

This is not a suspicion of anybody. It is that enthusiasm is a poor instrument
for detecting the absence of a control.

### 4. Self-attestation is at its weakest, and there is no exception path

Pre-release software rarely has a security posture to describe, let alone an
audited one. Whatever assurance you get will be the vendor's own account of their
own product, which is exactly what
[requirement 13.3](../model/13-third-party.md) says is never certification. **13.3
is the one requirement in the chapter with no exception path at all**, per
[13.10](../model/13-third-party.md), because permitting attestation to count once
voids the mechanism generally.

So: a vendor beta is connectable, and it is never certifiable. Do not let it
become a [certified reusable component](../model/11-certified-components.md) on the
strength of having worked for a term.

---

## The gateway is where this gets specific

Connecting through an AI gateway means issuing a credential, and the credential's
properties are now doing most of your governance. What follows is about
**LiteLLM**, verified at the date in the
[source ledger](https://github.com/pete-builds/ai-build-governance/blob/main/SOURCES.md),
and it does not generalize to gateway products as a category. Check your own
gateway's behavior the same way, by testing it rather than reading its
configuration.

| Verified property of LiteLLM | Why it matters for a vendor beta |
|:--|:--|
| A caller can pass `"no-log": true` per request and suppress logging, unless `global_disable_no_log_param: true` is set | Your audit trail for the beta is opt-out **by the caller**. Confirm this is set before you rely on gateway logs as evidence |
| Rate limits do not apply to proxy admin users | An admin-level key defeats the cost bound you thought you had. A beta key is never an admin key |
| Key rotation with a grace period, SSO, and per-key guardrail control are enterprise-gated | If you are not on that tier, some controls you are assuming exist do not |
| Guardrails on the unified path exclude some API surfaces | A guardrail that does not cover the path the traffic actually takes is a documented control that is not enforced |
| Ten published security advisories, two of them MCP-specific | The gateway is a second component with its own attack surface. Check its advisories, not only the vendor's |

Practical consequences, all unilateral and none requiring the vendor's agreement:

1. **Issue a dedicated key**, scoped to the beta, never reused, never admin.
2. **Cap the budget** at a number you would be willing to lose, and treat
   exhaustion as a stop rather than a top-up conversation.
3. **Set an expiry on the key that is shorter than the beta.** Renewal is a
   decision point you get for free.
4. **Confirm the gateway's tool-proxying path is actually in use** before assuming
   the controls attached to it apply. [Guide 06](06-mcp-approvals.md) makes this
   point and it is worth repeating, because assuming it is the common error.
5. **Verify the revocation path by using it**, per
   [13.5](../model/13-third-party.md). Revoke the key, confirm the connection
   fails, restore it. Do this during the beta, not at the end.

---

## The failure this whole page prevents

**A beta becoming production without anybody deciding.**

That is [chapter 07's first stated failure](../model/07-production-approval.md):
software arriving in production by gradually being used more, with nobody having
decided. A vendor beta is the purest form of it. There is no purchase order, no
go-live, no announcement. People start relying on it, the term ends, and now
removing it would break someone's work. At that point you have a production
dependency you never approved, on software with no committed version, operated by
a party you cannot inspect, and [13.9](../model/13-third-party.md) says a
dependency with no path to removal should be recorded as an accepted
institutional dependency with a named approver rather than described as a
component choice.

**The mechanism that prevents it is an expiry, not a policy.** Use a
[time-limited production approval](../model/07-production-approval.md) rather than
a full one. It expires on a date. When it does, somebody must either approve it
properly or turn it off, and both are decisions. The model's default suggestion is
90 days renewable once, and the model also says plainly that 90 is the most
arbitrary number in it, so pick your own.

---

## Two agreement terms that can make it ungovernable

Check these before technical work starts, because they are not negotiable later.

**An NDA that prevents you from keeping the record.** Chapter 07 requires a
registry entry describing what is running, what it can reach, and who owns it.
[Chapter 12](../model/12-delegated-authority.md) requires a record of whose
authority an agent acted under. If the beta agreement prevents you from recording
or disclosing what the thing does, you cannot govern it, and the correct answer is
to fix the agreement or decline. Note that this is separate from confidentiality
about the vendor's implementation, which is ordinary and fine.

**A term that makes the beta the vendor's evidence.** Being named as a design
partner or reference customer converts your pilot into their marketing, and it
will be read externally as your institution having validated the product. That is
a decision for whoever can make it, and it is not the project team.

---

## What to produce

| Artifact | Why |
|:--|:--|
| [Boundary inspection](../templates/inspection-third-party-mcp.md), signed by somebody who does not own the vendor relationship | [13.2](../model/13-third-party.md), plus the conflict in point 3 above |
| Classification record made **after** deciding to connect | [13.7](../model/13-third-party.md). The connection usually supplies the external-communication leg, and a third-party dependency never lowers a tier |
| Egress inventory entry naming the operator and the permitted data classes, including the telemetry flow | [13.6](../model/13-third-party.md) and point 2 above |
| Dated record of the revocation path being exercised | [13.5](../model/13-third-party.md) |
| Time-limited production approval with an expiry date | The failure above |
| Re-check interval by calendar, with a named holder | [13.8](../model/13-third-party.md), since drift detection is unavailable |
| A written answer on what happens to your data when the beta ends | Point 2. Nobody asks this later |

**Accessibility does not pause for somebody else's beta.** If the capability
produces output for people, it is subject to the standard, and pre-release
software commonly fails it. [Guide 04](04-accessibility.md) covers the
obligation, which has a statutory deadline for public institutions in the United
States and does not care about the maturity of the software.

---

## When to decline

- The vendor will not say what changed between builds, and the capability is
  Tier 3. This is already the one outright refusal in
  [route C](06-mcp-approvals.md), and a beta is the case that produces it most
  often.
- The agreement prevents keeping the records chapters 07 and 12 require.
- The only available credential is admin-scoped.
- Nobody will hold the calendar re-check for the life of the beta. An unheld
  interval fails silently, which is the same weakness
  [certification surveillance](../model/11-certified-components.md) has and the
  reason both are stated rather than assumed.

Declining a free beta is a real cost and it is sometimes right. Saying so early is
much cheaper than saying it after people depend on the thing.
