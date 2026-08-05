---
title: "06. MCP Approvals"
parent: "Implementation Guide"
nav_order: 6
---

**Who this is for:** builders wiring up tool servers, and the platform team
approving them. Non-binding. The requirements live in
[chapter 06](../model/06-inspections.md) and
[chapter 13](../model/13-third-party.md).

Tool servers are where most institutional AI capability now gets its reach, and
they are the case the framework's two halves meet: a server you build is
governed as a build, and a server you connect is governed as a runtime
dependency on something you do not control. Those are different approvals with
different evidence, and the common mistake is running the first one's checklist
over the second one's situation.

This chapter uses the Model Context Protocol as the worked instance because it
is the case with verified findings behind it. The routing generalizes to any
tool-server protocol.

---

## First, which route are you on

Three routes, and the distinction that matters is not who wrote the code. It is
**who can change what runs, without asking you.**

| | **A. You build it** | **B. You self-host someone else's** | **C. You connect a remote server they operate** |
|:--|:--|:--|:--|
| Who wrote it | You | Someone else | Someone else |
| Who runs it | You | You | Them |
| Can you read the internals | Yes | Yes, in principle | **No** |
| Who can change it under you | You | **You choose when to upgrade** | **They do, whenever** |
| Governed as | A build | A build, with provenance | A **third-party dependency** |
| Primary chapter | [06](../model/06-inspections.md) | [06](../model/06-inspections.md) plus [10](../model/10-concurrent-reviews.md) | [13](../model/13-third-party.md) |
| Inspection instrument | [MCP server template](../templates/inspection-mcp-server.md) | Same, plus dependency provenance | [Third-party boundary template](../templates/inspection-third-party-mcp.md) |

**Route B is safer than route C in exactly one respect, and it is the decisive
one: upgrading is your decision.** You can pin a version and stay on it while
you review the next one. On route C the operator ships when they ship, and your
first notice is your own drift alarm, if you built one.

That single difference is why route C gets its own chapter and its own
instrument. Everything else about routes B and C looks similar and is not.

---

## Route A: you are building a server

Ordinary build governance. Nothing here is special to MCP except the
inspection content.

1. [Statement of need](../model/02-statement-of-need.md). A tool server is
   frequently the answer to a need better met by a certified component that
   already exists. Check [the registry](../model/07-production-approval.md)
   before building a fourth server over the same system of record.
2. [Classify](../model/03-classification.md) the server **and** its intended
   uses. A server is often the component that supplies a trifecta leg to
   everything that connects to it.
3. [Design review](../model/04-design-review.md), where the tool and egress
   inventories are the load-bearing artifacts.
4. H1 and H2 per [chapter 06](../model/06-inspections.md), using the
   [MCP server inspection template](../templates/inspection-mcp-server.md).
   **Pin the template to a protocol revision and record which one.** The
   protocol has removed features between revisions, so a checklist written
   against an older one asks for things that no longer exist.
5. H4 before the server's behavior moves behind an interface.
6. [Production approval](../model/07-production-approval.md), then consider
   [certifying it](../model/11-certified-components.md) so the second consumer
   inherits your inspection instead of repeating it.

**The one thing most likely to be skipped:** reading every tool description in
full, untruncated, alongside the other servers the client will run with
([requirement 6.7](../model/06-inspections.md)). Descriptions enter model
context at connection time, so a server can influence behavior without ever
being invoked, and one server's descriptions can influence behavior toward
another. A server cannot be cleared in isolation from the set it is deployed
with.

**If you intend to certify it,** decide that before H2 rather than after
production approval. Certification requires stated scope, tier ceiling,
permitted data classes, conditions of use, and **exclusions**
([requirement 11.4](../model/11-certified-components.md)), and those are far
cheaper to write while the design review is open.

---

## Route B: you are self-hosting a server someone else wrote

Treat it as a build, because operationally it is one. You control the version,
the credentials it holds, its network position, and when it changes. Two
additions:

- **Provenance is now a review item.** Who publishes it, what its dependencies
  are, and whether those are pinned. Registry presence establishes who
  published something, not whether it is safe.
