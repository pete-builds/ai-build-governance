---
title: "Appendix E: Functional Capability Taxonomy"
parent: "Technical and Evidence References"
nav_order: 5
---

**Non-binding, and deliberately not a classification axis.** Tiers are set by
[chapter 03](../model/03-classification.md) against data, autonomy, blast
radius, audience, and use. This appendix asks a different question, which the
triggers do not ask: **what does the thing functionally do?**

It exists for two jobs. It gives a platform team vocabulary for talking about a
portfolio, which "Tier 2" does not. And it is a **cross-check**: if a
capability's function usually carries a risk its classification did not pick
up, that is a prompt to look again at the classification rather than a reason
to change it.

> **This never overrides a trigger.** Same rule as
> [requirement 11.2](../model/11-certified-components.md): a second lens can
> raise a question, never lower a tier. If the function suggests low risk and a
> trigger says Tier 3, it is Tier 3.

---

## The six functions

Most real capabilities combine several. The combination is usually where the
risk is.

| Function | What it does | The trigger it most often activates | Where to look hardest |
|:--|:--|:--|:--|
| **Creation** | Generates net-new output: content, code, documentation, artifacts that did not exist | Audience, where output reaches people | Accessibility ([guide 04](../guide/04-accessibility.md)). Generated output is subject to the standard, and fails it by default. |
| **Curation** | Improves quality, organization, or relevance of existing material: dedupe, flag stale, find inconsistency | Data classes, since it reads broadly by design | Access-control alignment. It typically reads more than any single user may see. |
| **Clarification** | Helps someone find, understand, navigate, summarize, or translate existing content | Usually the mildest. Often genuinely Tier 1. | Whether "summarize" quietly became "answer," which is a purpose change under [chapter 08](../model/08-alterations.md). |
| **Cognition** | Finds patterns, anomalies, or hidden signal; forecasts; scores | **Consequential decisions.** This is the function most likely to inform a decision about a person. | Whether output is advisory or determinative, and the human override rate required by [requirement 6.9](../model/06-inspections.md). |
| **Communication** | Acts as the conversational interface between people and systems | Untrusted content, plus audience | The trifecta. A chat surface over institutional data with any external reach is the canonical three-leg case. |
| **Coordination** | Autonomously executes, orchestrates, or triggers action across systems in response to events | **Autonomy and blast radius.** Highest by default. | [Chapter 12](../model/12-delegated-authority.md) delegated authority, and H4 pre-concealment. Scheduled execution means no human is present when it runs. |

## How to use it in ten seconds

Name the functions a capability performs, then check:

1. **Coordination present?** Expect autonomy and blast-radius triggers, and
   expect [chapter 12](../model/12-delegated-authority.md) to apply. A
   capability that executes across systems and classified below Tier 2 has
   probably been under-classified.
2. **Communication plus Curation?** That is broad read access joined to an
   interface that takes untrusted input. Check the third leg before assuming
   Tier 2.
3. **Cognition informing anything about a person?** The consequential-decision
   trigger applies whether or not a human nominally decides, and "advisory"
   needs the override rate measured to stay true.
4. **Creation reaching an audience?** Accessibility is in scope and is not
   optional.
5. **Only Clarification?** Genuinely often Tier 1. Say so and move on. Most of
   the value of a taxonomy is permission to go fast on the easy cases.

## What this appendix will not give you

A risk matrix scoring each function against each risk. The source below
publishes one, and it is asserted without a stated method: no measurement, no
sample, no derivation. Reproducing it here would give a reader numbers to cite
that nothing supports, which is the specific failure this repository's
`UNVERIFIED` labels exist to prevent.

The qualitative column above is our own and is design judgment. It is
defensible because each entry points at a mechanism you can go and read, not
because anyone measured it.

## Sources and confidence

> **VERIFICATION NOTE** (2026-08-05)
> The six function names and their one-line definitions are from the
> *ITIL AI Governance* white paper (PeopleCert, v1.0, November 2025), which
> presents them as a functional classification of AI applications. The
> definitions are theirs; the trigger mapping, the ten-second procedure, and
> the "never overrides a trigger" rule are ours.

> **DESIGN JUDGMENT**
> That function predicts risk shape is plausible and unmeasured. The mapping
> from function to trigger is reasoned from what each function must do to work,
> not from incident data.

> **UNVERIFIED**
> No evidence was located that six is the right number of functions, that these
> six are exhaustive, or that classifying by function improves any governance
> outcome. Treated here as vocabulary and as a prompt to re-check, which is all
> it is claimed to be.
