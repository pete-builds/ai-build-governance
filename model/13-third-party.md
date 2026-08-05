---
title: "13. Third-Party Capabilities"
parent: "Core Governance Model"
nav_order: 13
---

## Purpose

Governs the components a build depends on at runtime but the institution does
not operate: a server someone else hosts, a tool catalog someone else
publishes, a retrieval or model service reached across an institutional
boundary.

## Failure this prevents

**Inspecting the wrong thing, and recording the result as though it were the
right thing.** Every verification point in
[chapter 06](06-inspections.md) assumes the institution controls the artifact
it is checking. Applied to a component operated by someone else, the same
checklist produces a document that looks like an inspection and verifies
almost nothing: the operator can change the component the day after it passes,
and the institution finds out, at best, from its own alarm.

The second failure is quieter. A component nobody at the institution built
also has nobody at the institution accountable for it, so it lands in the gap
between "we reviewed the vendor" and "we reviewed the build," and neither
review covers what it actually does at runtime.

## Requirement

> **REQUIREMENT 13.1 What this chapter covers**
> This chapter applies where a capability the institution builds or assembles
> **depends at runtime on a component the institution does not operate**. It
> does **NOT** apply to finished commercial products procured whole, which are
> governed elsewhere.

> **GUIDANCE**
> The distinction is runtime dependency inside something you own, not who paid
> for what. Buying a finished analytics product is procurement. Wiring that
> product's tool server into an agent you built is this chapter, because the
> thing in production is yours and the component is not.

> **REQUIREMENT 13.2 You cannot inspect what you do not run**
> Where the institution cannot inspect a component's internals, it **MUST NOT**
> record an inspection of that component. It **MUST** instead inspect the
> **boundary**: what data crosses outward, what comes back and what may act on
> it, which credentials the component holds, and what it can reach while acting
> for the institution.

> **GUIDANCE**
> This is the whole chapter in one move. The boundary is inspectable, stable,
> and yours. The component is none of those things. An inspection record that
> claims otherwise is the documented false assurance
> [principle 1.5](01-principles.md) forbids.

> **REQUIREMENT 13.3 Self-attestation is not certification**
> A component's own operator **MUST NOT** be recorded as the certifying party
> under [chapter 11](11-certified-components.md). Vendor documentation, a
> published trust page, a compliance report the vendor commissioned, and
> presence in a public registry **MUST NOT** be recorded as a certification.

> **GUIDANCE**
> [Requirement 11.7](11-certified-components.md) already says certification
> authority cannot rest with the builder. For a third-party component the
> operator **is** the builder, so accepting its self-description as
> certification is that rule failing in the one case it was written for.
>
> Registry presence in particular reads like assurance and is not: public
> registries commonly validate who published something rather than whether it
> is safe. See the [MCP profile](../reference/platform-profiles/mcp.md) for a
> verified instance.
>
> A third party **MAY** be certified under chapter 11 by the institution
> itself, or by an independent party the institution accepts. That is a
> different act from believing the operator.

> **REQUIREMENT 13.4 Name who holds change authority**
> Connecting a component the institution does not operate **transfers
> production change authority over the dependent capability to that
> component's operator**. The institution **MUST** record this, name the
> operator, and record that the Standing Owner accepted it.

> **GUIDANCE**
> This is [requirement 6.12](06-inspections.md) pointed outward. Where a
> delivery platform has no publish gate, edit access is production change
> authority and the institution records that rather than pretending a gate
> exists. A third-party component is the same condition with the edit access
> held by somebody outside the institution entirely, on their own release
> cadence, with no obligation to announce.

> **REQUIREMENT 13.5 Detection replaces prevention, so revocation must work**
> For a component the institution operates, pinning a definition **prevents**
> change. For one it does not, pinning only **detects** change after the fact.
> Above Tier 1 the institution **MUST** therefore hold a revocation path that
> disconnects the component without taking down the dependent capability
> silently, and that path **MUST** be exercised rather than documented.

> **GUIDANCE**
> An unexercised revocation path is a hypothesis, for the same reason
> [requirement 6.13](06-inspections.md) requires rollback to be exercised. The
> question a drift alarm raises is "cut it off now?", and the answer arrives at
> whatever hour the alarm does. Find out beforehand whether anyone can.

