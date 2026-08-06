---
title: "Pilot Findings"
parent: "Templates"
nav_order: 11
---

# Pilot Findings

For reporting a pilot run under the [pilot protocol](../guide/07-pilot-protocol.md).
A completed copy of this is the most valuable contribution anyone can make to this
framework, and the sections that reflect badly on it are the ones worth most.

Copy the headings. Delete the guidance in italics. Where you did not measure
something, write "not measured" rather than estimating, because a retrospective
guess reads identically to data and is not.

---

## 1. Context

| Field | Value |
|:--|:--|
| Institution type | *Public or private, approximate size, centralized or federated IT* |
| Edition adopted | *For example 2026.6* |
| Amendments in force during the pilot | *Link the adopting instrument, or "none, adopted unchanged"* |
| Pilot window | *Start and end dates* |
| Final Decision Authority | *Role, not a name* |
| Archetypes run | *A, B, C, or what you substituted and why* |

**Local parameters set for the pilot.** *Data classifications and review
turnarounds require local values. State the ones you used, because effort figures
are meaningless without them.*

---

## 2. Per capability

*Repeat this block for each capability. Three is the protocol's minimum.*

### Capability: *name*

| Field | Value |
|:--|:--|
| Archetype | *A, B, or C* |
| Platform | *Be specific. Findings attach to products, not categories* |
| Tier assigned at classification | |
| Trigger that drove the tier | *Identifier and requirement number* |
| Tier after review, if it changed | *And which direction* |
| All three legs of the trigger B combination present? | *Yes or no* |

**Effort**

| Stage | Builder hours | Reviewer hours | Wall-clock days |
|:--|--:|--:|--:|
| Statement of need | | | |
| Classification | | | |
| Design review | | | |
| Concurrent reviews | | | |
| H1 to H3 | | | |
| H4 | | | |
| H5 | | | |
| Production approval and record | | | |
| **Total** | | | |

**Turnaround achieved against published time**

| Review | Published | Actual | Deemed approved on expiry? |
|:--|:--|:--|:--|
| Design review | | | |
| Security | | | |
| Privacy | | | |
| Accessibility | | | |

*Accessibility and lawful-basis findings are never deemed, per requirement 10.6.
If one was treated as deemed, record that as a deviation in section 4.*

**Outcomes**

| Measure | Result |
|:--|:--|
| Defects caught, and at which point | |
| Defects that reached production anyway | |
| Certified components consumed | *Name them, or "none"* |
| Reviews avoided by consuming them | |
| Was this capability certified as reusable afterwards? | |
| Exceptions recorded | *Requirement numbers* |
| Alterations during the window, and whether reclassification was triggered | |

---

## 3. Where the framework was confusing

*Quote verbatim. Paraphrase loses the defect. For each, name the file and the
requirement number, and say what the reader thought it meant.*

| What was read | What the reader concluded | What was intended |
|:--|:--|:--|
| | | |

*Any place a reader had to translate a construction metaphor to work out what was
being asked is a defect worth reporting, not a failure of the reader. The
framework claims you never need to know anything about building codes to use it.*

---

## 4. Where the framework was ignored, worked around, or deviated from

**This is the most important section.** *No pilot follows a framework exactly.
A report claiming otherwise is describing a demonstration, not a pilot.*

| Requirement | What happened instead | Why | Would you delete the requirement? |
|:--|:--|:--|:--|
| | | | |

**Builds abandoned at or before intake:** *Count, and the reason if known. This is
the failure mode that does not announce itself.*

**Capabilities that reached production without going through intake:** *Count. If
you did not look, say so.*

---

## 5. Against the stated failure conditions

*The protocol names five results that would count as the framework failing.
Answer each directly.*

| Condition | Occurred? | Detail |
|:--|:--|:--|
| Builders routed around it | | |
| Reviewer effort more than roughly double the estimates | | |
| H4 caught nothing across all archetypes | | |
| Nobody consumed a certified component | | |
| Every Tier 3 capability excepted the same requirement | | |

---

## 6. What you would change in the model

*Keyed to requirement numbers, in the form the
[amendments template](amendments-template.md) uses, so a change can be adopted by
somebody else. Separate the three cases: delete, amend, and add. The framework
holds additions to a higher bar than deletions, and a proposed addition needs to
name the failure it prevents or it will not ship.*

| Requirement | Delete, amend, or add | Proposed text or rationale | Failure it prevents |
|:--|:--|:--|:--|
| | | | |

---

## 7. Numbers you can offer as replacements for the invented ones

*Several figures in the model are explicitly design judgments with no evidence
behind them. If your pilot produced real ones, they are worth more than the
originals.*

| Figure | Model's value | Yours | Basis |
|:--|:--|:--|:--|
| Tier 2 design review turnaround | 3 working days | | |
| Tier 3 design review turnaround | 10 working days | | |
| Temporary production approval window | 90 days | | |
| Authorization lapse with no verification point passed | 180 days | | |
| Work must begin within | 60 days | | |
| Certification surveillance interval | *No model default* | | |
| Third-party re-check interval | *No model default* | | |

---

## 8. Would you adopt it, and what would you tell the next institution

*Two or three paragraphs. Plain assessment. If the answer is no, that is a
publishable result and the framework's authors would rather have it than not.*