- **Upgrading is an alteration.** A new version is a new set of tool
  definitions, which is [chapter 08](../model/08-alterations.md) re-entry at
  H2, not a package bump. This is the requirement route B exists to make
  visible, and it is the one that decays first because upgrades feel like
  maintenance.

Run the [MCP server template](../templates/inspection-mcp-server.md) as
written. You can answer every question in it, which is precisely what route C
cannot do.

---

## Route C: you are connecting to a vendor or third-party remote server

This is [chapter 13](../model/13-third-party.md). The move that makes it
tractable is to stop trying to inspect the server and inspect **the boundary**
instead.

### What you cannot do, stated plainly

You cannot read the code. You cannot enumerate its egress. You cannot verify
that the tool descriptions you reviewed on Tuesday are the ones loaded on
Friday, only detect that they changed. You cannot prevent a change at all. And
you cannot fix any of that with a questionnaire, because every answer would
come from the party whose behavior is in question
([requirement 13.3](../model/13-third-party.md)).

### What you can do, and must

| Control | Requirement | Why it survives not controlling the server |
|:--|:--|:--|
| Inspect the boundary, not the component | [13.2](../model/13-third-party.md) | The boundary is yours, and it is where the harm crosses |
| Record who holds change authority | [13.4](../model/13-third-party.md) | Names the real risk instead of documenting a control you lack |
| Pin definitions and alarm on drift | [6.5](../model/06-inspections.md) | Detection is the only thing left once prevention is gone |
| Exercise a revocation path | [13.5](../model/13-third-party.md) | The drift alarm asks "cut it off now?" and someone has to be able to |
| Name the operator in the egress inventory | [13.6](../model/13-third-party.md) | Their boundary is a destination your data reaches |
| Reclassify on connection | [13.7](../model/13-third-party.md) | The connection usually supplies the external-communication leg |
| Set a re-check interval and a holder | [13.8](../model/13-third-party.md) | Nothing else will ever look at it again |

Use the
[third-party boundary inspection template](../templates/inspection-third-party-mcp.md).
It deliberately does not ask questions you cannot answer.

### Scope is the cheapest control you have

Most of what makes a remote server dangerous is the breadth of what it can
reach on your behalf, and that is set entirely by you. Before negotiating
anything with an operator, cut the credential scope, cut the data classes
allowed to cross, and cut what its output is permitted to act on. All three are
unilateral.

### If the connection is proxied through an AI gateway

The proxy is a second component with its own attack surface, and published
advisories for gateway products have included tool-server auth bypass and
command execution through test endpoints. Check the **gateway's** advisories in
addition to the server's, and confirm whether the gateway's own tool-proxying
path is in use at all before assuming its controls apply. See the
[platform profiles](../reference/platform-profiles/mcp.md).

---

## Approval routing, condensed

| Situation | Approval needed |
|:--|:--|
| New server, internal data, one consumer | Build path, route A |
| New server intended for reuse | Route A, then certification under [chapter 11](../model/11-certified-components.md) |
| Self-hosting a published server | Route B. Upgrades re-enter at H2. |
| Connecting a remote server, Tier 1 | Route C, boundary inspection, no revocation drill required |
| Connecting a remote server, Tier 2 or 3 | Route C in full, including an exercised revocation path and a named re-check holder |
| Consuming an already certified internal server | [Requirement 11.5](../model/11-certified-components.md). Inspect your integration only. |
| A remote server whose operator will not say what changed, at Tier 3 | Not approvable on this path. Either self-host a pinned version, moving to route B, or decline. |

That last row is the only outright refusal in this chapter, and it follows from
[13.5](../model/13-third-party.md) rather than from distaste: at Tier 3 you need
detection plus a working cutoff, and detection you cannot interpret is not
detection.

---

## Where this leaves the open questions

**Two things here are honestly unresolved.** Whether an institution can staff a
re-check interval for every third-party dependency it accumulates is unknown,
and if it cannot, [13.8](../model/13-third-party.md) will lapse silently in the
way certification surveillance can. And there is no independent body certifying
tool servers, so [chapter 11](../model/11-certified-components.md) can only be
run by the institution on its own behalf. Both are stated in
[chapter 13](../model/13-third-party.md) rather than papered over.
