---
title: "Appendix A: Framework Crosswalk"
parent: "Technical and Evidence References"
nav_order: 1
---

Two purposes. Give you the mapping to answer "which control is this" when
audit asks. And be honest about which framework details were verified
against primary sources and which were not, because a crosswalk that
invents control identifiers is worse than no crosswalk.

**Verification status is marked throughout.** Do not cite an unverified
identifier from this page in a document that matters. Go read the standard.

---

## The frameworks, accurately

### NIST AI Risk Management Framework

**Document: NIST AI 100-1**, "Artificial Intelligence Risk Management
Framework (AI RMF 1.0)", released 2023-01-26
([NIST](https://www.nist.gov/itl/ai-risk-management-framework)).

Four core functions: **GOVERN, MAP, MEASURE, MANAGE**. GOVERN is
cross-cutting; the others are applied iteratively. Categories are
numbered `FUNCTION #` and subcategories `FUNCTION #.#`, so citations look
like `GOVERN 1.1` or `MAP 2.3`.

The **Generative AI Profile** is **NIST AI 600-1**, published 2024-07-26.
It defines named generative-AI risk categories; among them are CBRN
Information or Capabilities, Confabulation, Dangerous Violent or Hateful
Content, Data Privacy, Environmental Impacts, and Harmful Bias and
Homogenization.

A Playbook, Roadmap, and Crosswalk exist, hosted on NIST's AI resource
centre.

> **Verified:** document numbers, dates, the four function names, the
> numbering scheme, six generative-AI risk category names.
> **Not verified:** the total category and subcategory counts (commonly
> reported as 19 and 72, from a secondary source only); verbatim text of
> any individual subcategory; generative-AI risk categories beyond the
> six listed.
> **Note:** NIST states AI RMF 1.0 is being revised. **Cite it with a
> version.**

### ISO/IEC 42001

The AI management system standard, published 2023. Structured like other
ISO management-system standards: numbered clauses plus an Annex A of
controls. Commonly implemented alongside ISO/IEC 27001, with which it
shares the Annex SL high-level structure.

Annex A is **reported** as 38 controls in 9 groups numbered A.2 through
A.10, covering policies related to AI, internal organisation, resources
for AI systems, assessing impacts of AI systems, the AI system life
cycle, data for AI systems, information for interested parties, use of AI
systems, and third-party and customer relationships.

> **Not verified.** ISO's own catalogue page returned HTTP 403 and the
> standard text is paywalled. The control count, group numbering, and
> group names above come from secondary summaries. **Do not cite specific
> Annex A control identifiers on the basis of this page.** If you need
> them, buy the standard.
> Its documented relationship to ISO/IEC 23894 (AI risk management
> guidance) and ISO/IEC 42005 (impact assessment) is widely described as
> complementary but was not verified.

### ISO/IEC 38500:2024

*Information technology, Governance of IT for the organization.* Included
because it is the only framework on this page addressing the question this
model spends chapters 09 and 12 on: **who holds authority, and how it is
delegated.** Everything else here is a risk-management framework, and risk
frameworks have nothing to say about whether the office that says no will be
obeyed.

Reported to define four governance activities, applied by a governing body to
the organization's use of IT: **engage stakeholders, evaluate, direct, and
monitor.** Those four map onto this model as follows.

| 38500 activity *(reported)* | Where it lands here |
|---|---|
| Engage stakeholders | [Chapter 10](../model/10-concurrent-reviews.md) concurrent reviews; the accessibility, security, and privacy offices as parallel participants rather than sequential gates |
| Evaluate | [Chapter 03](../model/03-classification.md) classification and [chapter 04](../model/04-design-review.md) design review |
| Direct | [Chapter 05](../model/05-authorization-to-build.md) authorization to build; [chapter 12](../model/12-delegated-authority.md) delegated authority |
| Monitor | [Chapter 06](../model/06-inspections.md) inspections, [chapter 07](../model/07-production-approval.md) records and reconciliation, [requirement 8.9](../model/08-alterations.md) interval re-verification, and [requirement 1.9](../model/01-principles.md) measuring the governance system itself |

> **Not verified.** The standard is paywalled and ISO's catalogue page was not
> retrieved. The title, the 2024 revision year, and the four activity names
> above are taken from a secondary source, the *ITIL AI Governance* white paper
> (PeopleCert, v1.0, November 2025), which cites 38500:2024 as the basis for
> its own governance-pattern model. **Do not cite a clause of 38500 on the
> basis of this page.** The mapping in the table is ours regardless of whether
> the activity names are exact.
>
> The same white paper supplies the four-pattern governance diagnostic in
> [Adoption](../guide/01-adoption.md), where it is attributed and where its
> limits are stated.

### EU AI Act

Regulation (EU) 2024/1689. Four risk tiers, confirmed against the
Commission's own regulatory framework page: **unacceptable risk**
(prohibited practices, Article 5), **high risk** (with use cases listed
in Annex III, including education and employment), **transparency or
limited risk** (disclosure obligations for chatbots and synthetic
content), and **minimal risk** (no new obligations)
([European Commission](https://digital-strategy.ec.europa.eu/en/policies/regulatory-framework-ai)).

For general-purpose AI models, Article 51(2) sets a presumption of
high-impact capabilities where cumulative training compute exceeds
**10^25 FLOPs**.

**Timeline, and this is the part most write-ups get wrong.** The Act
entered into force 2024-08-01. A **Digital Omnibus** in force from
**2026-07-27** moved Annex III high-risk obligations from 2026-08-02 to
**2027-12-02**, and Annex I product-embedded high-risk systems to
2028-08-02.

Extraterritorial reach: it binds providers placing AI systems on the EU
market or whose system output is used in the EU. A US university is
plausibly in scope where it offers systems to users in the EU.

> **Verified:** the four tiers and the Omnibus timeline change, from the
> Commission's page.
> **Not verified:** operative article and annex text against EUR-Lex
> directly (a fetch returned recitals only); the 10^25 FLOPs figure came
> from a third-party explainer quoting the regulation rather than from
> EUR-Lex.
> **Do not plan against the widely-quoted August 2026 high-risk date.**

### OMB guidance

**M-24-10 is widely reported to be superseded**, and it is the memorandum
most AI governance write-ups still cite. It required Chief AI Officers, AI
governance boards, the "safety-impacting" and "rights-impacting"
categories, minimum practices, and public AI use-case inventories. Read
the verification note below before relying on the supersession: it is not
confirmed by any primary source consulted for this model.

The current instrument is **M-25-21**, "Accelerating Federal Use of AI
through Innovation, Governance, and Public Trust", dated **2025-04-03**,
confirmed present on OMB's own memoranda listing
([OMB](https://www.whitehouse.gov/omb/information-for-agencies/memoranda/)).
A companion procurement memorandum, **M-25-22**, carries the same date.

M-25-21 is reported to replace the safety-impacting and rights-impacting
split with a single **"High-Impact AI"** category, and to reframe Chief
AI Officers toward enabling adoption rather than compliance oversight.

> **Verified:** the existence, titles, and dates of M-25-21 and M-25-22.
> **Not verified:** the exact rescission language, the "High-Impact AI"
> replacement, **and the fact of supersession itself.** The OMB listing
> page confirms M-25-21 and M-25-22 exist but does not mention M-24-10 at
> all, and the M-25-21 PDF could not be retrieved. An independent
> verification pass reached the same dead end. A further memorandum,
> M-26-04, was mentioned in search results and could not be confirmed to
> exist.
> **Universities are not bound by OMB memoranda.** They matter here only
> because institutions frequently mirror federal structure, and because
> citing a rescinded memorandum as current is an avoidable embarrassment.

### Other catalogues worth mapping to

**OWASP Top 10 for LLM Applications 2025**: LLM01 Prompt Injection,
LLM02 Sensitive Information Disclosure, LLM03 Supply Chain, LLM04 Data
and Model Poisoning, LLM05 Improper Output Handling, LLM06 Excessive
Agency, LLM07 System Prompt Leakage, LLM08 Vector and Embedding
Weaknesses, LLM09 Misinformation, LLM10 Unbounded Consumption
([OWASP](https://genai.owasp.org/llm-top-10/)). OWASP also publishes an
MCP-specific cheat sheet for third-party servers, naming tool poisoning,
prompt injection, memory poisoning, and tool interference. **Verified.**

**The MCP specification** is itself a control source, and its normative
MUSTs are the most directly actionable requirements in this whole
appendix. See [appendix B](platform-controls.md).

---

## The master mapping

Construction concept, to what it becomes here, to which framework it
satisfies, to who or what enforces it. **This is the table to build from.**

| Construction | This model | Chapter | Framework mapping | Enforced by |
|---|---|---|---|---|
| Model code adopted with local amendments | The model plus your amendments document | README | NIST GOVERN (policies, roles); ISO 42001 clause structure | Institutional adoption. Nothing else. |
| Authority Having Jurisdiction | Named Final Decision Authority | 09 | NIST GOVERN (accountability structures); OMB CAIO analogue | Institutional charter |
| Statement of need / Owner's Project Requirements | Statement of Need | 02 | NIST MAP (context, purpose, beneficiaries); ISO 42001 A.5 impact assessment *(unverified id)* | Human. Intake process. |
| Feasibility study | Existing-tooling and do-nothing check | 02 | NIST MAP | Human |
| Occupancy classification | Risk tiers via stated triggers | 03 | EU AI Act tiering; NIST MAP (risk categorization); OMB High-Impact AI analogue | Human, from declared inputs. Partly automatable. |
| Prohibited construction | The "not permitted" category | 03 | EU AI Act Article 5 prohibited practices | Policy. Should be platform-enforced where possible. |
| Basis of Design | Design Response | 04 | NIST MAP, MEASURE | Human |
| Plan review / Commissioning Authority audit | Timeboxed peer or independent review | 04 | NIST GOVERN, MEASURE; ISO 42001 A.6 life cycle *(unverified id)* | Human. Timeboxed with deemed approval. |
| Submittal disposition stamps | Approved / Approved as Noted / Revise and Resubmit / Rejected | 04 | n/a. Process hygiene. | Human |
| Request for information | Lightweight recorded question path | 04, 08 | n/a | Human |
| Building permit | Authorization to Build, with conditions and expiry | 05 | NIST GOVERN | Partly platform (conditions), partly human |
| Permit expiry and lapse | Authorization lapse, credential expiry | 05 | NIST MANAGE | **Platform.** Key expiry is enforceable. |
| Inspection hold points | H1 through H5 | 06 | NIST MEASURE, MANAGE | **Mostly platform.** Automate everything countable. |
| Do-not-conceal rule | H4 concealment gate | 06 | NIST MANAGE; OWASP LLM06 Excessive Agency | Human sign-off above Tier 1 |
| Framing after rough-in | H3 requires H1 and H2 passed | 06 | n/a. Sequencing. | Platform (check dependency) |
| Special inspection by independent agency | Tier 3 independent reviewer | 06, 09 | NIST GOVERN (independence); ISO 42001 audit posture | Institutional structure |
| Engineer's seal | Responsible Builder signature | 09 | NIST GOVERN (accountability) | Human. **Deliberately no personal liability.** |
| Design professional of record | Standing Owner | 09 | NIST GOVERN | Human. Precondition for occupancy above Tier 1. |
| Certificate of occupancy | Production Approval | 07 | NIST MANAGE (deployment authorization) | Human, gated on platform checks |
| Temporary certificate of occupancy | Time-Limited Production Approval | 07 | NIST MANAGE | Human, with a real expiry date |
| Substantial completion | Support commitment starts | 07 | NIST MANAGE (incident response) | Human |
| Retainage | Withhold something until records are done | 07 | n/a. The enforcement trick. | Institutional |
| As-builts and record drawings | The registry | 07 | NIST GOVERN, MAP (inventory); OMB use-case inventory analogue | **Generate from platform where possible.** Human for the rest. |
| Punch list | Accepted Defect List, with owners | 08 | NIST MANAGE | Human |
| Change order | Alteration re-entry table | 08 | NIST MANAGE | Partly platform (drift alarms), partly human |
| Existing lawfully non-conforming buildings | Amnesty and compliance-on-alteration | 08 | NIST MAP (inventory before control) | Institutional decision |
| Hazard abatement in existing buildings | The short unsafe list | 08 | NIST MANAGE | Human, urgent |
| Stop work order | Disable key, unpublish tool, deactivate workflow | 05 | NIST MANAGE | **Platform.** Fast and reversible. |
| Variance | Recorded exception with compensating control | 05 | NIST GOVERN (risk acceptance) | Human, named authority |
| Trade licensure | *No equivalent exists* | 09 | n/a | **Nothing.** See below. |

### The row that does not map

There is no licensure for this work. No standardized education,
examination, continuing-education requirement, disciplinary board, or
professional insurance. That absence is why chapter 09 borrows the
*accountability* of the engineer's seal while explicitly refusing to
borrow its *liability*: the professional infrastructure that makes PE
liability fair does not exist here, and importing the consequence without
the infrastructure would just punish individuals for systemic failures.

Anyone extending this model should resist the temptation to close that
gap by inventing an internal certification. It is a real difference
between the domains, not an oversight in the analogy.

---

## Worked example

A reference stack of a self-hosted AI gateway (LiteLLM), an Agent Studio (n8n), and
a set of MCP servers, at a large decentralized research university. This
is the shape of steps 1 through 3 of the adoption path in the README.

### Step 1: Name the Final Decision Authority

The institution already has a policy body for AI and an existing IT
governance process for investment. **Do not add a third.** The Final Decision Authority is the
platform team that operates the gateway and the automation instance,
because they are the only party with both the technical standing to judge
a build and the operational ability to switch one off.

| Layer | Existing body | Role here |
|---|---|---|
| Policy | AI council or equivalent | What is permissible at all |
| Investment | IT governance process | What gets funded |
| **Operational** | **Platform team as the Final Decision Authority** | **Does this build meet the code** |

Stop-work authority: two named platform engineers plus a documented
deputy. Reachable within a day.

### Step 2: Map the tiers

Substitute the institution's own classification. A four-level scheme with
a genuinely prohibited category maps cleanly:

| Institutional data level | Tier |
|---|---|
| Low / public | 1 |
| Moderate / internal business | 2 |
| High / regulated, requiring security office engagement | 3 |
| Restricted, prohibited on the platform | **Not permitted** |

Note that the fourth row is not a tier. Where a gateway's own policy
forbids a data class outright, the governance model must have a "no" that
is not merely "more review."

Then layer the chapter 03 triggers on top, taking the highest.

### Step 3: Delete what cannot be enforced

This is where honesty pays. On this stack, per
[appendix B](platform-controls.md):

| Tempting control | Reality | What to write instead |
|---|---|---|
| "Workflow changes are reviewed before production" | No publish gate exists. Edit access is publish authority. | Name it a human control. Inspect who holds edit access at H4. Add external change detection. |
| "Guardrails protect all traffic" | Coverage is uneven across APIs; not applied to the Responses API on this platform. | Verify guardrails on the specific paths in the data flow diagram. |
| "All requests are logged" | A caller can set `"no-log": true` unless an admin flag is set. | Set the admin flag, then claim it. |
| "Rate limits apply to everyone" | Documented not to apply to proxy admin users. | Issue privileged credentials as separate recorded events. |
| "Shared budgets are scoped to teams" | Pool tags appear not to be validated or team-scoped, and may be attachable by request header. | Generate pool identifiers with real entropy, treat them as secrets, record ownership in the registry. |
| "Secrets are in a vault" | External secrets management is enterprise-gated on the automation platform. | Confirm your license tier before claiming it. |
| "SSO everywhere" | Enterprise-gated on both platforms. | Same. |
| "The registry validates MCP servers we install" | The official registry validates publisher namespace ownership only. | Inspect every server yourself. Nobody is doing it for you. |

Eight tempting controls, and on an open-source or low-tier deployment
roughly half are not available as claimed. Writing them down anyway would
have produced a governance document that was wrong in eight places, and
nobody would have found out until an incident.

That is the whole argument for [requirement 1.5](../model/01-principles.md).
