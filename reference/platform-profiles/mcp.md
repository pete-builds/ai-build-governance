---
title: "Platform profile: MCP"
parent: "Technical and Evidence References"
nav_order: 11
---

> **VERIFICATION NOTE**
> Verified against vendor documentation on **2026-08-04**. Re-verify before
> relying on any row: these products change fast and several controls have
> moved between license tiers historically. Retrieval and review-by dates
> are in [the source ledger](../../SOURCES.md).
>
> **This is a finding about one product at one date. It does not
> generalize to the product category.** Ask the same questions of whatever
> you actually run, and record your own answers.
>
> Read [Appendix B: What the Platform Enforces, and What a Human Has To](../platform-controls.md) first for what the
> Enforcement and Tier columns mean.

---

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

