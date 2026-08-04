# Appendix B: What the Platform Enforces, and What a Human Has To

A governance model that assumes a control exists when the platform does
not actually implement it is worse than no model at all, because it
produces documented false assurance. This appendix is the honest
inventory for the three platforms this model was written against.

Read every row as answering one question: **if a person decides not to
comply, what stops them?** If the answer is "nothing, but we would
notice later," that is a detective control. If the answer is "nothing,
and we would not notice," that is not a control at all. It is a wish.

Verified against vendor documentation on 2026-08-04. Anything the
documentation did not state is marked `UNVERIFIED` rather than assumed.
Re-verify before relying on any row: these products change fast, and
several controls below moved between license tiers historically.

---

## How to read the tables

| Column | Meaning |
|---|---|
| **Enforcement** | `Platform` = the software refuses the action. `Detective` = the action succeeds but leaves evidence. `Human` = nothing in the software prevents or records it; process is the only control. |
| **Tier** | License tier required. `OSS` = open source / community. `Ent` = enterprise or paid tier. This determines whether an institution can actually rely on the control. |

A control marked `Human` is not a criticism of the vendor. It is a
statement about where this model has to put an inspection.

---

## 1. LiteLLM (self-hosted proxy)

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

## 2. Agent Studio platforms (worked example: n8n)

**Read the class, then the instance.** "Agent Studio" is the category: a
low-code environment where non-specialists compose automations and
agents, holding credentials to institutional systems, with a visual
builder and a publish action. The governance properties below follow
from the *shape* of such tools more than from one vendor's choices,
which is why the category is worth naming.

But **every verified fact in this section is about n8n.** Do not
generalize them. Use them as the questions to put to whatever Agent
Studio you actually run, and record the answers.

### The finding that shapes everything

**There is no publish gate.** The documentation describes clicking
Publish to make changes live in production, with no reviewer, no
sign-off, and no approval step anywhere in the flow. Concurrency, one
editor at a time, is the only access gate mentioned. Changes limited to
settings can republish without a click at all.

**Edit access is production change authority.** Any governance model
that says "workflow changes are reviewed before production" is, on this
platform, describing a human process with no technical backstop
whatsoever. That is legitimate, but it must be stated as such, and it
must be inspected, because nothing will fail if someone skips it.

### The second finding, which compounds the first

Sharing a workflow grants editors implicit use of the credentials that
workflow uses, **including credentials that were never explicitly
shared with them**. So edit access on one workflow conveys both
production change authority and the practical use of whatever that
workflow can reach.

`UNVERIFIED`: whether an editor can extract a credential's plaintext
value, as opposed to merely using it. The documentation confirms
usability and is silent on extractability. Design as though they can:
in a platform where expressions and arbitrary-code nodes exist, use and
exfiltration are usually the same capability.

### Control inventory

| Control | Enforcement | Tier | Notes |
|---|---|---|---|
| Production publish approval | **Human** | n/a | Does not exist in the product. |
| Workflow roles | Platform | see notes | Only two workflow-level roles: **Creator** (full rights including share, delete, export) and **Editor** (view, update, run, export, but cannot share or delete). |
| Workflow sharing | Platform | Cloud (all plans) / **Ent** self-hosted | Not available on community self-hosted. |
| External secrets managers | Platform | **Ent** | 1Password (self-hosted Connect only), AWS Secrets Manager, Azure Key Vault, GCP Secret Manager, HashiCorp Vault (not HCP-hosted), Infisical from v2.26.0. Enterprise self-hosted and enterprise cloud only. |
| SSO | Platform | **Business / Ent** | SAML and OIDC. The documentation lists no LDAP option, though it does not affirmatively rule LDAP out. |
| Execution data retention | Platform | OSS | `EXECUTIONS_DATA_MAX_AGE` defaults to 336 hours (14 days); `EXECUTIONS_DATA_PRUNE_MAX_COUNT` defaults to 10,000. Not license-gated. |
| `n8n audit` command | Detective | OSS | A point-in-time **configuration risk scanner** covering credentials, database expressions, filesystem nodes, risky community and custom nodes, and unprotected webhooks. |

The last row is the one people misread. `n8n audit` is a configuration
scanner, **not** a chronological record of who did what. It is a
useful inspection tool and belongs in the inspection checklist, but it
does not answer "who changed this workflow last Tuesday."

`UNVERIFIED`: whether n8n has a true cross-workflow activity or audit
log and at what tier; the exact object scope of Git source-control sync
and its tier; execution-data redaction mechanics for sensitive fields;
log-streaming tier; the full instance-level role list beyond Owner and
Admin.

Because execution data is retained by default for two weeks and the
redaction mechanics are unconfirmed, assume **any data a workflow
touches is present in execution logs** until proven otherwise. That
assumption drives the data-classification question at intake rather
than at deployment.

---

## 3. MCP (Model Context Protocol)

MCP is a specification, not a product, so the enforcement question
changes shape: the spec states requirements, and whether anything
enforces them depends entirely on the implementation.

