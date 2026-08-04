# The AI Building Code

**A governance model for how AI capabilities get built at a university.**

Most institutional AI governance answers the question *may I use this?*
This one answers a different question: *how does something get built,
and how does it earn the right to run in production?*

That gap is real. Policy bodies and ethics councils exist at most
institutions now. What is usually missing is the operational layer
underneath them: the equivalent of a building department. Somebody has
to review the drawings, inspect the work at defined points, and decide
whether the thing can be occupied. Without that layer, a policy is a
document people have read.

---

## Why construction

Because the built environment solved this problem, at scale, for
public safety, across thousands of independent jurisdictions, without
central command authority. That last part matters enormously for
universities.

The construction analogy is not decoration here. It supplies a set of
mechanisms that already work:

| Construction | What it gives us |
|---|---|
| **Model code adopted with local amendments** | Authorship separated from authority. The ICC writes the code; a jurisdiction adopts and amends it. Nobody is forced, and yet almost everyone adopts, because writing your own from scratch is worse. |
| **Statement of need before design** | You justify the building before you draw it. Kills solution-first building. |
| **Plan review** | Someone who is not the designer reads the design against the requirement. |
| **Inspections at hold points** | Verification happens while the work is still visible, not after. |
| **The do-not-conceal rule** | You may not cover up work before it is inspected. This single rule is the most useful idea in the whole analogy. |
| **Certificate of occupancy** | Being finished and being allowed to operate are different events. |
| **Temporary certificate of occupancy** | Time-boxed, expiring permission. The honest form of "pilot." |
| **Record drawings** | What was actually built, not what was drawn. |
| **The stamp** | A named person takes professional responsibility. |
| **Special inspection** | For high-consequence work, an independent inspector paid by the owner, not the builder. |
| **Existing buildings provisions** | Legacy work is grandfathered until you alter it. A workable amnesty for the sprawl you already have. |

Read [appendix D](appendix/d-glossary.md) for the full term-by-term
mapping, including where the analogy breaks down. It does break down in
places, and the appendix says where rather than pretending otherwise.

---

## The one thing this model refuses to do

**It will not put a review board in front of your deploys.**

