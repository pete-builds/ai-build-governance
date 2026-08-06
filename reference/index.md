---
title: "Technical and Evidence References"
nav_order: 8
has_children: true
---

# Technical and Evidence References

**Non-binding, and the most volatile material here.** Vendor findings, legal
references, framework crosswalks, the evidence behind the design, and the open
questions nobody has answered.

**Check dates before relying on anything in this layer.** The
[source ledger](https://github.com/pete-builds/ai-build-governance/blob/main/SOURCES.md)
groups every citation by how fast it decays and records when each was retrieved
and when it needs re-checking. Protocol revisions and vendor documentation move
fast enough to invalidate an inspection checklist within months.

Platform profiles are **findings about one product at one date.** They do not
generalize to the product category.

Two appendices here are lenses rather than evidence, and both are explicitly
subordinate to the model. [Appendix A](framework-crosswalk.md) maps this
framework onto NIST AI RMF, ISO/IEC 42001, ISO/IEC 38500, the EU AI Act, and
OMB guidance, marking verification status per claim.
[Appendix E](capability-taxonomy.md) classifies capabilities by what they
functionally do, as a **cross-check** on tier classification that can raise a
question and never lower a tier.

The [**requirement index**](requirement-index.md) lists all 131 numbered
requirements with a link to each. It is generated from the chapters, so it
cannot fall out of step with them. Use it when you have a number and need the
provision, which is the situation anyone amending this framework is in.
[**Machine-readable requirements and a reference gate**](enforcement.md) covers
the same index as JSON, plus a working CI gate, and is explicit about the narrow
scope of what that gate can actually enforce.

[**How this compares**](comparison.md) positions this framework against NIST AI
RMF, Stanford's and UC's artifacts, and the current agent-governance literature,
naming where each of them is genuinely stronger. It marks verification status per
claim, because two of the most frequently cited artifacts in this space could not
be fully verified from primary sources.

This layer also keeps the construction vocabulary, because it is where the
analogy is explained rather than used. The [glossary](glossary.md) has the
two-way mapping and the four places the analogy breaks down.