Verified against spec revision **`2026-07-28`**, the current revision.

### What the spec requires

| Requirement | Spec position |
|---|---|
| Token audience binding | Servers **MUST NOT** accept tokens not explicitly issued for that server. Token passthrough is named as an anti-pattern. |
| Protected resource metadata | Servers **MUST** implement RFC 9728; clients **MUST** use it for authorization server discovery. |
| Resource indicators | Clients **MUST** implement RFC 8707 `resource` parameters in authorization and token requests; servers **MUST** validate audience. |
| Per-client consent on proxies | MCP proxy servers **MUST** implement per-client consent, to prevent the confused deputy problem. |
| Authorization framework | OAuth 2.1, which carries PKCE. Dynamic client registration (RFC 7591) is now **deprecated** in favor of Client ID Metadata Documents. |

### What changed recently, and why stale checklists are dangerous

- **Streamable HTTP** replaced HTTP+SSE in revision `2025-03-26`. As of
  `2026-07-28`, HTTP+SSE is formally Deprecated under a feature
  lifecycle policy. `stdio` remains current.
- **As of `2026-07-28`, MCP is stateless.** The `initialize` handshake
  and the `Mcp-Session-Id` header were removed. The spec's threat
  section previously called "Session Hijacking" is now **"State Handle
  Hijacking"** for exactly that reason.

Any MCP review checklist written against 2025 revisions will ask for
things the protocol no longer has. Pin your checklist to a spec
revision and record which one, the way a permit records which code
edition it was reviewed under.

### The spec's own named threats

Use these as checklist headings rather than inventing categories:
Confused Deputy Problem, Token Passthrough, Server-Side Request Forgery,
State Handle Hijacking, Local MCP Server Compromise, OAuth Authorization
URL Validation, stdio Transport Security in Proxy Scenarios, Mix-Up
Attacks, Localhost Redirect URI Impersonation, CIMD Trust Policies,
Scope Minimization.

### What no platform enforces for you

**Nobody is inspecting MCP servers on your behalf.** Anthropic's own
security documentation states plainly that it "does not security-audit
or manage any MCP server," and that reviewing connectors against
listing criteria for its directory is not a security audit.

The official MCP registry validates **publisher namespace ownership
only**, through GitHub OAuth or a domain-ownership challenge. There is
no malware scanning, code audit, or security review. Presence in the
registry establishes who published something, not whether it is safe.

That absence is the entire reason an inspection regime exists. The
governance vocabulary is apt here: the registry is a business license,
not a certificate of occupancy.

### Attack classes an inspection must actually look for

| Class | Why a one-time review misses it |
|---|---|
| **Tool poisoning** | Instructions embedded in a tool *description*, visible to the model but not in a truncated client UI. Reviewers must read full untruncated descriptions. |
| **Line jumping** | `tools/list` descriptions enter model context at connection time, so a server can influence behavior **without ever being invoked**. "We will review it when something calls it" does not work. |
| **Rug pull** | The server revises a tool description *after* approval was granted. This is why tool definitions must be pinned by hash and drift must alarm. |
| **Cross-server shadowing** | One server's description alters behavior toward a *different*, trusted server. Servers cannot be reviewed in isolation from the set they are deployed alongside. |
| **Injection via tool output** | Returned data, not just descriptions, carries instructions. Output is untrusted input. |
| **Insecure local credential storage** | Client configuration files holding long-lived third-party API keys in plaintext, observed world-readable. |

Real vulnerabilities have been published in widely used components,
which is the empirical answer to "is this theoretical":

| CVE | Component | Severity | Fixed in |
|---|---|---|---|
| CVE-2025-49596 | MCP Inspector | 9.4 Critical | 0.14.1 |
| CVE-2025-6514 | `mcp-remote` | 9.6 Critical | 0.1.16 |
| CVE-2025-53110 | official filesystem server | 7.3 High | 2025.7.1 |
| CVE-2025-53967 | `figma-developer-mcp` | 7.5 High | 0.6.3 |

Note that one of these is an official reference server and one is the
protocol's own debugging tool. First-party origin is not a safety
property.

### A useful forcing rule

The clearest available test for when a tool needs the most scrutiny is
the **lethal trifecta**: access to private data, exposure to untrusted
content, and the ability to communicate externally. A tool combining
all three can be induced to exfiltrate, and no amount of prompt
engineering reliably prevents it. Chapter 03 uses this to force
classification rather than leaving it to reviewer judgment.

---

## The general lesson

Across all three platforms the pattern is the same, and it is worth
stating plainly because it is the reason this model is shaped the way
it is:

**The platforms are good at arithmetic and bad at intent.** Budgets,
rate limits, expiry, allowlists, and retention windows are enforced
reliably, because they are countable. Whether a workflow should be in
production, whether a tool description is honest, whether a pool
belongs to the team drawing on it, and whether this system should exist
at all are not enforced anywhere by anything.

So put the automated gates on the countable things and stop
congratulating yourself for governing them. Spend the human review
budget on intent, which is the only place it does any good.
