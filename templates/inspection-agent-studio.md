---
id: INSP-WF-YYYY-NNN
capability:
registry_id:
tier:
platform:             # e.g. n8n
inspector:
date:
result: pass | fail | pass with findings
---

# Inspection: Agent Studio Workflow

> **Platform class.** "Agent Studio" means a low-code environment where
> people compose automations and agents visually, holding credentials to
> institutional systems, with a publish action. The category is what
> matters; the product is an implementation detail. At least one
> university runs its n8n instance under exactly this name.
>
> **Read this first.** The findings below were verified against **n8n**
> specifically and must not be assumed to hold for another Agent Studio.
> Ask the same questions of yours, above all the publish-gate question,
> which decides whether you have a technical control or only a human one.
>
> On n8n, the documentation describes clicking Publish to make changes
> live in production, with **no reviewer, sign-off, or approval step
> anywhere in the flow**. Changes limited to settings can republish
> without a click at all.
>
> **Edit access is production change authority.** There is no technical
> backstop. This inspection *is* the control. If it does not happen,
> nothing happens.
>
> Compounding it: sharing a workflow grants editors implicit use of the
> credentials that workflow uses, **including credentials never
> explicitly shared with them**. So edit access on one workflow conveys
> both production change authority and practical use of everything that
> workflow can reach.
>
> Verify these properties against your own platform version before
> relying on this checklist. See appendix B.

---

## Section 1: Who can change this (H4)

- [ ] **Named list** of everyone with edit access, attached below
- [ ] Each name justified. Remove any that are not.
- [ ] Nobody on the list is a departed or expiring appointment
- [ ] Credential exposure implied by that edit access is stated
      explicitly and **accepted in writing by the Standing Owner**
- [ ] Workflow-level roles set deliberately, not inherited

| Name | Appointment ends | Why they need edit | Credentials this implies |
|---|---|---|---|
| | | | |

## Section 2: Credentials (H1)

- [ ] Every credential the workflow uses is listed in the registry
- [ ] Each scoped to the minimum, with justification
- [ ] No credential embedded in a node parameter, expression, or code node
- [ ] External secrets manager used where available. **Note the license
      tier**: external secrets support is commonly enterprise-gated, so
      confirm it is actually available to you rather than assuming.
- [ ] Credentials expire within institutional maximum
- [ ] Service-account credentials owned by a standing role, not personal
      credentials held by the builder

## Section 3: Data and egress (H2)

- [ ] Data classes touched match the certificate of occupancy
- [ ] Every egress path listed: HTTP nodes, mail, webhooks, shared
      documents, model providers, third-party log sinks
- [ ] Undeclared outbound paths: none found
- [ ] Untrusted input identified. Anything arriving from outside the
      institution (inbound mail, form submissions, web content, external
      APIs) is untrusted.

**Lethal trifecta check:**

- [ ] Private data access
- [ ] Untrusted content exposure
- [ ] External communication

> All three is **Tier 3**. Workflows hit this combination very easily,
> because "read incoming mail, look something up, send a reply" is all
> three legs and looks completely ordinary.

## Section 4: Execution data (H2)

- [ ] Retention understood. Default pruning on the reference platform is
      **336 hours** and **10,000 executions**, and is not license-gated.
- [ ] **Assume any data the workflow touches is present in execution
      logs** until proven otherwise. Redaction mechanics were not
      verifiable from documentation.
- [ ] If regulated data flows through: retention explicitly reviewed
      against policy, and the review recorded
- [ ] Execution logs access-controlled to the same standard as the data
      itself

## Section 5: Failure and blast radius (H3)

- [ ] Behavior on upstream failure verified by **actually breaking a
      dependency**, not asserted
- [ ] Errors surface rather than being silently swallowed
- [ ] Retry behavior bounded. No unbounded retry against an external
      service.
- [ ] Actions per run bounded. A loop over an unexpectedly large input
      set cannot send 10,000 messages.
- [ ] Idempotency considered where the workflow writes to a system of
      record
- [ ] Rollback path exists for anything it writes, and has been exercised

## Section 6: Human oversight (H4)

- [ ] The oversight point from plan review exists in the running workflow
- [ ] Consequential actions are logged with enough context to reconstruct
      why they happened
- [ ] A human can see what it did, after the fact, without developer
      access
- [ ] Consequential actions are reversible or gated on confirmation
- [ ] For advisory output: **override rate is measured**. Unmeasured, an
      advisory system is a deciding system.
- [ ] Scheduled and trigger-driven runs are visible to someone. An
      unattended schedule with nobody watching is concealment.

## Section 7: Platform hygiene (H5)

- [ ] Platform security audit run (`n8n audit` or equivalent) and findings
      triaged
- [ ] **Understood that this is a point-in-time configuration scanner,
      not an activity log.** It does not tell you who changed what.
- [ ] Community or custom nodes reviewed. Each is third-party code with
      the workflow's access.
- [ ] Webhooks authenticated. No unprotected webhook that triggers
      consequential action.
- [ ] Workflow exported to version control, so a diff is possible
- [ ] **Change detection external to the platform**, since the platform
      will not tell you a workflow was republished

## Section 8: Compensating controls for the missing publish gate

> Because the platform has no approval step, these substitute for it.
> Adopt at least two above Tier 1.

- [ ] Production workflows live in a separate project or instance from
      development
- [ ] Edit access in production restricted to a smaller named group than
      development
- [ ] Export-to-Git plus scheduled diff, with alerting on change
- [ ] Periodic reconciliation of active workflows against the registry
- [ ] Announcement channel where publishes are posted, so change is at
      least broadcast

---

## Findings

| # | Section | Finding | Blocking? | What would resolve it |
|---|---|---|---|---|
| | | | | |

## Result

- [ ] **Pass**
- [ ] **Pass with findings.** Tracked on the punch list
- [ ] **Fail.** Work must not proceed past this hold point

| | Name | Date |
|---|---|---|
| Inspector | | |
| Standing Owner accepts credential exposure per Section 1 | | |

> **Re-inspect on:** any new integration or credential, any change to who
> holds edit access, removal of a confirmation step, a schedule change,
> audience widening, and at the tier's periodic record review.
