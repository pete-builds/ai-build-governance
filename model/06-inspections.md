---
title: "06. Inspections"
parent: "Core Governance Model"
nav_order: 6
---

## Purpose

Verifies the running system at defined points, chosen so that checking
happens while the evidence is still visible.

## Failure this prevents

Verification attempted after the evidence is gone. Once a system has fifteen
integrations nobody re-derives what it can reach; once an agent is behind a
polished interface nobody can see what it did.

## Requirement

> **REQUIREMENT 6.1 The do-not-conceal rule**
> Work **MUST NOT** be covered, closed in, or concealed before it has been
> inspected and approved. Where concealed work needs verifying, the
> institution **MAY** require it uncovered at the builder's cost.

This is the one construction term kept verbatim. The idea transfers exactly
and no paraphrase is as memorable.

> **REQUIREMENT 6.2**
> Every capability **MUST** pass five verification points in order.

```
  H1  IDENTITY & CREDENTIALS    before any real data moves
       |
  H2  CONNECTIONS               tools, permissions, egress paths
       |                        before wiring to real systems
  H3  END-TO-END PATH           requires H1 and H2 passed
       |
  H4  PRE-CONCEALMENT           before behavior becomes hidden
       |
  H5  FINAL VERIFICATION        precondition for production approval
```

| Point | Tier 1 | Tier 2 | Tier 3 |
|---|---|---|---|
| H1 Identity and credentials | Automated | Automated | Automated + human |
| H2 Connections | Automated | Automated | Automated + human |
| H3 End-to-end path | Automated | Automated | Automated |
| H4 Pre-concealment | Automated | **Human** | **Human** |
| H5 Final | Automated | Automated | **Human** |

> **GUIDANCE**
> Most cells say automated. That is the design working. Human attention
> appears at pre-concealment, and at final sign-off for high-consequence
> builds, which is where a machine genuinely cannot help.

### H1: Identity and credentials

> **REQUIREMENT 6.3**
> Before any real data moves: no secrets in source, configuration, or
> committed client files, checked against history rather than the working
> tree; credential scope matching the declared minimum; expiry set within
> institutional maximum; budget cap set as a hard stop; rate limits set;
> model access set explicitly rather than inherited as default-all; and the
> credential attributable to a named human or a service account rather than a
> shared secret.

> **REQUIREMENT 6.4**
> Two classes of trap **MUST** be checked because neither is visible from the
> credential: **shared cost pools protected by nothing but their identifier**,
> whose identifiers **MUST** be generated with real entropy and treated as
> secrets; and **privileged accounts exempt from the limits just set**, which
> **MUST** be enumerated and issued as their own recorded event.

### H2: Connections and permissions

> **REQUIREMENT 6.5**
> Before wiring to real systems of record: tool and integration inventory
> matching design review with no extras; egress inventory matching with no
> undeclared paths; **tool definitions pinned with drift alarmed**; no
> credential passed through to a downstream service it was not issued for;
> and private and link-local address ranges blocked for any server-supplied
> URL the client will fetch.

> **REQUIREMENT 6.6**
> Where a build exposes or consumes tools over a protocol, the inspection
> **MUST** be pinned to a stated protocol revision, and the revision **MUST**
> be recorded.

> **REQUIREMENT 6.7**
> Tool descriptions **MUST** be reviewed in full, untruncated, by a human,
> and **alongside the other servers the build will run with**.

> **GUIDANCE**
> 6.7 is the one people skip because it feels paranoid, and it is the
> documented attack. Descriptions can influence model behavior before any
> tool is invoked, and one server's descriptions can influence behavior
> toward another, so a server cannot be cleared in isolation. "We will review
> it when something calls it" does not work.
>
> **Nobody is inspecting these for you.** Platform vendors state plainly that
> they do not security-audit third-party servers, and registry presence
> establishes who published something rather than whether it is safe.
>
> Full checklists live in the templates rather than here, so they can be
> re-pinned without amending the framework:
> [MCP server](../templates/inspection-mcp-server.md),
> [gateway credential](../templates/inspection-gateway-key.md).

### H3: End-to-end path

> **REQUIREMENT 6.8**
> H1 and H2 **MUST** be recorded as passed first. The path **MUST** be
> exercised with synthetic data, failure behavior **MUST** be verified by
> actually breaking a dependency rather than by assertion, errors **MUST**
> surface rather than being swallowed, and real regulated data **MUST NOT**
> be used in testing.

### H4: Pre-concealment verification

The most important point in the framework. It is the moment a system stops
showing its work: an agent moved behind a clean interface, a confirmation
step removed, tool calls chained without surfacing intermediates, or a move
to a schedule so no human is present when it runs.

> **REQUIREMENT 6.9**
> Nothing **MAY** be concealed until its actions are observable and
> reversible. Specifically: every consequential action logged with enough
> context to reconstruct **why**; logging not suppressible by the caller; a
> human able to see what the system did without developer access;
> consequential actions reversible or gated on confirmation; the oversight
> point from design review present in the running system; the rate of
> consequential actions bounded; and for anything advisory, **the human
> override rate measured**.

