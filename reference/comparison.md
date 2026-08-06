---
title: "How This Compares"
parent: "Technical and Evidence References"
nav_order: 9
---

# How This Compares

**This framework operationalizes NIST AI RMF rather than competing with it.** The
RMF says what to govern and this says who signs on a Tuesday. If an institution
has to pick one, pick the RMF, because it is authoritative, maintained by a
standards body, and this is not.

That is the short version. What follows is the longer one, including where each
alternative is genuinely stronger, and it is written to be usable by someone
deciding whether they need this at all.

**Read the verification status.** Every entry states what was fetched from a
primary source and what was not. Two of the artifacts most often cited in this
space could not be fully verified, and they are labelled rather than described
confidently. See the
[source ledger](https://github.com/pete-builds/ai-build-governance/blob/main/SOURCES.md)
for retrieval dates.

---

## The distinction that decides whether any of this is relevant

Most published AI governance material governs one of three things, and only the
third is what this framework is about:

| What is governed | Typical artifact | Example question it answers |
|:--|:--|:--|
| **Use** | Acceptable-use guidance | May a staff member paste this into a chatbot? |
| **Risk, assessed per system** | Risk assessment guide, questionnaire | How risky is this system, on a scale? |
| **The act of building** | This framework | Who authorized construction, what was verified, who approved production, and where is it recorded? |

Almost everything in the landscape sits in the first two categories. That is not
a criticism; it is where the demand has been. It does mean an institution can
have a complete-looking AI governance programme and still have no answer to "a
staff member wired an automation platform to a system of record last Thursday,
who reviewed that".

---

## Framework by framework

### NIST AI RMF (AI 100-1) and the Generative AI Profile (AI 600-1)

**Verified.** "Artificial Intelligence Risk Management Framework (AI RMF 1.0)",
NIST AI 100-1, January 2023, DOI 10.6028/NIST.AI.100-1. "Artificial Intelligence
Risk Management Framework: Generative Artificial Intelligence Profile", NIST AI
600-1, July 2024, DOI 10.6028/NIST.AI.600-1. Four functions confirmed: GOVERN,
MAP, MEASURE, MANAGE, with categories and subcategories numbered `FUNCTION n.m`.
NIST's page states AI RMF 1.0 is being updated.

**Scope:** risk management across the AI lifecycle. **Register:** advisory. The
framework states its actions do not constitute a checklist and need not be
followed in sequence. **Adoption:** voluntary by design.

**Genuinely stronger:** it is authoritative and maintained, which nothing here
is. The GOVERN/MAP/MEASURE/MANAGE structure survives being applied to wildly
different risk contexts, which a build-lifecycle sequence does not. And AI 600-1
demonstrates NIST's own pattern for overlaying a domain-specific profile on the
core, which is a better-supported way to extend the RMF than adopting a separate
framework alongside it.

**Relationship to this:** the [crosswalk](framework-crosswalk.md) maps this
framework's requirements onto RMF subcategories. The RMF tells you to establish
accountability structures; this names the office, the artifact, and the turnaround
time. An institution running the RMF and finding that builds still reach
production unreviewed has the gap this framework addresses.

### Report of the AI at Stanford Advisory Committee

**Verified with a caveat.** Published 9 January 2025 by the Office of the Provost,
chaired by Russ Altman, with members from University Counsel, University IT,
Academic Affairs, Computer Science, and others. Committee charged 18 March 2024.
Covers three domains: administration, education, research.

`provost.stanford.edu` returned HTTP 403 to direct fetch and the content was
recovered through a text-extraction proxy plus a second independent extraction.
**UNVERIFIED: the report PDF was not itself retrieved**, so specific
recommendations beyond those quoted below are not attested here.

Stanford University IT separately publishes live guidance pages, both fetched
successfully: "Responsible AI at Stanford" and "Responsible Agentic AI". Both are
advisory in register. Neither carries a date. The agentic page contains one
obligation-shaped clause: "All agent outputs and actions require verification
proportional to impact."

**Register:** advisory, deliberately. The committee is quoted "cautioning against
creating fixed, rigid policies (except where required by law or other compelling
considerations)". One firm prohibition: confidential or legally privileged
information may not be provided to generative AI tools.

**Genuinely stronger:** it deliberately avoids freezing rules in a field that is
still moving, which is a defensible position and the opposite of the bet this
framework makes. It also spans administration, education, and research in a single
deliberative body, so it surfaces cross-cutting conflicts (academic integrity
policy colliding with research data policy, for instance) that a
single-lifecycle build code is structurally blind to. And it has something this
does not: institutional standing. A Provost-commissioned committee report is in
force in a way a repository is not.

**Note on adoption, stated carefully.** Stanford has an in-force institutional
artifact and live IT guidance. This framework has neither. That is a real
asymmetry and it is not the same claim as "Stanford has adopted a numbered build
code", which was not established and appears not to be the case.

### UC AI Council Risk Assessment Guide

**Verified from the documents.** Title as printed: "UC AI COUNCIL RISK ASSESSMENT
GUIDE", body heading "AI Risk Assessment Process". Both version 1.0 and version
1.1 exist and were read. Published by the University of California AI Council,
citing the UC Presidential Working Group on AI (2021) as its principles source.
**UNVERIFIED: neither document prints a date**, and the publishing site does not
supply one.

**Scope, quoted:** "intended only for AI procured and/or used for administrative
purposes, and does not apply to AI used for research or pedagogy."

**Register: advisory, and explicitly not mandatory.** This corrects a common
assumption, so the quotations matter:

- "This guide will not answer whether a User ... can adopt an AI-enabled system,
  that is a decision for the UC location's governance."
- "Each campus should establish its own approval processes for AI-enabled systems."
- "This guide complements, but does not replace, an AI governance structure or
  protocols."

No obligation language binding a UC location to use it was found.

**Genuinely stronger:** it is built for federated adaptation, one instrument reused
by many autonomous campuses each layering its own scoring on a shared risk
taxonomy. For a multi-campus system that is a better fit than a single code with
amendments, and it is a real alternative to the adopt-and-amend pattern this
framework borrows from building codes. It is also scoped honestly: excluding
research and pedagogy up front avoids the boundary fights that scope creep
produces.

**Relationship to this:** complementary and largely non-overlapping. Their guide
assesses how risky a system is; this framework decides what happens next as a
result. An institution could reasonably run the UC guide as its
[classification](../model/03-classification.md) input.

### AWS AI-Driven Development Life Cycle (AI-DLC)

**Verified.** "AI-Driven Development Life Cycle: Reimagining Software
Engineering", AWS DevOps and Developer Productivity Blog, 31 July 2025, by Raja
SP. AWS frames it as "a new methodology", not a product. Three phases: Inception,
Construction, Operations, with renamed Agile vocabulary ("bolts" for sprints).
Related repositories exist under `awslabs` and `aws-samples`.

**Scope:** using AI to build software. It is not an AI governance instrument and
does not present itself as one.

**Genuinely stronger:** it addresses the productivity question this framework
ignores entirely, and it is the only artifact here that takes seriously that the
builder is now partly an AI. Its human-sign-off loop inside Construction is a
lighter-weight idea than a verification-point sequence.

**Relationship to this:** orthogonal. A team could run AI-DLC as its delivery
method and this as its governance, and the two would touch only at the sign-off
loop. Naming it here because it is frequently raised in the same conversation
despite answering a different question.

### Microsoft agent governance material

**Verified negative, and worth stating precisely.** There is an "Agent Governance
Toolkit" at `github.com/microsoft` and `microsoft.github.io`, which frames itself
as augmenting "Microsoft Agent 365" using Entra identity, Purview DLP, and
Defender signals. **It is in the Microsoft GitHub organisation namespace, not
Microsoft's first-party product documentation**, so describing it as an official
Microsoft product would be wrong.

**UNVERIFIED: Microsoft Agent 365's exact scope and availability**, which was not
confirmed against a Microsoft Learn page.

**Genuinely stronger:** if an institution is already inside that estate, identity
and data-loss controls enforced by the platform beat any amount of documented
procedure. That is this framework's own [principle
1.5](../model/01-principles.md) turned against it: an enforced control is worth
more than a requirement, and a vendor holding both the identity plane and the data
plane can enforce things a code can only ask for. The limits are that it governs
one estate, and that a control you cannot inspect is one you are trusting rather
than verifying, which is [chapter 13](../model/13-third-party.md)'s whole subject.

