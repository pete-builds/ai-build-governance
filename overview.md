---
title: Executive summary
nav_order: 2
---

# Executive summary

**The whole argument, including the parts that count against it.** If you are
deciding whether the framework is worth your time, read this rather than the
chapters. The paragraph below is the short version.

---

**In short.** Universities set AI policy and have nothing underneath it that turns
policy into a decision anyone can make on a Tuesday, so everything between
"someone has an idea" and "it is running in production affecting real people" gets
decided ad hoc or not at all. This supplies that layer: thirteen chapters of
numbered requirements an institution adopts and amends for itself, built to one
rule, that **gates belong where an action becomes hard to reverse rather than
where a project hits a milestone**. Three risk tiers, five verification points,
and a reuse path that gets faster the more the institution governs. Free under
CC BY 4.0, no vendor dependency, and nobody has piloted it.

---

## The problem it addresses

AI capabilities are increasingly built by people who have never been near a
software delivery organization. A staff member wires together an automation on a
low-code platform. A department ships an agent it built with AI coding tools. A
program office issues a gateway credential with a budget attached. Each of those
is a production change, made by someone who never encountered a change process,
against data that belongs to students and employees.

The platforms underneath do not reliably supply the boundary people assume is
there. On n8n specifically, verified against its own documentation, **edit access
to a workflow is production change authority**: there is no separate publish
step, and a settings-only change republishes automatically. Editors also acquire
the practical use of credentials that were never shared with them. That is a
finding about n8n at a date, not a claim about low-code platforms generally, and
the point is that nobody had checked. Whatever your stack does, the honest first
move is to find out, then write down only what it actually enforces.

## Why the obvious answer makes it worse

The reflex, especially after an incident, is a review board that sits in front of
deployment. The published evidence says that backfires.