> **REQUIREMENT 6.10**
> Human sign-off **MUST** be obtained at Tier 2 and above.

> **REQUIREMENT 6.11 Log enough to reconstruct, not everything**
> Observability **MUST NOT** create an unmanaged copy of the data the tier
> exists to protect. Field-level redaction **MUST** be applied where needed
> and verified against an actual stored trace rather than a configuration
> page; retained fields **MUST** each answer a question someone will ask;
> traces **MUST** be classified at the level of their most sensitive content
> and access-controlled to that standard; retention **MUST** follow data
> classification rather than platform default; operational metrics **SHOULD**
> be separated from content-bearing records; and who may read traces **MUST**
> be a named, reviewed list.

> **GUIDANCE**
> The tension between reconstructability and minimization is real and does
> not fully resolve. Resolve it deliberately per capability and **record the
> choice** rather than defaulting to logging everything because the platform
> does. Platforms commonly retain execution data by default with undocumented
> redaction behavior: assume every field the system touches is in that store
> until you have looked.

> **REQUIREMENT 6.12 Where no publish gate exists**
> Where the delivery platform provides no technical approval step before
> production, this point is the only control that exists, and the institution
> **MUST** record that rather than describing the review as though a gate
> enforced it. Above Tier 1 it **MUST** additionally maintain a named list of
> everyone holding edit access, have the Standing Owner accept the credential
> exposure that edit access implies, implement change detection **external to
> the platform**, and adopt at least two compensating controls.

> **GUIDANCE**
> Not hypothetical. At least one widely used Agent Studio platform has no
> publish gate at all, so edit access is production change authority, and
> sharing an artifact conveys use of credentials never explicitly shared.
> Verify your own platform:
> [profiles](../reference/platform-profiles/).

### H5: Final verification

> **REQUIREMENT 6.13**
> Before production approval: all prior points passed and recorded;
> exercised with real data at real scale; **guardrails verified on the paths
> that actually carry traffic** rather than merely enabled; budget and rate
> limits confirmed live under load; every authorization condition verified
> individually; registry entry complete; **rollback exercised rather than
> documented**; and someone other than the builder having operated it
> successfully.

> **GUIDANCE**
> An untested rollback is a hypothesis. Guardrail coverage is routinely
> uneven across a platform's APIs, so a system with guardrails "enabled" can
> carry all its real traffic down an unguarded path. **Test the path from the
> data flow diagram. Do not read the setting.**

## Applicability

All tiers, with the human involvement varying by tier per the table above.
Pre-existing systems under [chapter 08](08-alterations.md) are not inspected
retroactively except for the short unsafe list.

## Required evidence

A recorded pass or fail per point, with date and signer where human sign-off
applies, plus the protocol revision recorded under 6.6.

> **REQUIREMENT 6.14**
> Passes **MUST** be recorded, not only failures. The record that H4 passed
> on a date with a named signer is what makes the alteration path in
> [chapter 08](08-alterations.md) meaningful.

## Exceptions

A failed inspection is a finding with a named remedy, not a judgment. It
**MUST** name what would pass.

> **REQUIREMENT 6.15**
> Inspections **MUST** verify the running system, never a description of it.
> An inspection satisfied by a document is a review, and that already
> happened.

> **REQUIREMENT 6.16**
> Automated checks **SHOULD** run on every change rather than once. H1 and H2
> in particular **SHOULD** be standing checks, because a point that fires
> once verifies a state the system has since left.

## Implementation guidance

**Why this sequence.** Real inspection schedules run foundation, then the
stage where wiring and pipework go in ("rough-in"), then framing, then wall
covering, then final. Framing is inspected only *after* the connections
inside it pass, because otherwise the frame hides them. That dependency
structure is the part worth copying, and 6.8 encodes it.

> **REQUIREMENT 6.17**
> Human inspection load **MUST NOT** be managed by convening a standing
> meeting. Where it grows, the response is more automation or fewer Tier 3
> projects.

> **GUIDANCE**
> A recurring inspection meeting is a change advisory board that has not
> admitted it yet, and
> [Appendix C: The Evidence on Gates](../reference/evidence-on-gates.md) is
> specifically about what happens then.

Worked instance: [Running Example: The Payment Inquiry Agent](../guide/02-running-example.md),
stage 6, where H1 caught a credential with access to every model and H3
caught an error path that produced a plausible-looking wrong answer.

## Sources and confidence

> **VERIFICATION NOTE** (2026-08-04)
> Tool-description attack classes, connection-time loading, and the named
> vulnerabilities behind 6.7 were verified against published security
> research and advisory databases. The vendor statement that MCP servers are
> not security-audited was quoted verbatim. Details and dates:
> [the source ledger](../SOURCES.md).

> **DESIGN JUDGMENT**
> Five verification points, and their placement, are modeled on real
> inspection sequences. No evidence exists that five is the right number for
> software.

> **UNVERIFIED**
> The construction inspection sequence and the concealment rule are described
> from standard practice; primary code sources could not be retrieved.
