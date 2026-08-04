# Platform profile: LiteLLM (self-hosted AI gateway)

> **VERIFICATION NOTE**
> Verified against vendor documentation on **2026-08-04**. Re-verify before
> relying on any row: these products change fast and several controls have
> moved between license tiers historically. Retrieval and review-by dates
> are in [SOURCES.md](../../SOURCES.md).
>
> **This is a finding about one product at one date. It does not
> generalize to the product category.** Ask the same questions of whatever
> you actually run, and record your own answers.
>
> Read [platform-controls.md](../platform-controls.md) first for what the
> Enforcement and Tier columns mean.

---

### What it genuinely enforces

| Control | Enforcement | Tier | Notes |
|---|---|---|---|
| Virtual key issuance and expiry | Platform | OSS | `/key/generate` with `duration`. Administrators can cap what requesters may ask for via `upperbound_key_generate_params`, which is the control that makes a 90-day maximum real rather than advisory. |
| Per-key model allowlist | Platform | OSS | The `models` list is evaluated against the key row itself. `access_groups` defines reusable named model bundles in config; `no-default-models` prevents a user reaching anything outside an assigned team. |
| Key, user, and team budgets | Platform | OSS | `max_budget` with `budget_duration`. Team budgets apply top-down to member keys, and exceeding one returns a 400 `auth_error`. This is a real hard stop, not an alert. |
| Rate limits | Platform | OSS | TPM, RPM, and `max_parallel_requests` at key, user, team, and per-model-per-key level. |
| Guardrail invocation | Platform | OSS (basic) | Hook modes `pre_call`, `post_call`, `during_call`, `logging_only`. Many providers supported, plus built-ins. |
| Guardrails bound on by default | Platform | **Ent** | Per-API-key guardrail control, model-level guardrails, tag-based guardrail modes, and **preventing teams from modifying their own guardrails** are all enterprise. On OSS, a guardrail is closer to something a caller opts into. |
| Request logging | Detective | OSS (core) | Every call gets a `call_id` and emits a `StandardLoggingPayload`. Several log destinations are enterprise-gated, including GCS, GCS PubSub, Azure Blob, and the generic custom callback API. |
| Key rotation with grace period | Platform | **Ent** | `POST /key/{key}/regenerate` with `grace_period` is documented as an enterprise feature. Scheduled auto-rotation via `LITELLM_KEY_ROTATION_ENABLED` plus Postgres carried no enterprise badge. |
| SSO to the admin UI | Platform | **Ent** | JWT-based automatic team assignment via claim mapping is documented without an enterprise badge. |

### The four gaps that change how you govern

**1. Tag budgets are named, not validated.** Shared budget pools are
implemented as tags. A tag is created with only a name, and a tag can be
attached from the key's own `tags` field, from a per-request
`metadata.tags` value, or via an `x-litellm-tags` header. Nothing in the
documentation describes validating a tag against an allowlist, scoping
it to a team, or access-controlling it at key-creation time, **and the
documentation does not state whether enforcement is equivalent across
those three attachment paths. It is silent.** The silence is the finding.

The practical consequence: the tag string is the access control on the
pool. Anyone who learns the identifier can draw against that budget by
setting a request header. Pool names must therefore be treated as
secrets and generated with real entropy, not chosen for readability.
And because the platform does not record which team owns a pool, that
mapping exists only where a human wrote it down, which makes it an
as-built record (see chapter 08) rather than a system fact.

`UNVERIFIED`: whether any valid key can in fact draw against an
arbitrary existing tag. The documentation neither confirms nor rules it
out, and this was not tested against a live instance. Treat it as
probable and design defensively. If you operate a gateway, test it.

**2. Logging is opt-out for the caller.** A per-request `"no-log": true`
suppresses logging of that request unless an administrator has
explicitly set `global_disable_no_log_param: true`. Auditability is
therefore a configuration an institution must deliberately turn on. If
you have not set that flag, your audit trail has holes that its own
users control.

**3. Rate limits do not apply to proxy admin users.** Documented
behavior. Any human or service account holding proxy-admin is outside
the rate-limiting regime entirely, which is an argument for treating
proxy-admin as a privileged role with its own issuance record rather
than a convenience.

**4. Retention is not the gateway's problem.** No log retention or TTL
control appeared in the logging documentation. Retention is whatever
the downstream sink does. If your governance model promises a retention
period, that promise lives in the sink, not here.
`UNVERIFIED`: what a LiteLLM "audit log" entry actually contains. The
term appears in enterprise marketing copy but no functional
documentation page for it was located.
`UNVERIFIED`: SCIM provisioning. Listed in enterprise marketing, absent
from the documentation pages fetched.
`UNVERIFIED`: MCP gateway per-key and per-team access control, request
logging, and OAuth passthrough behavior. The MCP proxy documentation
page could not be retrieved. Given that two published advisories below
concern exactly this surface, verify it directly before relying on it.

### The gateway is itself an attack surface

Ten advisories are published on the project's GitHub security
advisories page. Named examples, by advisory identifier:

| Advisory | Severity | Issue |
|---|---|---|
| GHSA-4xpc-pv4p-pm3w | Critical | Authentication bypass via Host header injection |
| GHSA-r75f-5x8p-qvmc | Critical | SQL injection in proxy API key verification |
| GHSA-7488-6r32-c95q | High | **MCP** auth bypass via OAuth2 passthrough fallback |
| GHSA-v4p8-mg3p-g94g | High | Authenticated command execution via **MCP** stdio test endpoints |
| GHSA-xqmj-j6mv-4862 | High | Server-side template injection in `/prompts/test` |
| GHSA-69x8-hrgq-fjj8 | High | Password hash exposure enabling pass-the-hash |

Four further moderate and low findings covered path traversal in skills
archive extraction, sandbox escape in the custom-code guardrail, local
file read via OIDC file references, and a custom-code guardrail
safety-check bypass.

Two observations a governance model should carry. First, the project
runs a real advisory process, which is a positive signal, not a
negative one: silence would be worse. Second, **two of these are
MCP-specific**, which means the gateway's MCP proxying is a young
surface and should be inspected as its own thing rather than inherited
as trusted infrastructure.

`UNVERIFIED`: formal CVE identifiers and affected/fixed version ranges
for these advisories. Only GHSA identifiers were confirmed, and a
second page of advisories was not retrieved. Anyone operating a gateway
should read the advisories directly and pin versions accordingly.

---