### GAIE, arXiv 2606.22484

**Verified as existing.** "Governed AI-Assisted Engineering: Graduated Human
Oversight for Agentic Code Generation in Regulated Domains", Richard (Khoon Seang)
Kang, cs.HC, v1 21 June 2026, v2 4 July 2026. Proposes a three-tier oversight
model it calls an Oversight Classification Model, mapped against Bank of Thailand
2025 AI policy, MAS, NIST AI RMF, ISO/IEC 42001, and the EU AI Act.

**UNVERIFIED: the abstract wording**, which was returned as a tool summary rather
than a verbatim extract. Do not quote it.

**Genuinely stronger:** it is peer-facing academic work with an explicit regulatory
mapping, and it targets the case this framework handles least well, which is code
generated by agents rather than capabilities assembled by people. Its graduated
oversight tiers are close kin to
[classification](../model/03-classification.md) and arrived at independently,
which is mild corroboration that the tier idea is not idiosyncratic.

### Agent Governance Manifest, arXiv 2607.15769

**Verified as existing.** "Making Agent-Mediated Contributions Governable: A
Project-Level Governance Manifest for Open-Source AI Collaboration", Jinjin Gao,
Luyang Li, Shufen Guo, Ligang He, Xiaoning Sun, cs.SE cross-listed cs.CY,
submitted 17 July 2026, preprint under journal review, CC BY 4.0. Proposes a
repository-hosted governance contract, evaluated with a 15-participant reviewer
study and a 15-participant contributor study.

