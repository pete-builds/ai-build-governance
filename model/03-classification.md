# 03. Classification

Building codes classify by **occupancy**: what a building is used for
and who is inside it. A warehouse and a hospital face different
requirements not because one is more sophisticated but because the
consequences of failure differ. Classification happens early, drives
everything downstream, and is determined by objective criteria rather
than by how the designer feels about the project.

Copy that. Classification here determines the authorization tier, which
determines how much review and which inspections apply.

**The design goal is that two different reviewers, given the same
Statement of Need, reach the same tier.** If tiering depends on
reviewer judgment, it will drift, it will be argued over, and it will
be gamed.

---

## The three tiers

| Tier | Name | Review | Inspections | Occupancy |
|---|---|---|---|---|
| **1** | Self-Certified | Self-certified | Automated only | Self-issued |
| **2** | Standard Authorization | Peer design review, timeboxed | Automated + one human verification point | Issued by the operator's peer |
| **3** | Independent Review | Independent review by someone off the project | Full hold-point set, human sign-off | Issued by the Final Decision Authority |

Tier 3 borrows deliberately from the IBC's **independent reviews**
concept (Chapter 17 of the IBC, section numbering unverified), which
requires certain high-consequence work to be inspected by an
independent approved agency, and, critically, **hired by the owner
rather than by the contractor**, so the inspector is not paid by the
party being inspected. If you take one structural idea from this
chapter, take that one: at the top tier, the reviewer must not report
to the builder.

---

## Trigger rules

Work the triggers in order. **The highest triggered tier wins.** A
project is never downgraded because most of its answers were low.

### Trigger A: Data classification

Use your institution's own scheme. Substitute your labels in your
amendments document.

| Data the capability can reach | Minimum tier |
|---|---|
| Public or already published | 1 |
| Internal business data | 2 |
| Regulated or specially protected (student records, health, financial, personnel) | 3 |
| Classes your policy forbids on the platform | **Not authorizationted.** Not a tier. |

That last row matters. Some things are not high-tier, they are
prohibited, and a governance model needs a category for "no" that is
not merely "more review." The EU AI Act models this with a genuinely
prohibited tier rather than a very-high-risk one.

### Worked example: a four-level institutional scheme

Many universities run a scheme with **four** operative levels rather than
three, and the fourth is what makes it usable here. A representative
mapping:

| Institutional level | Typical contents | Platform status | Authorization tier |
|---|---|---|---|
| **Low Risk** | Published, public, intended for general release | Allowed | **1** |
| **Moderate Risk** | The bulk of university business data. Frequently the default for anything not explicitly public. | Allowed | **2** |
| **High Risk** | Identity-theft-enabling identifiers: national ID numbers, financial account numbers, driver's licence numbers | Requires security office engagement | **3**, with that engagement completed **before** design review |
| **Restricted** | Classes prohibited outright on the platform, commonly including passwords, payment card data, and protected health information | **Not allowed** | **Not authorizationted.** Return the Statement of Need. |

Three amendments worth making when you adopt a scheme like this:

**Default to the second level, not the first.** Where institutional
guidance says to treat data as Moderate when in doubt, a Statement of
Need that leaves the data field blank classifies as **Tier 2**, not
Tier 1. Silence is not an exemption.

**Sequence the security engagement before design review.** A design
reviewed and then rejected by the security office wastes both parties'
time. See [chapter 11](10-concurrent-reviews.md), which runs security
concurrently rather than serially.

**Decide deliberately where student records land.** Many schemes place
FERPA-protected education records in the *middle* level rather than the
high one, because they are not identity-theft-enabling in the narrow
sense. That is defensible as a data-security classification and can be
the wrong answer for AI systems, where the concern is exposure and
inference rather than identity theft. If you conclude student records
warrant Tier 3 regardless of their classification, **write that
amendment down explicitly** rather than leaving it to reviewer judgment.
This is the single most consequential local decision in this chapter.

`UNVERIFIED`: this table describes a common pattern rather than any one
institution's published policy. Substitute your own levels verbatim, and
cite your own policy, rather than relying on the shape above.

