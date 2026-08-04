# 05. Authorization to Build

## Purpose

Authorizes construction of a specific capability, per reviewed documents,
subject to named conditions and an expiry date. It does **not** authorize
production operation, which is [chapter 07](07-production-approval.md).

## Failure this prevents

Authorization becoming a permanent entitlement. Institutions accumulate
approved-but-abandoned projects, each holding a live credential, a budget
line, and an unowned integration, and nothing ever asks whether they still
exist.

## Requirement

> **REQUIREMENT 5.1**
> An authorization to build **MUST NOT** confer permission to operate in
> production. Those are separate acts with separate evidence and separate
> signers.

> **GUIDANCE**
> Collapsing them is why "it's approved" comes to mean "it's live." The
> construction analogy keeps them apart deliberately: a building permit does
> not entitle you to move in.

> **REQUIREMENT 5.2**
> Every authorization **MUST** carry conditions, and each condition **MUST**
> be verifiable at a named verification point. A condition nobody checks is
> not a condition.

> **REQUIREMENT 5.3**
> Every authorization **MUST** expire.

| Event | Default |
|---|---|
| Work must begin within | 60 days of issue |
| Authorization lapses if no verification point passes within | 180 days |
| Tier 3 authorizations expire at | 12 months, renewable |

> **LOCAL AMENDMENT REQUIRED**
> These intervals are invented. Set your own.

> **REQUIREMENT 5.4 What each tier authorizes**

**Tier 1, self-certified.** The builder records the Statement of Need and
proceeds. Automated checks still apply: exempt from review, not from
verification. Self-issued approval is valid only within declared scope, and
**any trigger crossing into Tier 2 voids it immediately.**

> **REQUIREMENT 5.5**
> Tier 1 exemptions **MUST** be published as a list. An unpublished exemption
> is an invitation to argue.

**Tier 2, standard.** Peer design review with published turnaround, automated
checks plus one human verification point (H4), approval issued by a peer,
conditions attached and recorded.

**Tier 3, independent review.** Reviewer off the project, full verification
set with human sign-off at H1, H4, and H5, approval issued by the Final
Decision Authority, a named Standing Owner as a **precondition rather than a
deliverable**, and time-limited by default.

> **REQUIREMENT 5.6 Standard conditions**
> Institutions **SHOULD** carry these in their amendments:

| Condition | Verified at |
|---|---|
| Budget cap set as a hard stop rather than an alert | H1 |
| Credential scoped to the declared minimum | H1 |
| Credential expiry within institutional maximum | H1 |
| No secrets in source, config, or client files | H1 |
| Egress limited to the declared inventory | H2 |
| Tool definitions pinned, drift alarmed | H2 |
| Logging enabled and not caller-suppressible | H4 |
| Human oversight point present and reachable | H4 |
| Guardrails verified on the paths that carry traffic | H5 |
| Registry entry complete with named owner | H5 |

> **GUIDANCE**
> The guardrail condition needs care. Coverage is routinely uneven across a
> platform's APIs, so a condition reading "guardrails enabled" is satisfiable
> while the traffic that matters flows down an unguarded path. **Write
> conditions against the paths in the data flow diagram, and test the path
> rather than reading the setting.** Per-platform gaps are in the
> [profiles](../reference/platform-profiles/).

## Applicability

All tiers. Tier 1 self-issues; Tiers 2 and 3 are issued by another party.

## Required evidence

The issued authorization naming the reviewed documents, its conditions each
mapped to a verification point, its expiry dates, and the issuing party.

## Exceptions

> **REQUIREMENT 5.7 Recorded exceptions**
> A documented, justified departure from a requirement **MAY** be granted by
> a named authority. It **MUST** record which requirement, why compliance is
> impractical, what compensating control applies, who granted it, and when it
> will be revisited.

> **REQUIREMENT 5.8**
> Recorded exceptions **MUST** be tracked in aggregate. **Repeated exceptions
> against the same requirement are evidence the requirement is wrong**, not
> evidence that builders are unruly.

> **GUIDANCE**
> Make this path respectable. A framework with no legitimate exception route
> gets bypassed rather than amended, and then you have lost the control and
> the information.

## Implementation guidance

**Stop-work.** The institution **MUST** name who may order work stopped, and
it **SHOULD** be a small number of people reachable within a day. Grounds:

- Work proceeding past a failed or skipped verification point
- Data flowing that the authorization does not cover, especially a prohibited
  class
- An active credential exposure
- A capability operating outside its declared scope

The action is proportionate and reversible where possible: disable the
credential, unpublish the tool, deactivate the workflow. Not "delete the
project."

> **GUIDANCE**
> Emergency authority requiring a committee is not emergency authority.
> Equally, stop-work used routinely means the earlier stages are not working,
> and it **SHOULD** be tracked as a process defect rather than an enforcement
> success.

**On expiry.** Lapsing is not punishment, it is garbage collection. Expiry
converts silent accumulation into a scheduled question. The related move that
does the most practical good is in
[chapter 07](07-production-approval.md): pilots get a time-limited production
approval with a real date, because "pilot" is otherwise the most durable
state in institutional computing.

## Sources and confidence

> **DESIGN JUDGMENT**
> Every interval in this chapter is invented. The separation of build
> authorization from production approval, the conditions-tied-to-verification
> structure, and the aggregate exception tracking are reasoned from
> construction permitting practice.

> **UNVERIFIED**
> The construction permit properties this borrows, including lapse for
> inactivity and conditional approval, are described from standard practice.
> Primary code sources could not be retrieved. See [SOURCES.md](../SOURCES.md).
