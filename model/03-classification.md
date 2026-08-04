---
title: "03. Risk Classification"
parent: "Core Governance Model"
nav_order: 3
---

## Purpose

Assigns every capability a tier, from objective triggers, before any design
review happens. The tier determines how much review applies and which
verification points are required.

## Failure this prevents

Risk assessed by reviewer mood. Without objective triggers, tiering drifts,
gets argued over, and is negotiated toward whatever the builder wanted.

> **REQUIREMENT 3.0 Design goal**
> Two reviewers given the same Statement of Need **MUST** reach the same
> tier. Any trigger that fails this test is defective and **SHOULD** be
> amended.

## Requirement

> **REQUIREMENT 3.1**
> Triggers **MUST** be worked in order, and the **highest triggered tier
> wins**. A capability **MUST NOT** be assigned a lower tier because most of
> its answers were low.

| Tier | Review | Verification | Production approval |
|---|---|---|---|
| **1** | Self-certified | Automated only | Self-issued |
| **2** | Peer design review, timeboxed | Automated plus one human point | Issued by a peer |
| **3** | Independent review by someone off the project | Full set, human sign-off | Issued by the Final Decision Authority |

### Trigger A: Data classification

> **LOCAL AMENDMENT REQUIRED**
> Substitute your institution's own scheme verbatim.

| Data the capability can reach | Minimum tier |
|---|---|
| Public or already published | 1 |
| Internal business data | 2 |
| Regulated or specially protected | 3 |
| Classes your policy forbids on the platform | **Not permitted.** Not a tier. |

> **REQUIREMENT 3.2**
> The framework **MUST** carry a genuinely prohibited category. Some things
> are not high-tier, they are forbidden, and "more review" is not the
> correct response to them.

> **REQUIREMENT 3.3**
> Where institutional guidance says to treat data as the middle class when in
> doubt, a Statement of Need that leaves the data field blank **MUST**
> classify at that middle tier. Silence is not an exemption.

### Trigger B: The lethal trifecta

| Combination | Minimum tier |
|---|---|
| Any one of private data access, untrusted content exposure, external communication | 1 |
| Any two | 2 |
| **All three** | **3** |

> **GUIDANCE**
> A system holding all three can be induced to exfiltrate, and no prompt
> engineering reliably prevents it. The trigger is useful because it is
> objective *and* actionable: a Tier 3 finding usually has an obvious
> remedy, which is to remove a leg.
>
> The third leg appears by accident constantly. Anything that can send mail,
> post to a webhook, write to a shared document, open a pull request, make an
> arbitrary outbound request, or render output where an attacker can read it
> has external communication.

### Trigger C: Autonomy

| Behavior | Minimum tier |
|---|---|
| Produces output a human reads and acts on | 1 |
| Takes actions a human approves individually | 2 |
| Takes consequential actions without per-action approval | 3 |
| Modifies its own instructions, tools, or permissions at runtime | **3, plus explicit Decision Authority sign-off** |

"Consequential" means hard to reverse, visible outside the team, or costs
money.

> **GUIDANCE**
> The last row is not hypothetical. An agent that can reconfigure its own
> tools has no stable review surface, so nothing you approved stays
> approved.

### Trigger D: Blast radius

| Who is affected by a bad output | Minimum tier |
|---|---|
| The builder, or the builder's team | 1 |
| A unit or department | 2 |
| The whole institution | 3 |
| People outside the institution, or anyone positioned to be harmed rather than inconvenienced | 3 |

### Trigger E: Consequential decisions about people

> **REQUIREMENT 3.4**
> Any system informing decisions about admission, grading, financial aid,
> hiring, promotion, discipline, accommodation, or access to services
> **MUST** be Tier 3, regardless of how advisory it claims to be.

> **GUIDANCE**
> "It is only advisory, a human makes the final call" is the most common way
> this trigger is evaded, and it does not work. A recommendation followed 95%
> of the time is a decision. **If the human override rate is not measured,
> assume the system is deciding.**

