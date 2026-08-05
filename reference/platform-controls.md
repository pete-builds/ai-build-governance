---
title: "Appendix B: What the Platform Enforces, and What a Human Has To"
parent: "Technical and Evidence References"
nav_order: 1
---

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

## The three profiles

Product-specific findings live in their own files so they can be
re-verified on their own schedule without touching the code, and so a
reader running a different stack is not misled.

| Profile | Category | Headline finding |
|---|---|---|
| [LiteLLM](platform-profiles/litellm.md) | AI gateway | Enforces the countable things well. Four specific gaps, including logging the caller can suppress. |
| [n8n](platform-profiles/n8n.md) | Agent Studio | **No publish gate exists.** Edit access is production change authority. |
| [MCP](platform-profiles/mcp.md) | Protocol | Nobody is inspecting servers for you, and the spec moved to stateless at revision `2026-07-28`. |

**Findings in a profile are about that product at that date.** They do not
generalize to the category, however tempting that is. The requirement in
The model states a platform-neutral verb; the profile supplies the
vendor fact.

> **EXAMPLE**
> The model says logging MUST NOT be suppressible by the caller. The LiteLLM
> profile says to check `global_disable_no_log_param`. If you run something
> else, the requirement still binds and you write your own profile row.

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
