# 04. Accessibility

> **Part II: handbook. Non-binding.** The requirement that these reviews
> run concurrently lives in
> [model/10-concurrent-reviews.md](../model/10-concurrent-reviews.md). This
> page is how to actually do one.

---

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
the question is asked at design review rather than discovered after launch,
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

| Verification point | Accessibility check |
|---|---|
| Design review | Does this have a user interface or produce user-facing content? If yes, accessibility review is engaged **now**, concurrently. |
| H3 End-to-End Path | Automated checks in the pipeline: labels, contrast, keyboard path, heading structure |
| H4 Pre-Concealment | Manual check of the paths automated tooling cannot see: screen reader on the primary task, keyboard-only completion |
| H5 Final Verification | Conformance statement recorded; known gaps on the accepted defect list with owners and dates |

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


---

## Where this sits

The concurrency requirement and the rule that conformance is never deemed
are in [model/10](../model/10-concurrent-reviews.md), requirements 10.6.1 and
10.7. The running example shows two real accessibility defects being caught
and fixed while still cheap: see
[guide/02, stage 4](02-running-example.md#stage-4-concurrent-reviews).
