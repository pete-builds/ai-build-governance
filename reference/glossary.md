---
title: "Appendix D: Glossary, and Where the Analogy Breaks"
parent: "Technical and Evidence References"
nav_order: 4
---

---

## Construction terms, accurately defined

Definitions here reflect standard practice. Where a section number or
attribution could not be verified against a primary source, it says so
rather than implying precision.

| Term | What it actually means |
|---|---|
| **I-Codes** | The family of model codes published by the International Code Council, including the International Building Code (IBC), on a three-year publication cycle. |
| **Model code** | A code with **no legal force** until a jurisdiction adopts it. Adoption usually comes with local amendments. This separation of authorship from authority is the mechanism this whole model imitates. |
| **Authority Having Jurisdiction (AHJ)** | The office holding enforcement authority. The term comes from NFPA codes and is defined by **function rather than job title**, because local enforcement structures vary too much for a fixed title. |
| **Plan review** | Examination of submitted documents against the code before a permit is issued. Also called plan examination. Checks against a published standard, not against the reviewer's preference. |
| **Permit** | Authorization to perform specific work per reviewed documents, subject to inspections. **Does not authorize occupancy.** Expires. |
| **Hold point** | A stage at which work must stop for inspection before proceeding. |
| **Rough-in** | Installation of the parts of a system that will be concealed: piping, wiring, ducts, before enclosure. |
| **Concealment rule** | Work must not be covered, closed in, or concealed before inspection and approval. A building official can require concealed work uncovered, at the permit holder's expense. |
| **Special inspection** | Independent inspection of high-risk work by an approved agency. Critically, **engaged by the owner rather than the contractor**, so the inspector is not paid by the party being inspected. An IBC concept; chapter numbering not verified. |
| **Certificate of Occupancy (CO)** | The instrument permitting lawful occupancy or use. A separate event from completion. |
| **Temporary Certificate of Occupancy (TCO)** | Conditional, time-bound occupancy permission, issued where the occupied portion is safe. **Occupancy after expiry is unlawful.** |
| **Stop work order** | An order halting work, for unpermitted work, an uninspected hold point passed, or an immediate hazard. |
| **Variance** | A documented, justified departure from the code, granted by a named authority and recorded. |
| **Lawfully non-conforming** | An existing building that does not meet current code but is legal because it complied when built. Compliance is generally triggered by **alteration**, and often only for the altered portion. |
| **PE seal / stamp** | A licensed engineer's certification that work was performed under their "responsible charge." Creates personal professional liability that generally survives the corporate form. Boards discipline licensees for "plan stamping," meaning sealing work they did not supervise. Liability substance is well attested; NCEES rule numbering was not verified. |
| **Design Professional of Record** | The party holding overall design responsibility and coordination. |
| **Engineer of Record** | The party holding technical responsibility for a specific engineering system. |
| **RFI** | Request for Information. A formal request to clarify an ambiguity in the contract documents. AIA Document G716. |
| **Submittal / shop drawing** | Contractor-produced documents demonstrating conformance to design intent. **Not contract documents.** Reviewed with a disposition stamp: Approved, Approved as Noted, Revise and Resubmit, or Rejected. |
| **Change order** | A formal instrument modifying scope, price, and schedule, signed by owner, architect, and contractor. AIA G701. |
| **Punch list** | A list of remaining defects near substantial completion. Tracked, owned, and not blocking occupancy. |
| **Substantial completion** | The stage at which the owner can occupy or use the work for its intended purpose. Triggers warranty commencement and release of retained payment. AIA G704 certifies it. |
| **Retainage** | Payment withheld until obligations, including record documents, are satisfied. The mechanism that makes closeout paperwork actually happen. |
| **As-built** | The contractor's field markups of what was actually installed. |
| **Record drawings** | The design professional's clean final compilation of as-built information. Legally distinct from as-builts. |
| **AIA design phases** | Schematic Design, Design Development, Construction Documents, Bidding/Negotiation, Construction Administration. |
| **RIBA Plan of Work 2020** | Stage 0 Strategic Definition, 1 Preparation and Briefing, 2 Concept Design, 3 Spatial Coordination, 4 Technical Design, 5 Manufacturing and Construction, 6 Handover, 7 Use. |
| **Program of requirements** | The output of architectural programming: required spaces, areas, and adjacencies, defined before design. |
| **Owner's Project Requirements (OPR)** | The owner's statement of functional and performance intent. The *what*. From commissioning practice, associated with ASHRAE Guideline 0; guideline text not verified. |
| **Basis of Design (BOD)** | The design team's technical response to the OPR. The *how*. |
| **Commissioning Authority** | The party auditing the Basis of Design against the Owner's Project Requirements, and verifying installed performance. |