The evidence on that is not ambiguous. DORA's published research on
change approval states that external approval approaches "have a
negative impact on software delivery performance," and that "no
evidence was found to support the hypothesis that a more formal,
external review process was associated with lower change fail rates"
([DORA](https://dora.dev/capabilities/streamlining-change-approval/)).
It also names the trap institutions fall into after an incident: adding
process "will make things worse because this drives up lead times and
batch sizes, creating a vicious cycle."

But read the nuance, because it is the whole design constraint. DORA is
not saying review is useless. It endorses **peer review at check-in
plus automation** as the substitute, and reframes the review body "from
gatekeeper to process architect and information beacon." So this model:

- puts **automated** gates on everything countable
- puts **peer** review close to the work
- reserves **independent** review for genuinely high-consequence builds
- and gates on **irreversibility**, not on ceremony

If you adopt this and it turns into a queue in front of a committee,
you have implemented the thing it was written to prevent.

---

## How it works, end to end

```
  STATEMENT OF NEED          Who needs this, what breaks if we
   (the owner's "what")      don't build it, what "done" means.
          |                  Signed by someone other than the builder.
          v
  CLASSIFICATION             Objective triggers set the permit tier.
   (occupancy type)          Not reviewer mood.
          |
          v
  PLAN REVIEW                The design (the "how") is read against
   (design vs. need)         the need. Timeboxed. By a peer.
          |
          v
  PERMIT                     Authorization to build, with conditions,
   (Tier 1 / 2 / 3)          and an expiry date.
          |
          v
  INSPECTIONS                Hold points while work is still visible.
   (hold points)             Mostly automated. Nothing gets concealed
          |                  before its inspection.
          v
  CERTIFICATE OF             Permission to operate. Separate event
  OCCUPANCY                  from "it works on my machine."
   (or a time-boxed TCO)
          |
          v
  RECORD DRAWINGS            What actually exists, in a registry,
   (as-builts)               with a named owner and a review date.
          |
          v
  ALTERATIONS                Changes re-enter at the right stage.
                             Legacy work complies when altered.
```

The chapters:

| # | Chapter | What it settles |
|---|---|---|
| 01 | [Principles](docs/01-principles.md) | The seven rules everything else derives from |
| 02 | [Statement of Need](docs/02-statement-of-need.md) | Intake, and refusing to build the wrong thing |
| 03 | [Classification](docs/03-classification.md) | Objective tier triggers, including the lethal trifecta |
| 04 | [Plan Review](docs/04-plan-review.md) | Reading the design against the need |
| 05 | [Permits](docs/05-permits.md) | What each tier authorizes, and permit expiry |
| 06 | [Inspections](docs/06-inspections.md) | The five hold points and the do-not-conceal rule |
| 07 | [Occupancy and Records](docs/07-occupancy-and-records.md) | Production release, TCOs, and the registry |
| 08 | [Alterations and Existing Work](docs/08-alterations.md) | Change control, and the legacy retrofit path |
| 09 | [Roles](docs/09-roles.md) | Who stamps, who inspects, and the graduating-student problem |

The templates in [`templates/`](templates/) are the actual paperwork:
need statement, plan review, three inspection checklists (MCP server,
automation workflow, gateway key), an ADR, and a certificate of
occupancy.

---

## Appendices, and why they matter more than the chapters

- **[A: Framework crosswalk](appendix/a-framework-crosswalk.md)** maps
  every gate to NIST AI RMF functions, ISO/IEC 42001, EU AI Act tiers,
  and current OMB guidance, so you can answer "which control is this"
  when audit asks.
- **[B: Platform controls](appendix/b-platform-controls.md)** is the
  honest inventory of what LiteLLM, n8n, and MCP **actually enforce**
  versus what depends on a human. Read this one first if you read only
  one thing. It is the reason several chapters are shaped the way they
  are.
- **[C: Evidence on gates](appendix/c-evidence-on-gates.md)** collects
  what is actually known about whether governance gates help, including
  where the evidence is contested and where this model is making a
  judgment call rather than following data.
- **[D: Glossary](appendix/d-glossary.md)** term mapping, and the
  limits of the analogy.

---

## Adopting this

Adopt it the way a jurisdiction adopts a model code: **take it, amend
it, and publish your amendments.** Do not fork it silently and do not
adopt it wholesale without reading it.

1. **Name your Authority Having Jurisdiction.** In construction, AHJ is
   defined by function rather than job title, precisely because local
   structures differ. Decide who actually has authority to say no, and
   write the name down. If nobody does, this model will not save you.
2. **Map the tiers to your own data classification.** Chapter 03 gives
   triggers, not your institution's risk labels. Substitute yours.
3. **Delete what you cannot enforce.** A documented control your
   platform does not implement and your people will not perform is
   worse than an acknowledged gap, because it produces false assurance.
   Appendix B exists to help you tell the difference.
4. **Start with inspections, not with intake.** The fastest value is in
   the automated hold points on what you are already running. Intake
   discipline is slower to pay off and easier to resent.
5. **Publish your amendments** where your builders will actually read
   them.

A worked example of steps 1 through 3 for a self-hosted LiteLLM, n8n,
and MCP stack is in
[appendix A](appendix/a-framework-crosswalk.md#worked-example).

---

## Scope, and honest limits

**In scope:** capabilities an institution builds or assembles itself.
MCP servers and the tools they expose, automation and agent workflows,
gateway key and budget issuance, retrieval systems over institutional
data, and AI-assisted development of any of the above.

**Out of scope:** classroom and academic-integrity policy, procurement
of finished commercial products, research methodology, and anything
touching faculty academic freedom in teaching or research. Those are
governed elsewhere, by bodies with actual standing to govern them, and
a build-governance document that wanders into them will be correctly
ignored.

**What this model cannot do:** make an institution compliant with
anything. It is a structure for making and recording decisions. Your
counsel, your security office, and your privacy office decide what the
law requires. Where the law is specifically implicated, this document
points at the citation and stops. See for instance the FERPA discussion
in chapter 03, which names
[34 CFR 99.31(a)(1)](https://www.law.cornell.edu/cfr/text/34/99.31) and
then explicitly defers.

**Evidence quality:** citations throughout are to primary sources where
they could be fetched and verified. Where a claim rests on secondary
reporting, or where a document could not be retrieved, the text says so
in place rather than in a footnote. Several framework details are
marked unverified for exactly that reason. That is deliberate: a
governance model that fakes precision about the standards it maps to
has no business asking anyone else for rigor.

---

## License

[CC BY 4.0](LICENSE). Adopt it, amend it, say where it came from.

Contributions welcome, especially amendments from practice and
corrections to the borrowed source material. See
[CONTRIBUTING.md](CONTRIBUTING.md).
