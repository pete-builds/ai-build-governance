---
title: "Platform profile: n8n"
parent: "Technical and Evidence References"
nav_order: 12
---

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

