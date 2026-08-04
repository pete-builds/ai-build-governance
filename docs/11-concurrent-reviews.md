# 11. Concurrent Reviews: Accessibility, Security, Privacy

Building plan review is not one person reading one drawing. A submittal
goes to several disciplines at once: building, structural, fire,
mechanical, electrical, plumbing, and **accessibility**. Each reviews
against its own published standard. They review **in parallel**, and the
permit issues when all of them clear.

Two properties of that arrangement matter here, and the second is the one
institutions get wrong.

**Each discipline checks against a published standard, not a preference.**
The accessibility reviewer is not offering an opinion about whether the
door is wide enough. There is a number.

**The disciplines run concurrently, not in a relay.** A submittal does not
sit in the fire marshal's queue waiting for the structural reviewer to
finish. This is the answer to the most common complaint about
institutional review, which is not that review happens but that it
happens *serially* across groups, each starting only when the last
finished.

So: **accessibility, security, and privacy review concurrently with plan
review, against published standards, on the same clock.** Not after. Not
in sequence. Not each in its own queue.

---

## Accessibility

This is the one most likely to be missing entirely from an AI governance
model, and it is the one with a statutory deadline attached.

### The obligation, stated precisely

For **public** universities in the United States, the Department of
Justice's ADA Title II rule sets a technical standard for web content and
mobile apps. Amending 28 CFR Part 35, the standard is **WCAG 2.1
Level AA** ([ADA.gov](https://www.ada.gov/resources/2024-03-08-web-rule/)).

**The compliance dates moved.** The final rule was published 2024-04-24,
but an interim final rule published 2026-04-20 extended the deadlines. The
dates currently in force are:

| Entity size | Compliance date |
|---|---|
| Population of 50,000 or more | **2027-04-26** |
| Population under 50,000, and special district governments | **2028-04-26** |

Note two things that catch people out. The standard is WCAG **2.1** AA,
even though the current W3C Recommendation is **WCAG 2.2** (published
2023-10-05, updated 2024-12-12, with conformance levels A, AA, and AAA;
WCAG 2.2 is also ISO/IEC 40500:2025)
([W3C WAI](https://www.w3.org/WAI/standards-guidelines/wcag/)). The rule
froze on 2.1 AA, so conforming to 2.2 satisfies it but the obligation is
2.1 AA.

And **private universities are not covered by this rule.** They fall under
ADA Title III as public accommodations, a different legal posture. If you
are a private institution, do not adopt these dates as your deadline;
find out what actually applies to you.

Separately, **Section 508** (29 U.S.C. §794d) binds federal agencies'
procurement and use of ICT under the Revised 508 Standards, effective
2018-01-18, which reference WCAG 2.0
([Section508.gov](https://www.section508.gov/manage/laws-and-policies/)).
`UNVERIFIED`: the mechanism by which Section 504 extends obligations to
universities as recipients of federal funding. It is standard law, but no
primary source was fetched for it here, so confirm with counsel rather
than citing this document.

The rule names exceptions, including archived content, preexisting
conventional electronic documents not used to apply for or access
services, third-party content the entity did not post, individualized
password-protected documents, and preexisting social media posts. Note the
important limit: **an exception covering the format does not remove the
underlying ADA duties** of effective communication and reasonable
modification.

**This model does not interpret any of that for you.** Your accessibility
office and counsel decide what applies. What this model does is make sure
the question is asked at plan review rather than discovered after launch,
and that the answer is recorded.

### Why AI systems fail accessibility by default

Worth stating plainly, because "it's just an API" is the usual reason this
gets skipped:

- **Generated interfaces** are frequently produced without labels,
  landmarks, or a keyboard path. AI coding tools produce plausible markup
  that is not necessarily accessible markup.
- **Streaming output** can break assistive technology, which may not be
  notified that content changed, or may be interrupted continuously.
- **Generated images** ship without alternative text, and an AI-generated
  alt text that describes the wrong thing is worse than none.
- **Status by color alone** is a common default in generated dashboards.
- **Chat interfaces** are unusually hard to get right: focus management,
  announcing new messages, and navigating long transcripts.
- **Generated documents**, especially PDFs, are usually untagged.
- **Time-limited interactions** and unannounced dynamic updates.

The point that makes this a governance concern rather than a QA concern:
**if an agent produces content for users, it is producing content subject
to the standard.** An accessible wrapper around an inaccessible generated
artifact does not comply.

### Where it is checked

| Hold point | Accessibility check |
|---|---|
| Plan review | Does this have a user interface or produce user-facing content? If yes, accessibility review is engaged **now**, concurrently. |
| H3 Framing | Automated checks in the pipeline: labels, contrast, keyboard path, heading structure |
| H4 Concealment | Manual check of the paths automated tooling cannot see: screen reader on the primary task, keyboard-only completion |
| H5 Final | Conformance statement recorded; known gaps on the punch list with owners and dates |

Automated tooling catches a minority of WCAG failures. It is worth
running, and it is not sufficient. The manual check at H4 is the real one.

**Recording helps, and it does not cure.** A capability with known,
documented accessibility gaps and a remediation plan is far better
managed, and it gives the institution something to act on. But be precise
about what documentation achieves: it improves management and
accountability. **It does not make a non-conforming system conforming.**
The underlying obligation is substantive and survives being written down
carefully. A model that implied otherwise would be teaching people to
document their way out of a legal duty.

---

## Security review

Chapters 06 and the inspection templates already do most of the security
work. What was missing was a **named touchpoint**, so this states it.

**Concurrent with plan review**, security review answers three questions
and nothing else:

1. Does this fit an already-reviewed pattern, or is it novel?
2. Does the tier match what the design actually does?
3. Is there anything here the institution's security office must see?

Most builds should clear on question 1. That is the paved road working:
if it uses the standard scaffold, the standard gateway pattern, and
already-inspected components, security review is a confirmation rather
than an investigation.

**Escalate to the institution's security office when:**

- The tier is 3 on data classification
- The full lethal trifecta is present and no leg can be removed
- The build touches authentication, authorization, or credential issuance
  for anyone other than itself
- It exposes a new externally reachable surface
- A component has a published vulnerability with no available fix
- It processes data the institution's policy prohibits on that platform

**Do not route everything to the security office.** A security function
that receives every build becomes the serial queue this chapter exists to
prevent, and it will be routed around. Escalation criteria that are
narrow and published are what make escalation credible.

---

## Privacy review

Concurrent, and narrower than people assume. Three questions:

1. **Are the declared data classes right?** The single most common defect,
   and the one that changes the tier.
2. **Is there a lawful basis and a policy fit for each class?** This is
   the question for your privacy office and counsel, not for this model.
   Where student records are involved, the relevant hook in US law is the
   FERPA school official exception at
   [34 CFR 99.31(a)(1)](https://www.law.cornell.edu/cfr/text/34/99.31),
   discussed in [chapter 03](03-classification.md).
3. **What is retained, where, and for how long?** Including the places
   people forget: execution logs, prompt and response logs, vector stores,
   and agent scratchpads. As [appendix B](../appendix/b-platform-controls.md)
   notes, retention is frequently a property of a downstream sink rather
   than of the platform anyone is looking at.

---

## Making concurrency real

The mechanism, borrowed from plan review and from
[chapter 04](04-plan-review.md):

- **One submittal, several reviewers, one clock.** All disciplines receive
  the design response at the same moment.
- **Published turnarounds per discipline**, with a limit on what silence
  can mean. See the next section: a missed turnaround can grant permission
  to proceed, and it can never manufacture a compliance determination.
- **Each discipline's findings name what would resolve them**, per
  chapter 04's rule that a finding a builder cannot act on is not a
  finding.
- **Disagreements between disciplines go to the AHJ**, not to the builder.
  Making the builder mediate between two institutional functions is how
  projects stall for months.

A single reviewer may hold several disciplines at a small institution.
That is fine and normal. What matters is that the standards are published
and the reviews happen on one clock, not that there are separate people.

---

## What a missed turnaround can and cannot do

Timeboxed review is defensible. **Deemed compliance is not**, and an
earlier edition of this model blurred them.

The deemed-approval rule in [chapter 04](04-plan-review.md) rests on
evidence about *change approval and delivery performance*. That evidence
says nothing about statutory obligations, and a legal duty does not lapse
because a reviewer had a backlog. So the two things silence can produce
are strictly separated:

| | **Administrative permission to proceed** | **Compliance determination** |
|---|---|---|
| What it means | The build may continue to the next stage | The obligation is satisfied |
| Can a missed turnaround produce it? | **Yes**, at Tier 2 | **Never** |
| Who can produce it? | The reviewing function, or the clock | Only the accountable office, affirmatively |
| Recorded as | "Proceeded on turnaround expiry, date" | A signed determination |

Consequences worth stating explicitly:

- **Accessibility conformance is never deemed.** A missed turnaround from
  the accessibility office lets the build proceed. It does not make the
  build conformant, and it does not transfer the obligation to the builder
  or to this document.
- **Privacy and lawful-basis determinations are never deemed.** Whether a
  use satisfies FERPA or institutional policy is a determination by the
  office that owns it, made affirmatively or not at all.
- **Security clearance can be deemed at Tier 2 only**, and never for a
  build meeting the escalation criteria above. Those escalate and wait.
- **A capability may hold a certificate of occupancy while an affirmative
  determination is still outstanding.** Say so on the certificate, name
  the outstanding item, and put a date on it. That is honest and
  manageable. Implying the determination exists is neither.

The general form: **the clock can grant permission. It cannot grant
absolution.**

---

## Honest accounting

**Verified:** the ADA Title II technical standard of WCAG 2.1 Level AA,
the amended part of 28 CFR, the extended compliance dates and the 50,000
population threshold, the named exceptions, the Title II versus Title III
distinction, WCAG's current version and conformance levels, and Section
508's reference to WCAG 2.0 under the Revised 508 Standards.

**Not verified:** the exact new subpart and section range within 28 CFR
Part 35 (individual sections 35.104, 35.202, 35.204, and 35.205 were
confirmed); and Section 504's mechanism for reaching federal funding
recipients.

**Design judgment, not findings:** the list of ways AI systems fail
accessibility by default, which is drawn from practice rather than from a
study; the specific escalation criteria for security review; and the
three-question shape of privacy review.

**Legal disclaimer that actually matters here:** this chapter cites
regulation and then stops. Whether an obligation applies to your
institution, and what satisfies it, is a question for your counsel,
accessibility office, and privacy office. A governance model that
purported to answer it would be doing harm.
