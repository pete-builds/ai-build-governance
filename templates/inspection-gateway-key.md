---
id: INSP-KEY-YYYY-NNN
capability:
registry_id:
tier:
gateway:              # e.g. self-hosted LiteLLM
key_identifier:       # never the key value
inspector:
date:
result: pass | fail | pass with findings
---

# Inspection: AI Gateway Key

> Mostly automatable, and it should be automated. This checklist exists
> so the automation has a specification, and so the handful of genuinely
> human questions are asked.
>
> **Never record a key value in this document.** Record the identifier.

---

## Section 1: Issuance (H1)

- [ ] Key is attributable to a **named human or a service account**, not
      a shared team secret
- [ ] If a service account: the owning standing role is named
- [ ] Purpose recorded, and it matches a registry entry
- [ ] Requester was entitled to request it

## Section 2: Expiry and rotation (H1)

- [ ] Expiry set, within institutional maximum
- [ ] For a fixed-term appointment: **expiry no later than the
      appointment end date.** This is the single most effective control
      available for a transient workforce and it is usually free.
- [ ] Rotation mechanism identified. **Note the license tier**: rotation
      with a grace period is enterprise-gated on the reference platform,
      while scheduled auto-rotation requires an environment flag and a
      database. Confirm what you actually have rather than what the
      marketing page lists.
- [ ] A rotation actually happened at least once, or is scheduled with a
      named owner

## Section 3: Budget (H1)

- [ ] `max_budget` set as a **hard stop**, not a soft alert
- [ ] Reset period set deliberately
- [ ] Amount is proportionate to the declared purpose
- [ ] Cost centre or account recorded
- [ ] Behavior on budget exhaustion is understood and acceptable. A hard
      stop mid-task fails the task; confirm that is the desired outcome
      rather than a surprise.

### Shared budget pools

> Read carefully. Where a gateway implements shared pools as tags, the
> tag string can be the **entire access control** on the pool, and
> documentation for the reference platform indicates budget enforcement
> is identical whether the tag arrives from the key or from a per-request
> header. Nothing documented validates a tag or scopes it to a team at
> key-creation time.

- [ ] If this key draws on a shared pool: the pool identifier was
      **generated with real entropy**, not chosen to be readable
- [ ] Pool identifier is treated as a secret and is not in a ticket
      subject, chat channel name, or repository
- [ ] **Pool-to-owner mapping is recorded in the registry.** The platform
      does not store which team owns a pool. This is a pure as-built: if
      the record is lost, the information is gone.
- [ ] Someone is accountable for reviewing pool membership

## Section 4: Scope (H1)

- [ ] Model allowlist set explicitly, not inherited as default-all
- [ ] Allowlist is the minimum for the declared purpose
- [ ] Rate limits set: tokens per minute, requests per minute, parallel
      requests
- [ ] **Privileged exemptions checked.** The reference platform documents
      that rate limits **do not apply to proxy admin users**. Confirm this
      key does not hold an administrative role that exempts it from the
      limits just set.
- [ ] If the key has administrative scope: justified, recorded as its own
      privileged issuance event, and separately reviewed

## Section 5: Guardrails (H5)

- [ ] Required guardrails identified for the data classes in scope
- [ ] Guardrails **bound to the key by default** where the platform
      supports it, rather than depending on each caller to opt in. Note
      that per-key guardrail control is commonly enterprise-gated.
- [ ] **Coverage verified on the API paths that actually carry traffic.**
      This is the trap: guardrail coverage is uneven across a platform's
      APIs. On the reference platform, guardrails do not apply to the
      Responses API. A key with guardrails "enabled" can carry all its
      real traffic down an unguarded path.
- [ ] Tested against the actual path in the plan-review data flow diagram
- [ ] Behavior on a guardrail block is handled by the calling application
      rather than surfacing a raw error to a user
- [ ] Where the platform supports it, teams cannot disable their own
      guardrails *(enterprise-gated on the reference platform; if not
      available, record as a human-enforced control)*

## Section 6: Logging (H4)

- [ ] Request logging enabled
- [ ] **Caller cannot suppress it.** Specifically, the reference platform
      honors a per-request `"no-log": true` **unless** an administrator
      has set `global_disable_no_log_param`. Verify the administrative
      setting, not the intention.
- [ ] Decision recorded on whether prompt and response **content** is
      logged, or only metadata. Both are defensible; an unexamined
      default is not.
- [ ] If content is logged: the log store is classified and protected to
      the same standard as the data in the prompts
- [ ] Retention known. **Retention is a property of the downstream sink,
      not the gateway.** If your policy promises a retention period, name
      where it is enforced.
- [ ] Logs reach a destination someone actually reviews

## Section 7: Platform posture (H5)

- [ ] Gateway version recorded
- [ ] Checked against the project's published security advisories.
      Published advisories for the reference platform have included
      critical authentication bypass via Host header injection, SQL
      injection in proxy API key verification, and two MCP-specific
      issues (auth bypass via OAuth2 passthrough fallback, and
      authenticated command execution via MCP stdio test endpoints).
- [ ] A named person is subscribed to those advisories
- [ ] If MCP proxying is used through this gateway: inspected separately
      per the MCP checklist. Gateway MCP proxying is a young surface and
      should not be inherited as trusted infrastructure.

## Section 8: Decommissioning readiness

- [ ] Revocation procedure known and tested
- [ ] Dependent systems identified, so revocation does not surprise
      anyone
- [ ] Pool and group memberships listed, because these are routinely
      missed at offboarding and are not visible from the key itself

---

## Findings

| # | Section | Finding | Blocking? | What would resolve it |
|---|---|---|---|---|
| | | | | |

## Result

- [ ] **Pass**
- [ ] **Pass with findings**
- [ ] **Fail**

| | Name | Date |
|---|---|---|
| Inspector | | |

> **Re-inspect on:** scope or allowlist change, budget change, pool
> membership change, gateway version upgrade, appointment end date change,
> and at the tier's periodic record review.
>
> **Automate sections 1 through 4 and 6.** They are entirely countable,
> and a human reading a settings page adds nothing a script cannot do
> more reliably. Reserve human attention for section 5's coverage question
> and for whether the scope is genuinely minimal.
