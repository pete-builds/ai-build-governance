---
title: Contents
nav_order: 4
---

# Contents

Every page in the framework, grouped by layer. Generated from the source files by
`tools/build-nav.pl`, so it cannot fall out of step with what it describes.

**New to this?** Read the [executive summary](overview.md).
**Want the whole model condensed?** Use the [quick reference](quick-ref.md).
**Looking for a specific requirement by number?** Use the
[requirement index](reference/requirement-index.md).

| Layer | Pages | Binds? |
|:--|--:|:--|
| [Core Governance Model](model/) | 14 | **Yes**, once adopted |
| [Implementation Guide](guide/) | 6 | No |
| [Technical and Evidence References](reference/) | 8 | No |
| [Templates](templates/) | 10 | The completed artifact is the evidence |

**You do not need to read all of it.** The model is the only layer that binds,
and reading only Purpose and Requirement across it is a deliberate and
supported way through. See
[how to read this](model/00-conventions.md).

---

## Core Governance Model

Thirteen normative chapters, plus the conventions page. Every chapter carries
the same eight sections: Purpose, Failure this prevents, Requirement,
Applicability, Required evidence, Exceptions, Implementation guidance, Sources
and confidence. Listed below are the requirement groupings inside each, which
is the part that differs between them.

### [00. How to Read This](model/00-conventions.md)

- No numbered requirements. Conventions and reading guidance.

### [01. Principles](model/01-principles.md)

- **Where gates belong** (1.1 to 1.3)
- **What humans do, and what the platform must** (1.4 to 1.5)
- **Getting adopted, and staying adopted** (1.6 to 1.7)
- **Shrinking, and proving it works** (1.8 to 1.9)

### [02. Statement of Need](model/02-statement-of-need.md)

- **What the need must state** (2.1 to 2.3)
- **Check whether it already exists** (2.4 to 2.5)
- **Ownership, and grounds for return** (2.6 to 2.7)

### [03. Risk Classification](model/03-classification.md)

- **Trigger A: Data classification** (3.2 to 3.3)
- **Trigger E: Consequential decisions about people** (3.4)
- **Trigger F: Unbounded cost** (3.5 to 3.7)
- Opening requirement (3.0, 3.1)

### [04. Design Review](model/04-design-review.md)

- **Who reviews, and how long they get** (4.1 to 4.3)
- **What the builder submits** (4.4 to 4.6)
- **Dispositions, and what follows** (4.7 to 4.8)
- **Asking a question cheaply** (4.9 to 4.10)

### [05. Authorization to Build](model/05-authorization-to-build.md)

- **What an authorization is** (5.1 to 5.3)
- **What each tier authorizes** (5.4 to 5.5)
- **Standard conditions** (5.6)
- **Exceptions, and lapse** (5.7 to 5.8)

### [06. Inspections](model/06-inspections.md)

- **H1: Identity and credentials** (6.3 to 6.4)
- **H2: Connections and permissions** (6.5 to 6.7)
- **H3: End-to-end path** (6.8)
- **H4: Pre-concealment verification** (6.9 to 6.12)
- **H5: Final verification** (6.13 to 6.17)
- Opening requirement (6.1, 6.2)

### [07. Production Approval and Records](model/07-production-approval.md)

- **Approval is a separate act** (7.1 to 7.4)
- **Time-limited approval** (7.5)
- **Handover, and what is withheld** (7.6 to 7.7)
- **The deployed system record** (7.8 to 7.10)
- **Review, decommissioning, and closure** (7.11 to 7.13)

### [08. Alterations and Existing Systems](model/08-alterations.md)

- **When a change re-enters** (8.1)
- **Systems that predate the framework** (8.2 to 8.6)
- **Change that arrives without anyone changing anything** (8.9 to 8.8)

### [09. Roles and Authority](model/09-roles.md)

- **The Final Decision Authority** (9.1 to 9.2)
- **The Responsible Builder** (9.3 to 9.6)
- **Independent review** (9.7)
- **Credentials, and departure** (9.8 to 9.9)

### [10. Concurrent Reviews](model/10-concurrent-reviews.md)

- **One submittal, one clock** (10.1 to 10.5)
- **Permission versus determination** (10.6 to 10.7)
- Opening requirement (10.0)

### [11. Certified Reusable Components](model/11-certified-components.md)