---

## The mapping, in one table

| Construction | This model |
|---|---|
| Model code | This repository |
| Local amendments | Your institution's amendments document |
| Jurisdiction | Your institution |
| AHJ | Named operational office, chapter 09 |
| Statement of need / OPR | Statement of Need, chapter 02 |
| Program of requirements | Declared data, population, success criteria |
| Feasibility study | Existing-tooling and do-nothing check |
| Basis of design | Design Response, chapter 04 |
| Plan review | Timeboxed peer or independent review |
| Permit | Permit with conditions and expiry, chapter 05 |
| Inspections | H1 through H5, chapter 06 |
| Rough-in inspection | Tool, permission, and egress inventory (H2) |
| Concealment inspection | The observability gate (H4) |
| Final inspection | Real data, real guardrails (H5) |
| Certificate of occupancy | Production authorization, chapter 07 |
| TCO | Time-boxed pilot authorization |
| Substantial completion | Support commitment begins |
| Retainage | Withhold something until the record is done |
| As-builts / record drawings | The registry |
| Punch list | Accepted deferred defects |
| Change order | Alteration re-entry, chapter 08 |
| RFI | A cheap recorded question |
| Lawfully non-conforming | Existing work under amnesty |
| Hazard abatement | The short unsafe list |
| Stop work | Disable the key, unpublish the tool |
| Variance | Recorded exception with compensating control |
| Engineer's seal | Responsible Builder signature, **without personal liability** |
| Special inspection | Independent Tier 3 review |

---

## Where the analogy breaks down

An analogy used this heavily has to declare its limits, or it starts
generating bad conclusions by momentum. Four real breaks.

### 1. There is no licensure, and there should not be a fake one

Construction accountability rests on infrastructure: standardized
education, examination, licensure, continuing education, disciplinary
boards, and professional liability insurance. None of it exists for AI
engineering.

This model borrows the *idea* of a named responsible party while
explicitly declining to borrow personal liability, because liability
without the supporting infrastructure just means punishing individuals
for systemic failures. Resist closing this gap with an invented internal
certification. It is a genuine difference between the domains.

### 2. Buildings do not change after occupancy. These do.

A building's physical structure is essentially static once complete.
Software changes continuously, and AI systems change **without anyone
touching them**: the model behind an API is updated, a model is
deprecated on a published schedule, a dependency accumulates a
vulnerability, an upstream tool description is revised.

The construction sequence is fundamentally one-directional. This is why
[chapter 07](../model/07-production-approval.md) makes periodic record
review mandatory rather than optional, and why several hold-point checks
are specified as standing rather than one-time. A capability correct at
final inspection decays on its own.

### 3. Physical failure is legible. AI failure often is not.

A structural failure is visible, and its cause is usually determinable.
An AI system producing subtly biased outputs, or being gradually
manipulated through injected content, may show no external symptom at
all. There is no equivalent of a crack in a beam.

Consequence: this model leans harder on **observability** than
construction does on inspection, and that is the reason H4 is the most
important gate. In construction, the inspection is the control. Here, the
inspection largely verifies that the *ongoing* controls exist, because
nobody can inspect for a failure mode that leaves no trace.

### 4. Nondeterminism has no construction analogue

A beam either carries the load or it does not. An AI system produces
different output for the same input, and being wrong is routine operation
rather than a defect. No building code contemplates a structural element
that works 94% of the time.

This is why chapter 02 requires a stated tolerance for being wrong, who
bears the cost, and how an affected person contests an output. There is
nothing to borrow for this. It is the part of AI governance construction
governance cannot teach us, and any model built on this analogy has to
supply it separately or it will have a hole exactly where the hardest
problem is.

---

## A note on the phrase "building code"

Real building codes are minimum standards. They do not describe good
buildings; they describe the floor below which a building is unlawful.
Excellent buildings vastly exceed code, and nobody confuses compliance
with quality.

Hold this model to the same reading. It is a floor. Meeting it does not
make an AI capability good, useful, or wise, and it certainly does not
make it compliant with any law. It means the obvious ways of causing harm
were considered by someone, at a point when considering them was still
cheap.

That is a low bar. It is also considerably higher than the bar most
institutions currently clear.