> **REQUIREMENT 13.6 The boundary is an egress path**
> The component's operator **MUST** appear in the egress inventory from
> [design review](04-design-review.md) as a destination in its own right, and
> the data classes permitted to cross **MUST** be stated positively rather
> than by exclusion.

> **REQUIREMENT 13.7 A third-party dependency never lowers a tier**
> Classification under [chapter 03](03-classification.md) runs in full against
> what the assembled capability touches, decides, and affects. That a component
> came from outside **MUST NOT** reduce a tier, and the fact that its operator
> assumes some risk **MUST NOT** be recorded as a control the institution holds.

> **GUIDANCE**
> Connecting an outside component frequently supplies a trigger the build did
> not previously have, most often external communication, which is the leg that
> completes the lethal trifecta. Reclassify on connection. Chapter 08's
> alteration table already routes a new integration to H2 plus
> reclassification, and this is the case it most often misses because the
> integration arrived as a procurement rather than as engineering work.

> **REQUIREMENT 13.8 Re-check on an interval, because nothing else will**
> Every third-party dependency above Tier 1 **MUST** carry a named re-check
> interval and a named person who holds it. Absent a certification there is no
> surveillance mechanism, and the dependency would otherwise be checked exactly
> once.

> **REQUIREMENT 13.9**
> A dependency the institution has no path to remove **SHOULD** be recorded as
> an accepted institutional dependency with a named approver, rather than
> described as a component choice.

## Applicability

All tiers for 13.1 through 13.4, 13.6, and 13.7. Requirements 13.5 and 13.8
apply above Tier 1. Pre-existing third-party connections are handled by
[chapter 08](08-alterations.md) on the same pre-existing terms as anything
else, with the amnesty inventory the place they first become visible.

## Required evidence

| Artifact | Demonstrates |
|---|---|
| Boundary inspection record, distinct from any component inspection | 13.2 |
| Named operator, with recorded Standing Owner acceptance | 13.4 |
| Dated record of the revocation path being exercised | 13.5 |
| Egress inventory naming the operator, with permitted data classes | 13.6 |
| Classification record post-connection | 13.7 |
| Re-check interval, holder, and history | 13.8 |

## Exceptions

> **REQUIREMENT 13.10**
> None to 13.3. A recorded exception permitting self-attestation as
> certification would void the certification mechanism generally, not only for
> the component in question.

Other requirements follow the standard recorded-exception path, and at Tier 3
a departure from 13.5 requires the Final Decision Authority rather than the
Standing Owner.

## Implementation guidance

**Where the analogy stops helping.** Building governance handles this with a
certification issued by an independent laboratory against published criteria,
which is [chapter 11](11-certified-components.md). No equivalent independent
body exists for most software components an institution will want to connect,
and the registries that look like one are not. So the mechanism this chapter
reaches for is not certification. It is a smaller boundary, a working
revocation path, and an honest record of who can change your production
behavior without asking.

**Do not build a vendor questionnaire.** The temptation is a long form the
operator fills in, which produces exactly the self-attestation 13.3 refuses,
plus a queue. The institution's own answers to 13.2, 13.5, and 13.6 are worth
more than any of the operator's answers, and it can produce them without the
operator's cooperation.

**The cheapest useful control is scope.** Most of what makes a third-party
connection dangerous is the breadth of what it can reach, and that is set by
the institution, not the operator.

Worked path for the common case:
[MCP approvals](../guide/06-mcp-approvals.md), which covers building a server
and connecting to one you did not build, and routes to the boundary inspection
template.

## Sources and confidence

> **VERIFICATION NOTE** (2026-08-05)
> The verified basis for 13.3 is specific and narrow: a major platform vendor
> states it "does not security-audit or manage any MCP server," and the
> official protocol registry validates publisher namespace ownership only,
> with no security review. Both were fetched and are recorded in
> [the source ledger](../SOURCES.md) with dates. The generalization from those
> two facts to "self-attestation is not certification" is design judgment, not
> a verified finding about any other operator.

> **DESIGN JUDGMENT**
> The tier thresholds in 13.5 and 13.8, the requirement to exercise revocation,
> and the decision to give third-party components their own chapter rather than
> extending chapters 06 and 11 are reasoned rather than measured.

> **UNVERIFIED**
> No published higher-education practice was located for governing runtime
> dependencies on third-party AI components, as distinct from procuring
> finished products. The distinction this chapter draws in 13.1 may not match
> how any institution actually divides the work.