- **What certification does, and does not do** (11.1 to 11.3)
- **What a certification must state** (11.4)
- **Consuming a certified component** (11.5 to 11.6)
- **Who certifies, and keeping it alive** (11.7 to 11.10)
- **Certified patterns** (11.11)

### [12. Delegated Authority](model/12-delegated-authority.md)

- **An agent inherits, never exceeds** (12.1 to 12.3)
- **Approval must reach a person** (12.4 to 12.5)
- **What is never permitted** (12.6)
- **The record** (12.7)

### [13. Third-Party Capabilities](model/13-third-party.md)

- **Scope** (13.1)
- **Inspect the boundary, not the component** (13.2 to 13.3)
- **Who can change your production behavior** (13.4 to 13.5)
- **Egress and classification** (13.6 to 13.7)
- **Keeping it checked** (13.8 to 13.10)

---

## Implementation Guide

Non-binding. The numbering is not a reading order; see the
[audience table](guide/).

### [01. Adoption](guide/01-adoption.md)

- Before anything: can you actually staff it?
- Then: what kind of governance do you already have?
- Sequence
- A sample operating model
- What to expect to go wrong
- Recording your adoption

### [02. Running Example: The Payment Inquiry Agent](guide/02-running-example.md)

- Stage 1: Statement of Need
- Stage 2: Classification
- Stage 3: Design Review
- Stage 4: Concurrent reviews
- Stage 5: Authorization
- Stage 6: Inspections
- Stage 7: Occupancy
- Stage 8: Reuse, in both directions
- Stage 9: Alteration
- Stage 10: Delegated authority
- What the whole path cost

### [03. Agentic Products](guide/03-agentic-products.md)

- Separate the two risks, because people conflate them
- Path A: code authored by AI agents
- Path B: the product is an agent
- Reaching production
- What "done" means
- Honest accounting of this chapter

### [04. Accessibility](guide/04-accessibility.md)

- Where this sits

### [05. Security and Privacy Review](guide/05-security-and-privacy-review.md)

- Security review
- Privacy review
- Why both are kept narrow

### [06. MCP Approvals](guide/06-mcp-approvals.md)

- First, which route are you on
- Route A: you are building a server
- Route B: you are self-hosting a server someone else wrote
- Route C: you are connecting to a vendor or third-party remote server
- Approval routing, condensed
- Where this leaves the open questions

---

## Technical and Evidence References

Non-binding and the most volatile layer. Check retrieval dates in the
[source ledger](SOURCES.md) before relying on anything here.

- [Appendix A: Framework Crosswalk](reference/framework-crosswalk.md)
- [Appendix B: What the Platform Enforces, and What a Human Has To](reference/platform-controls.md)
- [Appendix C: The Evidence on Gates](reference/evidence-on-gates.md)
- [Appendix D: Glossary, and Where the Analogy Breaks](reference/glossary.md)
- [Appendix E: Functional Capability Taxonomy](reference/capability-taxonomy.md)
- [Requirement index](reference/requirement-index.md), every numbered requirement

**Platform profiles.** Findings about one product at one date. They do not
generalize to the product category.

- [Platform profile: LiteLLM](reference/platform-profiles/litellm.md)
- [Platform profile: MCP](reference/platform-profiles/mcp.md)
- [Platform profile: n8n](reference/platform-profiles/n8n.md)

---

## Templates

A completed template is the evidence that a requirement was satisfied.

- [Template: Decision Record (ADR)](templates/adr.md)
- [Template: Institutional Amendments](templates/amendments-template.md)
- [Template: Design Review](templates/design-review.md)
- [Template: Agent Studio Workflow Inspection](templates/inspection-agent-studio.md)
- [Template: Agentic Product Inspection](templates/inspection-agentic-product.md)
- [Template: Gateway Credential Inspection](templates/inspection-gateway-key.md)
- [Template: MCP Server Inspection](templates/inspection-mcp-server.md)
- [Template: Third-Party Tool Server Boundary Inspection](templates/inspection-third-party-mcp.md)
- [Template: Production Approval](templates/production-approval.md)
- [Template: Statement of Need](templates/statement-of-need.md)

---

## Everything else

- [Home](index.md)
- [Executive summary](overview.md), the argument and the limits
- [Quick reference](quick-ref.md), everything binding on one printable page
- [Changelog](CHANGELOG.md), what each edition changed and what was wrong before
- [Source ledger](SOURCES.md), retrieval and review-by dates
- [Contributing](CONTRIBUTING.md)