### Trigger F: Unbounded cost

> **REQUIREMENT 3.5**
> Anything able to spend without a hard cap **MUST** be Tier 2 minimum, and
> the cap **MUST** be an authorization condition rather than a
> recommendation.

## Applicability

Every capability in scope, including pre-existing systems being inventoried
under [chapter 08](08-alterations.md), which are classified to reveal
exposure even though their tier's gates are not applied retroactively.

## Required evidence

Recorded tier, the list of triggers fired, the date classified, and for any
Tier 3 lethal-trifecta finding, the attempt made to remove a leg and why it
failed.

## Exceptions

> **REQUIREMENT 3.6 Reclassification**
> Classification **MUST** be re-run when declared data classes change; a
> tool, integration, or egress path is added; autonomy increases, including
> the removal of a confirmation step; the audience widens; or the system is
> used for a purpose the Statement of Need did not describe.

> **REQUIREMENT 3.7**
> Tier **MAY** decrease. Where external egress is removed or data access
> narrowed, the capability **SHOULD** be reclassified downward and the change
> recorded.

> **GUIDANCE**
> 3.7 matters more than it looks. A model that only ratchets upward gives
> builders a reason to hide changes. Downward reclassification is the reward
> for actually reducing risk.
>
> Of the 3.6 triggers, audience widening is the most common and purpose
> change is the most dangerous, because no platform will tell you either
> happened. Only the periodic record review in
> [chapter 07](07-production-approval.md) will.

## Implementation guidance

**Worked examples.**

| Capability | Triggers | Tier |
|---|---|---|
| Read-only server over public course catalog, one unit | A:1, B:1 leg, D:unit | **2** |
| Workflow summarizing internal notes to a private channel | A:2, B:2 legs | **2** |
| Agent reading external email and filing tickets with internal data | A:2, **B:all three**, C:2 | **3** |
| Retrieval over student records, staff-facing, read-only | **A:3**, E if it informs decisions | **3** |
| Local script over the builder's own notes, no egress | A:1, B:1, D:builder | **1** |
| Tool opening pull requests from public issue text | **B:all three**, C:3 | **3** |

Rows three and six are instructive. Both look modest, both are Tier 3,
because untrusted input plus private data plus egress is the shape of an
exfiltration path.

**On student records specifically.** Many institutional schemes place
education records in the middle class because they are not
identity-theft-enabling. That is defensible as a data-security
classification and can be the wrong answer for AI systems, where the concern
is exposure and inference.

> **LOCAL AMENDMENT REQUIRED**
> Decide where education records land and **write the decision down**. In the
> United States the relevant provision is the FERPA school official
> exception at [34 CFR 99.31(a)(1)](https://www.law.cornell.edu/cfr/text/34/99.31).
> This framework does not interpret it. Whether a design satisfies it is a
> question for counsel. What the framework does is force the question before
> the build rather than after.

**What this chapter deliberately does not do.** It does not score projects
numerically. Weighted risk matrices invite negotiation over weights, and the
negotiation trends toward the tier the builder wanted. Binary triggers with
highest-wins are cruder and harder to argue with.

**Certification does not lower a tier.** A certified reusable component
reduces *component* review only. See
[chapter 11](11-certified-components.md).

## Sources and confidence

> **VERIFICATION NOTE** (2026-08-04)
> The lethal trifecta's three components are quoted verbatim from Simon
> Willison. The FERPA provision was fetched from primary regulatory text.
> EU AI Act tiering, which trigger E is aligned with, was verified against
> the Commission's own page, including that a Digital Omnibus in force
> 2026-07-27 moved high-risk obligations to 2027-12-02.

> **DESIGN JUDGMENT**
> The three-tier count and every specific threshold are reasoned rather than
> measured. No evidence exists on the optimal number of tiers. Three,
> because more invites boundary arguments.
