# 12. Listed Components and Type Approval

**The problem this chapter exists for.** A group builds something good.
Another group wants to use it. Under every governance model described so
far, the second group enters the process at the beginning and the
component gets reviewed again, by different people, against the same
standard, reaching the same conclusion. Multiply by the number of groups
and the number of components, and governance becomes a relay of queues.

That is the failure people actually experience. It is worse than a bad
gate, because it punishes reuse specifically, and reuse is the thing you
most want.

Construction solved this, and the solution is the most valuable idea in
the whole analogy.

---

## How the built environment handles it

Nobody re-tests a fire-rated door assembly in every building. The
assembly was tested once, against a published standard, by an
organization competent to test it, and it carries a mark. A building
official does not repeat the test. They confirm the mark, confirm the
installation matches the terms the certification was issued under, and
move on.

The mechanism that makes this credible has four parts, and the fourth is
the one that gets dropped:

1. **Published criteria** to test against
2. **Testing** by a party competent and independent
3. **A report or mark** that states the *scope* of what was certified
4. **Ongoing surveillance**, so the certification keeps meaning something

**ICC Evaluation Service** is a verified example of the full pattern for
novel products, where the code itself is silent. ICC-ES develops
Acceptance Criteria, tests products against them, issues an **Evaluation
Report (ESR)** that building departments rely on, and conducts ongoing
inspection and surveillance
([ICC-ES](https://icc-es.org/)).

That last part is why an ESR is not a rubber stamp. A certification with
no surveillance decays into a historical claim.

`UNVERIFIED`, and worth flagging because the analogy leans on them: the
IBC's verbatim definitions of **listed**, **labeled**, and **approved
agency**; the precise rule that a building official accepts a listing
without retesting and inspects only the installation; and the practice
in many US states of approving a modular or factory-built design once at
state level so local jurisdictions accept the factory-built portion
without re-inspecting closed work. These are described here as commonly
understood industry practice. Primary sources could not be retrieved, so
treat the *shape* as sound and the *details* as unconfirmed.

---

## The rule

**A component is inspected once, against published criteria, by someone
competent and independent. After that, consumers inherit the
certification and only the integration is inspected.**

This is the anti-queue mechanism. It is what turns governance from a toll
booth into a supply of trusted parts.

### What can be listed

Anything reusable with a stable interface and a definable scope:

- An MCP server and its tools
- A retrieval index over a defined corpus
- An Agent Studio subworkflow or template
- A prompt or agent scaffold with known behavior
- A gateway key pattern with a fixed configuration
- A validated dataset or feature view
- An authentication or authorization pattern

### What a listing must state

A listing is only as useful as its **scope of certification**. A mark
that says "approved" without saying approved *for what* is worse than
nothing, because it invites use outside the conditions it was tested
under.

| Field | Why |
|---|---|
| Identifier and version | Listings attach to versions, never to "latest" |
| **Scope of certification** | What it was tested to do, in plain language |
| **Tier ceiling** | The highest permit tier this listing supports. A consumer at a higher tier does not inherit it. |
| Data classes permitted | What it was certified to handle |
| Tools and egress | Everything it can reach, from its own inspection |
| Tested configuration | The exact configuration certified, including versions |
| **Conditions of use** | What a consumer must do for the listing to apply |
| **Exclusions** | What it was explicitly *not* certified for |
| Certifying party | Who listed it. Not the builder. |
| Inspection record | Which inspections it passed, and when |
| **Surveillance interval and next review** | When it stops being trusted |
| **Expiry** | Listings expire. See below. |

### Consuming a listed component

This is the part that saves the time:

- [ ] The listing exists, is current, and has not expired
- [ ] The **version** you are consuming is the listed version
- [ ] Your use is **within the scope of certification** and violates no
      stated exclusion
- [ ] Your tier does not exceed the listing's tier ceiling
- [ ] Your data classes are within those the listing permits
- [ ] You have met every stated condition of use
- [ ] **You inspect your integration**, not the component

That last line is the whole point. You inspect the wiring, the
credentials you supply, the data you send, and what you do with what
comes back. You do not re-review the component's internals.

**Installing outside the listed terms voids reliance on the listing.**
Borrowed directly, and it is the discipline that keeps this honest. If
you use a listed component with a broader credential than the listing
assumed, in a higher tier than its ceiling, on data classes it excludes,
or at an unlisted version, you are not consuming a listed component. You
are consuming an unreviewed one, and the full path applies.

---

## The worked example

Take the case this chapter was written for. One group builds a tool over
compensation data, validates it thoroughly, and it works.

**Without listing:** every other group that wants it re-enters intake.
Each review re-examines the same tool. The originating group fields the
same questions repeatedly. Adoption is slower than rebuilding, so people
rebuild, and now there are four unreviewed copies.

**With listing:**

1. The originating group's build goes through the normal path once and
   passes its inspections.
2. The AHJ, or a designated certifying function, **lists** it: scope of
   certification is "read-only aggregate compensation analysis over the
   defined corpus," tier ceiling 3, data classes named, exclusions stated
   explicitly, for instance no individual-level output and no use in
   compensation *decisions* about identifiable people, which would land
   in chapter 03's consequential-decisions trigger.
3. Surveillance interval set, say quarterly, with a named owner.
4. A second group builds an application that consumes it. Their
   Statement of Need still records the need. Their plan review covers
   **their** integration: what credential they pass, what they display,
   who sees it, what happens when it is wrong.
5. They do not re-review the tool. They cite the listing.

The second group's path shortens from a full review to an integration
review. The originating group stops being an unpaid help desk. And
critically, **the institution now knows how many things depend on that
component**, which it did not know before, because the listing is
referenced rather than copied.

That last consequence is the one people miss. Listing produces a
dependency graph as a byproduct.

---

## Who may list

**Not the builder.** A component certified by the people who made it is a
self-assessment, and the whole value here is that a consumer can rely on
someone else's judgment.

Listing authority sits with the AHJ, or with a certifying function the
AHJ designates. The construction parallel is exact: independent
inspection is engaged by the owner rather than the contractor, so the
certifier is not paid by the party being certified.

For Tier 3 listings, the certifying reviewer must be independent of the
originating team, per [chapter 09](09-roles.md).

---

## Surveillance, and why listings expire

A listing with no surveillance becomes a historical claim that people
treat as a current fact. This is the failure mode to design against,
because it is comfortable and invisible.

| Listing tier ceiling | Surveillance interval | Listing expiry |
|---|---|---|
| 1 | Annual | 24 months |
| 2 | 6 months | 18 months |
| 3 | Quarterly | 12 months |

Surveillance re-checks the five things most likely to have decayed:

1. Is the listed version still the version in use?
2. Have its dependencies acquired published vulnerabilities?
3. Have its tool definitions or interface changed? For MCP components,
   drift in a tool description after certification is the rug pull from
   [chapter 06](06-inspections.md), and it invalidates the listing
   immediately.
4. Is the originating owner still present?
5. Has the model or platform underneath it changed behavior?

**When a listing lapses or is revoked, every consumer is notified.** This
requires knowing who the consumers are, which is why consumption is
recorded in the registry rather than being informal. A revoked listing
with unknown consumers is an incident you cannot execute.

---

## Type approval for patterns

The stronger form, borrowed from how a factory-built design is approved
once rather than per site.

Where an institution has a pattern that recurs, certify the **pattern**
and let conforming instances self-certify:

- A standard retrieval-over-approved-corpus pattern
- A standard read-only MCP server over an internal API
- A standard summarize-and-route Agent Studio workflow

### Certification and classification are two different axes

**This is the most important rule in the chapter, and an earlier edition
of this model got it wrong.** That edition said a conforming instance
enters at Tier 1 regardless of what its triggers would otherwise imply.
That was a loophole, and it contradicted [chapter 03](03-classification.md)'s
highest-wins rule directly. A certified scaffold could have carried
student records, informed employment decisions, or held all three legs of
the lethal trifecta, and still entered at Tier 1 because the scaffold had
a certificate.

The two things being judged are not the same thing:

| Axis | Question | Reduced by certification? |
|---|---|---|
| **Component risk** | Is this thing built soundly? | **Yes.** That is what a listing is for. |
| **Use risk** | What will this instance touch, decide, and affect? | **No. Never.** |

So the corrected rule:

> A conforming instance **inherits the pattern's component-level findings
> and skips repeated component review.** Classification still runs in
> full against that instance's data classes, autonomy, blast radius, and
> intended use. **Certification never lowers a tier.**

What this actually saves is large and is the point: no re-review of the
component's internals, transport, auth model, tool definitions, or
dependency posture. What it does not save, and must not, is the tier
assessment of what you are pointing it at.

A worked contrast. A type-approved read-only MCP server over an internal
API is pointed at two different corpora:

- Over a **public course catalog**, serving one unit: Tier 1 or 2 on its
  own triggers, component review skipped. Fast.
- Over **student records**, staff-facing: **Tier 3** on data
  classification, component review still skipped. The plan review covers
  the corpus, the access model, and who sees what, not the server.

Same certified component. Different tiers. Correctly.

Departure from the pattern means the pattern does not apply, and full
component review resumes on top of normal classification.

This is still the paved road from [chapter 01](01-principles.md) with a
certificate attached, and it is still the most direct route to governance
that speeds work up. The scaffold is an approved *component*. It is never
an approved *use*.

---

## Honest accounting

**Verified:** ICC-ES issues Evaluation Reports that building departments
rely on, developed against Acceptance Criteria where the code is silent,
with ongoing inspection and surveillance.

**Unverified, described as industry practice:** the IBC definitions of
listed, labeled, and approved agency; the rule that officials accept a
listing and inspect only installation; state-level modular type approval.

**Design judgment, not findings:** every interval and expiry number in
this chapter, the tier-ceiling concept, the void-on-departure rule, and
the claim that type-approved patterns should enter at Tier 1. None of
this is measured. It is reasoned from how certification works in a domain
that has run it for decades.

**The risk in this chapter, stated plainly:** listing is the most
gameable mechanism in this model. A listing granted casually, never
surveilled, and cited widely is a single point of institutional trust
with nobody looking at it, and it would be worse than the queue it
replaced. If you adopt one thing from this chapter, adopt the
surveillance interval and the expiry date. They are what make the rest
safe.