**On student data specifically:** the relevant hook in US law is the
FERPA school official exception at
[34 CFR 99.31(a)(1)](https://www.law.cornell.edu/cfr/text/34/99.31),
which authorizations disclosure to a contractor or other outside party only
where that party performs "an institutional service or function for
which the agency or institution would otherwise use employees," is
"under the direct control of the agency or institution with respect to
the use and maintenance of education records," and is bound by the
use and redisclosure restrictions at 34 CFR 99.33(a). The regulation
further requires the institution to "use reasonable methods" to ensure
access is limited to legitimate educational interest.

**This model does not interpret that for you.** Whether a given design
satisfies it is a question for your counsel and privacy office. What
this model does is make sure the question gets *asked before the build*
rather than discovered afterward, and that the answer is recorded.

### Trigger B: The lethal trifecta

The clearest available rule for when a tool becomes dangerous. A system
holding all three of these can be induced to exfiltrate data, and no
amount of prompt engineering reliably prevents it
([Simon Willison](https://simonwillison.net/2025/Jun/16/the-lethal-trifecta/)):

1. **Access to private data**
2. **Exposure to untrusted content**
3. **The ability to communicate externally**

| Combination | Minimum tier |
|---|---|
| Any one of the three | 1 |
| Any two | 2 |
| **All three** | **3** |

Two properties make this a good trigger. It is objective, so reviewers
agree. And it is *actionable*, because a Tier 3 finding usually has an
obvious remedy: remove one leg. Cut external egress, or isolate the
untrusted input, and the system drops a tier honestly rather than by
argument.

Note how easily the third leg appears by accident. A tool that can send
mail, post to a webhook, write to a shared document, open a pull
request, or make an arbitrary outbound HTTP request has external
communication. So does one whose output is rendered somewhere an
attacker can read.

### Trigger C: Autonomy

| Behavior | Minimum tier |
|---|---|
| Produces output a human reads and acts on | 1 |
| Takes actions a human approves individually | 2 |
| Takes consequential actions without per-action human approval | 3 |
| Modifies its own instructions, tools, or permissions at runtime | **3, and requires explicit Decision Authority sign-off** |

"Consequential" means an action that is hard to reverse, visible
outside the team, or costs money.

The last row is not hypothetical. An agent that can install or
reconfigure its own tools has no stable review surface, which means
nothing you approved stays approved.

### Trigger D: Blast radius

| Who is affected by a bad output | Minimum tier |
|---|---|
| The builder | 1 |
| The builder's team | 1 |
| A unit or department | 2 |
| The whole institution | 3 |
| People outside the institution, or anyone in a position to be harmed rather than inconvenienced | 3 |

### Trigger E: Consequential decisions about people

Any system informing decisions about admission, grading, financial aid,
hiring, promotion, discipline, accommodation, or access to services is
**Tier 3 without exception**, regardless of how advisory it claims to be.

This aligns with the EU AI Act's approach of listing high-risk uses by
domain rather than by technical property, and its Annex III includes
education and employment among them. If your institution is within the
Act's reach, note that its extraterritorial scope catches providers
whose systems are placed on the EU market or whose output is used in
the EU, and that a Digital Omnibus in force from 2026-07-27 moved Annex
III high-risk obligations to 2027-12-02
([European Commission](https://digital-strategy.ec.europa.eu/en/policies/regulatory-framework-ai)).
Do not plan against the widely-quoted August 2026 date.

The phrase "it is only advisory, a human makes the final call" is the
single most common way this trigger gets evaded. It does not work,
because a recommendation that is followed 95% of the time is a
decision. If the human override rate is not measured, assume the system
is deciding.

### Trigger F: Unbounded cost

Anything that can spend without a hard cap is Tier 2 minimum, and the
cap is a condition of the authorization rather than a recommendation. Gateways
generally enforce budgets reliably, so this is a cheap trigger to
satisfy, which is exactly why there is no excuse for skipping it.

---

## Worked examples

| Capability | Triggers | Tier |
|---|---|---|
| Read-only MCP server over already-public course catalog data | A:1, B:1 leg, D:unit | **2** (blast radius) |
| Workflow summarizing internal meeting notes into a private channel | A:2, B:2 legs | **2** |
| Agent that reads incoming external email and files tickets with internal data | A:2, **B:all three**, C:2 | **3** |
| Retrieval system over student records, staff-facing, read-only | **A:3**, E if it informs decisions | **3** |
| Local script summarizing the builder's own notes, no egress | A:1, B:1, D:builder | **1** |
| Tool that opens pull requests based on issue text from the public internet | **B:all three**, C:3 | **3** |

The third and sixth rows are the instructive ones. Both look modest.
Both are Tier 3, because untrusted input plus private data plus egress
is the exact shape of an exfiltration path, and in both cases the
untrusted input arrives from outside the institution by design.

---

## Reclassification

Tier is not permanent, and this is where most governance models leak.

**Re-run classification whenever:**

- The declared data classes change, including "we also connected it to"
- A new tool, integration, or egress path is added
- Autonomy increases, including removing a confirmation step
- The audience widens, including a pilot going institution-wide
- The system starts being used for a purpose the need statement did not
  describe

The fourth is the most common. A pilot that quietly becomes
infrastructure is the standard failure mode, and chapter 07's
time-boxed **time-limited production approval** exists specifically
to force that conversation on a date rather than never.

The fifth is the most dangerous, because nothing in any platform will
tell you it happened. Only the periodic record review in chapter 07
will.

**Tier can go down.** If a system's external egress is removed or its
data access is narrowed, reclassify it downward and say so. A model
that only ratchets upward gives builders a reason to hide changes, and
downward reclassification is the reward for actually reducing risk.

---

## What this chapter deliberately does not do

It does not score projects numerically. Risk matrices with weighted
scores invite negotiation over weights, and the negotiation always
trends toward the tier the builder wanted. Binary triggers with a
highest-wins rule are cruder and harder to argue with, which is the
point.

It also does not attempt to map onto NIST AI RMF or ISO/IEC 42001
control identifiers inline, because doing so would make the chapter
unreadable for the people who have to use it. That mapping lives in
[appendix A](../reference/framework-crosswalk.md), where auditors can
find it and builders can ignore it.