**UNVERIFIED: the abstract wording**, same caveat as above.

**Genuinely stronger, and this is the sharpest comparison on the page:** it has
**empirical evaluation with human participants**, and this framework has none.
Thirty participants is small and it is infinitely more than zero. It is also
machine-readable and repository-local by design, which is a more enforceable shape
than a document, and closer to what
[the reference gate](enforcement.md) here gropes towards with far less rigour.

### "AI-SDLC"

**Not a citable framework.** Searched and found only unrelated small projects
sharing the name: an open-source "decision engine for spec-driven AI workflows",
a separate site describing "the autonomous AI-SDLC framework", an unrelated
AI-agnostic CLI tool, and a commercial productivity product. No standards body,
major vendor, or academic artifact publishes anything under that exact name.

It is included here only because it gets cited as though it were a framework. It
is a generic term with no owner, and it is distinct from AWS's AI-DLC above.

---

## Where this framework is weaker than all of them

Stated here rather than left for a reader to find:

1. **No adoption.** Nobody has piloted it. NIST is authoritative, Stanford's and
   UC's artifacts are in force at real institutions, and the two arXiv papers have
   human-participant evaluation. This has a documented argument and no evidence.
   The [pilot protocol](../guide/07-pilot-protocol.md) is the instrument for
   changing that, and it is not a substitute for having done it.
2. **No maintaining body.** It is one person's work under CC BY 4.0. A framework
   whose sources decay quarterly and whose maintainer may lose interest is a real
   risk to anyone adopting it.
3. **Thirteen chapters is more than most people will read**, and the alternatives
   are mostly shorter.
4. **It bets on writing rules down in a field that is moving**, which is exactly
   what the Stanford committee cautioned against. If they are right, this ages
   badly and the numbered-requirement structure is what makes the ageing visible.
5. **Its construction sourcing is the weakest part of it**, and the metaphor leans
   on it hardest.

---

## When to use this rather than something else

Narrowly, and only if all of these are true:

- Your institution **builds or assembles** AI capabilities rather than only buying
  them.
- Those builds happen **outside a software delivery organisation**, by people who
  never met a change process.
- You already have principles or a policy body, and what is missing is the
  operating layer that turns them into a decision.
- You need requirements **citable by number**, because you intend to amend them
  locally and track what you changed.

If you need a risk taxonomy, use NIST or UC's guide. If you need use policy, this
says nothing about it. If your builds all go through a delivery org with code
review and CI, you likely have most of the substance already and need the
[record-keeping](../model/07-production-approval.md) chapter more than the rest.

---

## Sources and confidence

Primary sources fetched for NIST (both documents, from `nvlpubs.nist.gov`), AWS
(the DevOps blog post), UC (both PDF versions, read directly), Stanford UIT (both
guidance pages), and both arXiv abstract pages.

**Not fully verified, and labelled in place above:** the Stanford Provost report
PDF, the date of either UC guide version, Microsoft Agent 365's scope, and the
verbatim abstract text of both arXiv papers.

**No claim is made anywhere on this page about relative effectiveness**, because
no comparative study of AI build governance in higher education was located. The
strengths attributed to each alternative are structural properties of the
artifacts, not measured outcomes.
