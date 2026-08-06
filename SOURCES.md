---
title: Source ledger
nav_order: 10
---

# Source Ledger

Every load-bearing citation, when it was retrieved, and when it needs
re-checking. This file exists because the claims in this model decay at
very different rates, and a citation without a retrieval date hides that.

**All entries retrieved 2026-08-04** unless stated otherwise. Two
independent verification agents re-fetched the high-priority entries the
same day.

Sources are grouped by **decay rate**, because that determines review
cadence. A protocol revision can invalidate a checklist in a month. A 2011
blog post about decision records will not.

---

## Fast decay: re-verify quarterly

Platform behavior, protocol revisions, and vulnerability data. **These
drive the inspection checklists, so staleness here is the most dangerous
kind.**

| Source | Supports | Retrieved | Review by |
|---|---|---|---|
| [MCP versioning](https://modelcontextprotocol.io/specification/versioning) | Current revision is `2026-07-28` | 2026-08-04 | 2026-11 |
| [MCP 2026-07-28 changelog](https://modelcontextprotocol.io/specification/2026-07-28/changelog) | Statelessness; `initialize` and `Mcp-Session-Id` removed (SEP-2567, SEP-2575) | 2026-08-04 | 2026-11 |
| [MCP transports](https://modelcontextprotocol.io/specification/2026-07-28/basic/transports) | HTTP+SSE deprecation status, SEP-2596 | 2026-08-04 | 2026-11 |
| [MCP streamable HTTP](https://modelcontextprotocol.io/specification/2026-07-28/basic/transports/streamable-http) | Streamable HTTP introduced `2025-03-26` as HTTP+SSE replacement | 2026-08-04 | 2026-11 |
| [MCP authorization](https://modelcontextprotocol.io/specification/2026-07-28/basic/authorization) | OAuth 2.1; RFC 9728, 8707, 8414, 9207 MUSTs; RFC 7591 deprecated for CIMD | 2026-08-04 | 2026-11 |
| [MCP security best practices](https://modelcontextprotocol.io/specification/2026-07-28/basic/security_best_practices) | The eleven threat section names; token passthrough MUST NOT; per-client consent MUST | 2026-08-04 | 2026-11 |
| [MCP registry](https://github.com/modelcontextprotocol/registry) | Validates publisher namespace only; no malware scanning or security review | 2026-08-04 | 2026-11 |
| [LiteLLM virtual keys](https://docs.litellm.ai/docs/proxy/virtual_keys) | `duration`, `upperbound_key_generate_params`, `no-default-models`, rotation with `grace_period` (enterprise) | 2026-08-04 | 2026-11 |
| [LiteLLM tag budgets](https://docs.litellm.ai/docs/proxy/tag_budgets) | Tags take only a name; attachable by key, metadata, or header; **docs silent on equivalence and on validation** | 2026-08-04 | 2026-11 |
| [LiteLLM users](https://docs.litellm.ai/docs/proxy/users) | "Rate limits do not apply to proxy admin users"; TPM/RPM scoping | 2026-08-04 | 2026-11 |
| [LiteLLM logging](https://docs.litellm.ai/docs/proxy/logging) | `no-log` caller suppression unless `global_disable_no_log_param`; `turn_off_message_logging`; enterprise-gated sinks | 2026-08-04 | 2026-11 |
| [LiteLLM guardrails](https://docs.litellm.ai/docs/proxy/guardrails/quick_start) | Hook modes; unified path excludes Responses API, embeddings, speech; enterprise-gated per-key control | 2026-08-04 | 2026-11 |
| [LiteLLM team budgets](https://docs.litellm.ai/docs/proxy/team_budgets) | Top-down enforcement, 400 `auth_error` | 2026-08-04 | 2026-11 |
| [LiteLLM advisories](https://github.com/BerriAI/litellm/security/advisories) | Ten advisories including two MCP-specific | 2026-08-04 | 2026-11 |
| [n8n save and publish](https://docs.n8n.io/build/understand-workflows/save-and-publish-workflows.md) | **No publish gate.** Settings-only changes auto-republish. | 2026-08-04 | 2026-11 |
| [n8n sharing](https://docs.n8n.io/build/manage-workflows/share-with-others.md) | Editors get implicit credential use; Creator/Editor roles; sharing tiers | 2026-08-04 | 2026-11 |
| [n8n external secrets](https://docs.n8n.io/administer/manage-credentials/use-external-secret-stores.md) | Enterprise-gated; six providers | 2026-08-04 | 2026-11 |
| [n8n SSO](https://docs.n8n.io/deploy/host-n8n/configure-n8n/security/configure-sso.md) | Business and Enterprise; SAML and OIDC only | 2026-08-04 | 2026-11 |
| [n8n execution data](https://docs.n8n.io/deploy/host-n8n/configure-n8n/scaling/manage-execution-data.md) | 336h and 10,000 defaults, not license-gated | 2026-08-04 | 2026-11 |
| [n8n security audit](https://docs.n8n.io/deploy/host-n8n/configure-n8n/security/run-security-audits.md) | Config scanner, not an activity log | 2026-08-04 | 2026-11 |
| [Anthropic security](https://code.claude.com/docs/en/security) | "does not security-audit or manage any MCP server" | 2026-08-04 | 2026-11 |
| [CVE-2025-49596](https://nvd.nist.gov/vuln/detail/CVE-2025-49596) / [GHSA](https://github.com/advisories/GHSA-7f8r-222p-6f5g) | MCP Inspector, 9.4, fixed 0.14.1. Score is GitHub CNA, not NVD. | 2026-08-04 | 2026-11 |
| [CVE-2025-6514](https://nvd.nist.gov/vuln/detail/CVE-2025-6514) / [GHSA](https://github.com/advisories/GHSA-6xpm-ggf7-wc3p) | `mcp-remote`, 9.6, fixed 0.1.16 (version from GHSA) | 2026-08-04 | 2026-11 |
| [CVE-2025-53110](https://github.com/advisories/GHSA-hc55-p739-j48w) | Official filesystem server, 7.3, fixed 2025.7.1 | 2026-08-04 | 2026-11 |
| [CVE-2025-53967](https://github.com/advisories/GHSA-gxw4-4fc5-9gr5) | `figma-developer-mcp`, 7.5, fixed 0.6.3 | 2026-08-04 | 2026-11 |

## Medium decay: re-verify semi-annually

Regulation and standards. Slower than software, but the dates in this
group have already moved once and caught people out.

| Source | Supports | Retrieved | Review by |
|---|---|---|---|
| [ADA Title II web rule](https://www.ada.gov/resources/2024-03-08-web-rule/) | WCAG 2.1 AA; **2027-04-26 / 2028-04-26 after the 2026-04-20 interim final rule**; 50,000 threshold; exceptions | 2026-08-04 | 2027-02 |
| [EU AI Act framework](https://digital-strategy.ec.europa.eu/en/policies/regulatory-framework-ai) | Four tiers; **Digital Omnibus in force 2026-07-27 moved Annex III to 2027-12-02** | 2026-08-04 | 2027-02 |
| [EU AI Act Art. 51](https://artificialintelligenceact.eu/article/51/) | 10^25 FLOPs systemic-risk presumption. Third-party explainer, **not EUR-Lex.** | 2026-08-04 | 2027-02 |
| [OMB memoranda](https://www.whitehouse.gov/omb/information-for-agencies/memoranda/) | M-25-21 and M-25-22 exist, titles and 2025-04-03 date. **Does not mention M-24-10.** | 2026-08-04 | 2027-02 |
| [NIST AI RMF](https://www.nist.gov/itl/ai-risk-management-framework) | AI 100-1 (2023-01-26); AI 600-1 (2024-07-26); four functions. **NIST states 1.0 is being revised.** | 2026-08-04 | 2027-02 |
| [W3C WCAG](https://www.w3.org/WAI/standards-guidelines/wcag/) | WCAG 2.2 current; levels A, AA, AAA; ISO/IEC 40500:2025 | 2026-08-04 | 2027-02 |
| [Section 508](https://www.section508.gov/manage/laws-and-policies/) | Revised 508 Standards effective 2018-01-18, reference WCAG 2.0 | 2026-08-04 | 2027-02 |
| [OWASP Top 10 for LLM 2025](https://genai.owasp.org/llm-top-10/) | LLM01 through LLM10 | 2026-08-04 | 2027-02 |
| [OWASP MCP cheat sheet](https://genai.owasp.org/resource/cheatsheet-a-practical-guide-for-securely-using-third-party-mcp-servers-1-0/) | Tool poisoning, prompt injection, memory poisoning, tool interference | 2026-08-04 | 2027-02 |
| [34 CFR 99.31](https://www.law.cornell.edu/cfr/text/34/99.31) | FERPA school official exception, three vendor conditions | 2026-08-04 | 2027-02 |
| [RFC 8693](https://datatracker.ietf.org/doc/html/rfc8693) | Impersonation vs delegation; `act`, `may_act`, `actor_token` | 2026-08-04 | 2027-08 |

## Slow decay: re-verify annually

Findings and practice. Stable, but confirm the pages still exist.

| Source | Supports | Retrieved | Review by |
|---|---|---|---|
| [DORA change approval](https://dora.dev/capabilities/streamlining-change-approval/) | All five quotes, **including peer review as the endorsed substitute** | 2026-08-04 | 2027-08 |
| [Nygard, Documenting Architecture Decisions](https://cognitect.com/blog/2011/11/15/documenting-architecture-decisions) | ADR format, scoping rule, mark-superseded convention | 2026-08-04 | 2027-08 |
| [Simon Willison, lethal trifecta](https://simonwillison.net/2025/Jun/16/the-lethal-trifecta/) | The three components, verbatim | 2026-08-04 | 2027-08 |
| [ICC-ES](https://icc-es.org/) | Evaluation Reports; Acceptance Criteria; ongoing surveillance | 2026-08-04 | 2027-08 |
| [Invariant Labs, tool poisoning](https://invariantlabs.ai/blog/mcp-security-notification-tool-poisoning-attacks) | Tool poisoning, rug pull, shadowing. **Fetched once, not re-verified.** | 2026-08-04 | 2027-08 |
| [Trail of Bits, line jumping](https://blog.trailofbits.com/2025/04/21/jumping-the-line-how-mcp-servers-can-attack-you-before-you-ever-use-them/) | `tools/list` loads before invocation. **Fetched once, not re-verified.** | 2026-08-04 | 2027-08 |
| [IT@Cornell governance](https://it.cornell.edu/itgovernance) | A published university governance structure with a policy layer and no operational layer | 2026-08-04 | 2027-08 |
| [UC AI Council](https://ai.universityofcalifornia.edu/) | Covers "development and deployment"; **defines no named risk tiers**. The landing page carries no date and no version number. | 2026-08-04 | 2027-08 |
| [UC AI Council Risk Assessment Guide v1.1](https://ai.universityofcalifornia.edu/_files/documents/uc-ai-council-risk-assessment-guide-1.1-1.pdf) and [v1.0](https://ai.universityofcalifornia.edu/_files/documents/final-uc-ai-council-risk-assessment-guide-1.0.pdf) | Title as printed; scope limited to administrative use, excluding research and pedagogy; **explicitly advisory**, deferring adoption to each location. PDFs are not decodable by fetch tooling; read directly. **Neither document prints a date.** | 2026-08-05 | 2027-08 |
| [Report of the AI at Stanford Advisory Committee](https://provost.stanford.edu/news/report-ai-stanford-advisory-committee) | Office of the Provost, 2025-01-09, chaired Russ Altman; three domains; cautions against fixed rigid policies. **Direct fetch 403; recovered by two independent extractions. The report PDF itself was not retrieved.** | 2026-08-05 | 2027-08 |
| [Responsible AI at Stanford](https://uit.stanford.edu/security/responsibleai) and [Responsible Agentic AI](https://uit.stanford.edu/security/agenticai) | Live Stanford UIT guidance, advisory register. **Neither page carries a date.** | 2026-08-05 | 2027-02 |
| [AWS AI-Driven Development Life Cycle](https://aws.amazon.com/blogs/devops/ai-driven-development-life-cycle/) | Title, 2025-07-31, author; AWS calls it "a new methodology"; phases Inception, Construction, Operations | 2026-08-05 | 2027-08 |
| [arXiv 2606.22484](https://arxiv.org/abs/2606.22484) | Title, author, cs.HC, v1 2026-06-21, v2 2026-07-04; proposes "Governed AI-Assisted Engineering (GAIE)". **Abstract wording is a tool summary, not verbatim. Do not quote it.** | 2026-08-05 | 2027-08 |
| [arXiv 2607.15769](https://arxiv.org/abs/2607.15769) | Title, five authors, cs.SE, 2026-07-17; proposes an "Agent Governance Manifest"; 15+15 participant studies. **Abstract wording is a tool summary, not verbatim.** | 2026-08-05 | 2027-08 |
| [Agent Governance Toolkit](https://microsoft.github.io/agent-governance-toolkit/) | Exists in the `microsoft` GitHub organisation namespace, **not** first-party Microsoft product documentation; describes itself as augmenting "Microsoft Agent 365" | 2026-08-05 | 2027-02 |
| *ITIL AI Governance* white paper, PeopleCert, v1.0, November 2025. Supplied to this project as a PDF; no stable public URL confirmed. | The four governance patterns and ten characteristics in [Adoption](guide/01-adoption.md), and the six functional capabilities in [Appendix E](reference/capability-taxonomy.md). **Secondary source for ISO/IEC 38500:2024**, whose activity names are taken from it. | 2026-08-05 | 2027-08 |

> **On the ITIL white paper.** Read as a document, not as evidence. Its own
> need-establishing statistics are vendor-published survey figures and are
> **not** cited anywhere in this model, consistent with the refusals below. Its
> risk-level matrix mapping capabilities against risks is asserted without a
> stated method and is deliberately not reproduced. What was taken is
> vocabulary and a diagnostic structure, both attributed at the point of use.

---

## Known unreachable

Attempted and failed. Listed so nobody assumes these were simply not
tried, and so a future pass knows what to retry.

| Source | Status | What it would settle |
|---|---|---|
| `iso.org` ISO/IEC 42001 catalogue | 403, and standard is paywalled | Annex A control count and numbering. **Never cite an Annex A ID from this model.** |
| `iso.org` ISO/IEC 38500:2024 catalogue | Not retrieved, and standard is paywalled | The four governance activity names and their clause numbers. Currently taken from a secondary source. **Never cite a 38500 clause from this model.** |
| `library.educause.edu` | 403 | Higher-ed prior art. Section 1 of the report is thin because of this. |
| OMB M-25-21 PDF | 404 | Whether M-24-10 was actually rescinded, and the "High-Impact AI" category |
| EUR-Lex operative text | Returned recitals only | Article 5, Annex III, Article 51 verbatim |
| `eCFR.gov`, `GovInfo.gov` | Bot block, 404 | FERPA text (obtained from Cornell LII instead) |
| `iccsafe.org`, `aia.org`, `ncees.org`, `dos.ny.gov` | Not retrievable | IBC inspection sequence and section numbers, listed/labeled definitions, AIA phase names, NCEES sealing rules, NYS I-Code baseline. **This is why chapter 06's construction framing and the glossary carry unverified labels.** |
| `riba.org` Plan of Work | 403 | RIBA stage names (obtained via grounded search instead) |
| `docs.litellm.ai/docs/proxy/mcp` | 404 | LiteLLM MCP gateway access control, logging, OAuth passthrough |
| `it.cornell.edu/security-policy/data-types-...` | 404 on three URL variants | A citable public data-classification scheme |
| `provost.stanford.edu` news page and `/artificial-intelligence` | 403 to direct fetch | Stanford's AI governance posture first-hand. Content was recovered by two independent extractions instead, and the report PDF was never retrieved. |
| `adminguide.stanford.edu` | 403 | Whether Stanford's Administrative Guide carries a binding AI provision |
| Microsoft Learn page for "Microsoft Agent 365" | Not retrieved | Whether Agent 365 is a shipped product, and its scope. **Never describe it as verified in this model.** |
| A canonical publisher for "AI-SDLC" | Searched, none found | Nothing. Several unrelated small projects share the name; no standards body, vendor, or paper owns it. **It is not a citable framework.** |

## Open empirical questions

Not sources. Things nobody appears to have measured, recorded here so the
gap stays visible:

1. Does build governance reduce AI-related harm in higher education?
2. What fraction of AI capabilities in a decentralized institution are
   visible to central IT?
3. Is there published practice for student-builder credential lifecycle
   and knowledge transfer?
4. Does a capability registry stay accurate without enforcement?

## Maintenance

`tools/check.sh` verifies this file exists. It cannot verify the dates are
honest. Re-verification is a human act, and the review dates above are the
commitment. When you re-verify, update the retrieved date and record it in
[the changelog](CHANGELOG.md).
