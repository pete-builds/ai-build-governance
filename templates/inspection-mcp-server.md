---
title: "Template: MCP Server Inspection"
parent: "Templates"
nav_order: 5
---

> Copy this file. The metadata block below is part of the template:
> fill it in at the top of your copy.

```yaml
id: INSP-MCP-YYYY-NNN
capability:
registry_id:
tier:
spec_revision_reviewed_against: "2026-07-28"
inspector:
date:
result: pass | fail | pass with findings
```

# Inspection: MCP Server

> **Pin the spec revision.** Record which one you reviewed against,
> exactly as an authorization records the code edition. MCP is versioned by
> date-based revision strings and it moves fast: as of `2026-07-28` the
> protocol became **stateless** (the `initialize` handshake and
> `Mcp-Session-Id` were removed), and the spec's threat section formerly
> called "Session Hijacking" is now **"State Handle Hijacking"**. A
> checklist written against 2025 revisions asks for things the protocol
> no longer has.
>
> **Nobody is inspecting this for you.** Anthropic's security
> documentation states it "does not security-audit or manage any MCP
> server." The official registry validates **publisher namespace
> ownership only**, with no malware scanning or security review.
> Registry presence is a business license, not a certificate of
> occupancy.

---

## Section 1: Transport (H2)

- [ ] **Streamable HTTP** for networked servers. HTTP+SSE was replaced in
      revision `2025-03-26` and is formally Deprecated as of `2026-07-28`.
- [ ] If HTTP+SSE: justified as back-compat only, with a removal date
      recorded. Not acceptable for new builds.
- [ ] `stdio` used only for local servers (still current; clients SHOULD
      support it)
- [ ] Local HTTP servers **validate the `Origin` header**
- [ ] Local HTTP servers **bind to localhost only**, not `0.0.0.0`
- [ ] TLS on all networked transport

## Section 2: Authorization (H2)

> Spec MUSTs. These are not preferences.

- [ ] Server implements **RFC 9728** protected resource metadata *(spec
      MUST)*
- [ ] Client uses protected resource metadata for authorization server
      discovery *(spec MUST)*
- [ ] Client sends the **RFC 8707** `resource` parameter in both
      authorization and token requests *(spec MUST)*
- [ ] Server **validates token audience** *(spec MUST)*
- [ ] **No token passthrough.** The server does not accept tokens that
      were not explicitly issued for it *(spec MUST NOT)*
- [ ] OAuth 2.1, with PKCE
- [ ] Roles unambiguous: the server is a resource server, and is not also
      acting as its own authorization server by accident
- [ ] Proxy servers implement **per-client consent** (confused deputy)
      *(spec MUST)*
- [ ] RFC 7591 dynamic client registration, if used, flagged as
      **deprecated** in favor of Client ID Metadata Documents
- [ ] Scopes minimized. No wildcards. Note each scope's justification.

## Section 3: Tool definitions (H2, and continuously)

> This is where the attacks live.

- [ ] **Full untruncated tool descriptions read by a human.** Tool
      poisoning hides instructions in descriptions that client UIs
      truncate. Reading the rendered UI summary is not an inspection.
- [ ] No instruction-like content in descriptions: no directives aimed at
      the model, no `<IMPORTANT>`-style tags, no references to reading
      files or paths
- [ ] No ANSI escape sequences or control characters in descriptions or
      output
- [ ] **Tool definitions pinned by hash or version**
- [ ] **Drift alarm live.** A server revising a description after approval
      is the rug pull, and it is the reason pinning is a authorization condition
      rather than a suggestion.
- [ ] Parameter lists reviewed for unused or free-text parameters that
      could carry smuggled data out
- [ ] Reviewed **alongside the other servers it will be deployed with**.
      One server's descriptions can influence behavior toward another, so
      a server cannot be cleared in isolation.

> **Descriptions load before invocation.** `tools/list` content enters
> the model's context at connection time, so a server can influence
> behavior **without ever being called**. "We will review it when
> something uses it" is not a strategy.

## Section 4: Tool output (H2)

- [ ] Tool output treated as **untrusted input**, not as data the model
      may act on unconditionally
- [ ] Output cannot alter behavior toward other connected servers
- [ ] Output sanitized for control characters before rendering
- [ ] Output size bounded

## Section 5: Upstream credentials (H1)

- [ ] The server's own credentials to upstream services are scoped to the
      minimum, with each scope justified
- [ ] No credentials in source or committed config
- [ ] Client configuration files holding third-party keys are **not
      world-readable**. Check actual file permissions; plaintext
      world-readable client config has been observed in the wild.
- [ ] Credentials expire, and expiry is within institutional maximum
- [ ] Static server-side credentials distinguished from per-user
      passthrough, and the choice is deliberate and recorded

## Section 6: Network egress (H2)

- [ ] Private and link-local address ranges **blocked** for any
      server-supplied URL the client will fetch (SSRF; the spec has a
      dedicated section on this)
- [ ] Egress destinations match the declared inventory from design review
- [ ] Undeclared outbound paths: none found

## Section 7: Known vulnerabilities (H2)

> Check versions against published advisories. First-party origin is not
> a safety property: one of the entries below is the protocol's own
> debugging tool and one is an official reference server.

| Component | Advisory | Fixed in | Version in use | OK |
|---|---|---|---|---|
| MCP Inspector | CVE-2025-49596 (9.4 critical) | 0.14.1 | | [ ] |
| `mcp-remote` | CVE-2025-6514 (9.6 critical) | 0.1.16 | | [ ] |
| official filesystem server | CVE-2025-53110 (7.3 high, path traversal) | 2025.7.1 | | [ ] |
| `figma-developer-mcp` | CVE-2025-53967 (7.5 high) | 0.6.3 | | [ ] |

- [ ] Dependency versions pinned
- [ ] A named person is subscribed to advisories for every component here
- [ ] If the server is proxied through an AI gateway: the **gateway's own**
      MCP-related advisories checked. Gateway MCP proxying is a young
      surface, and published gateway advisories have included MCP auth
      bypass and command execution via MCP test endpoints.

## Section 8: Observability (H4)

- [ ] Every tool invocation logged with identity, arguments, and result
- [ ] Logging **not suppressible by the caller**
- [ ] A human can review what the server did without developer access
- [ ] Invocation rate bounded

## Section 9: Spec threat sections

> Confirm each was considered. These are the spec's own section names, so
> use them rather than inventing categories.

- [ ] Confused Deputy Problem
- [ ] Token Passthrough
- [ ] Server-Side Request Forgery
- [ ] State Handle Hijacking
- [ ] Local MCP Server Compromise
- [ ] OAuth Authorization URL Validation
- [ ] stdio Transport Security in Proxy Scenarios
- [ ] Mix-Up Attacks
- [ ] Localhost Redirect URI Impersonation
- [ ] CIMD Trust Policies
- [ ] Scope Minimization

---

## Findings

| # | Section | Finding | Blocking? | What would resolve it |
|---|---|---|---|---|
| | | | | |

## Result

- [ ] **Pass**
- [ ] **Pass with findings.** Non-blocking items tracked on the punch
      list
- [ ] **Fail.** Blocking items above. Work must not proceed past this
      verification point.

| | Name | Date |
|---|---|---|
| Inspector | | |
| Builder notified | | |

> **Re-inspect on:** any tool definition change, any new upstream
> credential, any transport change, any spec revision adoption, and at
> the tier's periodic record review.