DORA's research on change approval finds that external approval approaches "have
a negative impact on software delivery performance," and that "no evidence was
found to support the hypothesis that a more formal, external review process was
associated with lower change fail rates"
([DORA](https://dora.dev/capabilities/streamlining-change-approval/)). It also
names the trap directly: adding process "will make things worse because this
drives up lead times and batch sizes, creating a vicious cycle."

Read the nuance, because it is the design constraint rather than a license to
skip review. DORA does not say review is useless. It endorses **peer review at
check-in plus automation** as the substitute, and reframes the review body "from
gatekeeper to process architect and information beacon."

That settles the shape: automated checks on everything countable, peer review
close to the work, independent review reserved for genuinely high-consequence
builds, and gates placed at irreversibility rather than at ceremony. If adopting
this produces a new standing committee, it has been implemented backwards.

## Where the mechanisms came from

Four mechanisms here are adapted from how the built environment governs
construction: a model code adopted with local amendments, verification before work
is concealed, approval to occupy as an act distinct from completion, and
certification of reusable products. That domain solved this exact problem at
scale, for public safety, across thousands of independent jurisdictions, **without
central command authority**. That last part is why it fits universities, which
cannot mandate compliance on a decentralized campus.

The chapters themselves use plain AI-governance language, and the
[glossary](reference/glossary.md) carries the mapping and the four places the
analogy breaks down. **You never need to know anything about building codes to use
this framework.** What that claim does not cover: the chapters assume a reader
comfortable with normative standards language, and
[how to read this](model/00-conventions.md) says so plainly.

## What it does instead

**It asks about reuse first.** If a component has already been certified and
fits your case, you confirm the certification and inspect only your integration.
That is the shortest route through the framework and the only one that gets
faster the more the institution governs. If reuse is harder than rebuilding
where you work, nothing else here will save you.

**Classification is mechanical, not a judgment call.** Six stated triggers,
worked in order, highest wins, and never lowered because most answers came back
low. The forcing rule is the combination of private data, untrusted content, and
the ability to communicate externally. All three together is the top tier, and
the usual remedy is to remove one of the three rather than to add review.

**Three tiers, and most work lands in the lowest two.** Tier 1 is self-certified
with automated checks. Tier 2 is timeboxed peer review with one human
verification point. Tier 3, reserved for genuinely consequential builds, gets an
independent reviewer and sign-off from the office that can say no.

**Verification happens at five points, and one of them carries the weight.**
Identity, connections, the end-to-end path, then **pre-concealment**, which is
the check that runs before behavior disappears behind an interface, a schedule,
or a removed confirmation step. That is the gate the framework would keep if it
could keep only one. The last point requires rollback to have been exercised
rather than documented.

**Evidence is the completed artifact, never a description of one.** A statement
of need, a design review, an authorization with an expiry, inspection records, a
production approval, and a record of what is actually running.

The tables for all of this are on one page in the
[quick reference](quick-ref.md). The whole thing worked end to end on a single
system is in the [running example](guide/02-running-example.md), which is the
fastest way to see how the pieces connect.

## What adopting it costs

1. **Name your Final Decision Authority.** The office that can say no and be
   obeyed. If no such office exists, that is the finding, and this framework
   cannot substitute for it.
2. **Establish which governance pattern you already are.** Directive, Guided,
   Federated, or Autonomous. Each fails at adopting this differently, and
   [adoption](guide/01-adoption.md) names the failure signal for each. Federated
   institutions should take certification early rather than last.
3. **Map the tiers to your own data classification.** Every
   `LOCAL AMENDMENT REQUIRED` label marks a decision deliberately left to you.
4. **Delete what you cannot enforce.** A documented control your platform does
   not implement is worse than an acknowledged gap, because it stops people
   looking.
5. **Start with verification, not intake.** Automated checks on what you already
   run pay off fastest and are least resented. Intake first reads as a new form.
6. **Publish the five numbers** in
   [requirement 1.9](model/01-principles.md). They are what would tell anyone,
   including you, whether this is working rather than merely running. Nobody has
   published them yet.

The recurring cost is the part most likely to be underestimated. Certifications
carry surveillance intervals and expiry dates, and third-party dependencies
carry re-check intervals. Both are real staffing, and both **fail silently**
rather than visibly when they lapse. An institution that cannot staff them
should say so and set its tier ceilings accordingly.

## What it refuses to do

- **It will not put a review board in front of your deploys.** A recurring
  inspection meeting is a change advisory board that has not admitted it yet.
- **It will not document a control your platform does not enforce.**
- **It will not let a certification lower a tier.** Certification reduces
  component review. Classification always runs in full against your instance.
- **It will not let a missed deadline produce a compliance determination.** An
  expired review turnaround can grant permission to proceed. Accessibility
  conformance and lawful-basis findings are never deemed.
- **It will not make you compliant with anything.** Where law applies, it cites
  the provision and stops.

## What is not known

Stated here rather than buried, because the framework asks the same of anyone
adopting it.

**Nobody has run this.** It is a design hypothesis with a documented argument.
Adoption reports, turnaround performance, exception rates, and failure cases are
the most valuable contribution anyone could make. Whether governance of this kind
reduces actual harm is unmeasured by anyone, not just here.

**Some claims are unverified and labelled as such.** ISO/IEC 42001's control
structure is paywalled, and several construction primary sources would not load,
which is why the chapters borrowing that vocabulary carry `UNVERIFIED` labels.
[Appendix C](reference/evidence-on-gates.md) lists every place the framework
reasons rather than measures. Start there if you are deciding whether this is any
good.

**Every specific number is a design judgment.** Turnaround times, expiry
intervals, review cadences. Change them freely. They are not load-bearing.

**Certification is the most gameable mechanism here.** One granted casually and
never surveilled would be worse than the queue it replaces.
[Chapter 11](model/11-certified-components.md) says so itself.

---

## Where to go next

The [home page](index.md) routes by what you are trying to do. The
[running example](guide/02-running-example.md) is the fastest orientation for
anyone building. The requirements themselves are the
[core governance model](model/), and reading only Purpose and Requirement across
the thirteen chapters is a supported way through.
