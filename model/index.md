---
title: "Core Governance Model"
nav_order: 5
has_children: true
---

# Core Governance Model

**This layer binds you, once your institution adopts and amends it.** Thirteen
numbered chapters of requirements, plus a conventions page that tells you which
sentences bind and which explain.

**Read [How to read this](00-conventions.md) first.** It defines the normative
keywords, the statement labels, and the plain-language-to-construction
terminology mapping.

Requirements are numbered by chapter, so `11.2` is the second requirement of
chapter 11 and can be cited directly in an amendment or an exception record.
Numbers are stable across editions: a requirement is never renumbered, so a new
one is appended even where that puts it out of positional order.

Every chapter follows the same eight sections: Purpose, Failure this prevents,
Requirement, Applicability, Required evidence, Exceptions, Implementation
guidance, Sources and confidence.

**If you read only Purpose and Requirement across all thirteen, you have read
the model.**

---

## The chapters are not all the same kind of thing

Thirteen chapters in one numbered list reads as thirteen sequential stages, and
it is not. Seven are a sequence. The rest are standing arrangements that apply
throughout, and reading those as stages is most of why the model looks heavier
than it is.

### The sequence: one capability, start to finish

| # | Chapter | The failure it prevents |
|:--|:--|:--|
| 02 | [Statement of Need](02-statement-of-need.md) | Building the wrong thing, solution-first |
| 03 | [Risk Classification](03-classification.md) | Risk decided by reviewer mood |
| 04 | [Design Review](04-design-review.md) | A design nobody read against the requirement |
| 05 | [Authorization to Build](05-authorization-to-build.md) | Approval becoming a permanent entitlement |
| 06 | [Inspections](06-inspections.md) | Verification after the evidence is gone |
| 07 | [Production Approval and Records](07-production-approval.md) | Nobody knowing what is running |
| 08 | [Alterations and Existing Systems](08-alterations.md) | Change that silently outruns its review |

### Standing arrangements: true throughout, not stages

| # | Chapter | Applies |
|:--|:--|:--|
| 01 | [Principles](01-principles.md) | Always. Where a chapter conflicts with a principle, the principle wins. |
| 09 | [Roles and Authority](09-roles.md) | From before the Statement of Need until decommissioning |
| 10 | [Concurrent Reviews](10-concurrent-reviews.md) | Alongside design review, never as a queue behind it |
| 11 | [Certified Reusable Components](11-certified-components.md) | Both the **entry point** for anything reusing existing work and an output of finishing |
| 12 | [Delegated Authority](12-delegated-authority.md) | Whenever an agent acts on a human's behalf |
| 13 | [Third-Party Capabilities](13-third-party.md) | Whenever a build depends on something the institution does not operate |

---

## The shortest route through all of it

**Chapter 11 first.** A capability consuming an already certified component
inherits its inspection and reviews only the integration. That is the fastest
path the model offers, and the only one that gets faster as the institution
governs more.

If nothing suitable is certified, work the sequence. See the
[quick reference](../quick-ref.md) for the whole thing condensed onto one page,
including the tier triggers and the five verification points, and the
[executive summary](../overview.md) for why any of it is shaped this way.
