# 02. Statement of Need

Nobody builds a building because a contractor had a good idea about
concrete. Institutional construction establishes need *before* anyone
draws anything, through a recognizable sequence of artifacts: a
**statement of need** justifying the project against mission, a
**feasibility study** testing whether it can be done at all, a
**program of requirements** (architectural programming) defining what
the building must actually contain, and a **capital project request**
competing for funding against everything else.

Only after that does design begin.

AI work at universities almost always inverts this. Someone
demonstrates a capability, the demo is impressive, and a project forms
around the demo. The need gets written afterward, backwards, to justify
what already exists.

This chapter exists to stop that.

---

## The borrowed idea that does the most work

Building commissioning practice separates two documents, and the
separation is the single most useful import in this whole model:

- The **Owner's Project Requirements (OPR)** is the *what*. The owner
  writes it. It states what the thing must accomplish and how success
  will be measured. It is deliberately not a design.
- The **Basis of Design (BOD)** is the *how*. The design team writes
  it, in response.

A **Commissioning Authority** then audits the BOD against the OPR. Not
"is this a good design" but "does this design deliver what was asked
for." (These terms come from commissioning practice, associated with
ASHRAE Guideline 0. Well attested, though not verified against the
guideline text directly.)

Import that split exactly:

| Construction | Here | Author |
|---|---|---|
| Owner's Project Requirements | **Statement of Need** (this chapter) | The person with the problem |
| Basis of Design | **Design Response** (chapter 04) | The person building it |
| Commissioning Authority audit | **Plan review** (chapter 04) | Someone who is neither |

**The Statement of Need must be authored or signed by someone other
than the builder.** This is the entire control. A need statement
written by the person who wants to build the thing is a proposal
wearing a costume.

---

## What a Statement of Need contains

Use [`templates/statement-of-need.md`](../templates/statement-of-need.md).
Six required sections, and a hard length limit of two pages.

### 1. The problem, stated without a solution in it

Describe what is wrong today in terms a person outside the field would
recognize. If the sentence contains the words "AI," "agent," "LLM," or
a product name, it is not a problem statement, it is a solution
statement. Rewrite it.

A useful forcing question: **who is worse off today, and how would they
describe it?**

### 2. Who is affected, and how many

Named population and rough scale. "Staff in one office" and "every
undergraduate" are different projects with different tiers, and this is
one of the inputs to classification in chapter 03.

### 3. What happens if we do nothing

The honest answer is sometimes "very little," and that is a legitimate
outcome of writing this down. Construction calls the analogous section
deficiency cataloguing: what is the actual cost of the current state.

If the answer is "nothing much, but it would be nice," the project can
still proceed as an explicitly labeled experiment. It just does not get
to claim operational urgency, and it does not get to skip tiering on
the grounds that it is only a pilot.

### 4. What "done" looks like, measurably

At least one criterion that could fail. "Improved efficiency" cannot
fail. "Reduces median handling time for this request type from three
days to under one" can.

This is also where you state the **acceptance threshold for being
wrong**. AI systems produce wrong answers as a matter of routine, not
as a defect. So: what error rate is acceptable, who bears the cost of
an error, and how would an affected person find out and contest it? A
need statement that has not confronted its own tolerable error rate is
not finished.

### 5. Data required

What data classes the thing needs to touch, named in your institution's
own classification scheme. Not what it would be nice to have. What it
needs.

This is the field most often filled in optimistically, and it is the
one that sets the permit tier. Chapter 03 treats an upgrade to this
field as an alteration requiring re-review, precisely because "we also
gave it access to the student records" is how a Tier 1 project becomes
a Tier 3 project without anyone noticing.

### 6. Decision authority and ownership

Two names, and they may not be the same person:

- **Who decides this is worth doing** (the owner, signing the need)
- **Who will own it in eighteen months** (the operator)

If the second name is a student, an intern, or a fixed-term fellow, the
project needs a standing institutional co-owner before it may proceed
past plan review. See chapter 09. This is not a slight on short-tenure
contributors; it is an acknowledgment that they leave, which is the
whole point of a fellowship.

---

## The check that saves the most effort: does this already exist

Before design, answer four questions in writing. This mirrors
construction's feasibility study, and it is the cheapest step in the
entire model.

1. **Does the vendor already publish an official integration?** For any
   external service, check whether it ships its own MCP server, SDK, or
   CLI. Building a wrapper around a service that already publishes one
   is the most common avoidable waste in this space.
2. **Does something equivalent already exist inside the institution?**
   Query your own registry (chapter 07). Decentralized institutions
   routinely build the same thing three times in three units.
3. **Can this be bought?** If a supported commercial product does this,
   the build has to justify itself against it, including the
   maintenance cost that a build incurs forever and a purchase does
   not.
4. **Can it be done without AI?** A deterministic script, a database
   view, or fixing the upstream process is frequently the correct
   answer, and it will be cheaper, more reliable, and easier to govern.
   Asking this question is not obstruction. It is the same question a
   feasibility study asks about whether the building is needed at all.

An honest "yes, this already exists" here is the highest-value outcome
the whole model can produce, and it should be recorded and celebrated
rather than treated as a failed intake.

---

## Grounds for refusal

A Statement of Need should be sent back, not tiered, when:

- The problem statement is a solution statement and stays one after one
  revision
- No named owner will exist in eighteen months and none can be found
- The data required includes classes the institution's own policy
  forbids in the intended platform, and no alternative design is offered
- The measurable success criterion cannot fail
- Question 1 above turns up an official integration and the response is
  "but I want to build it anyway" with no reason attached

Refusal at this stage is cheap and kind. Refusal after six weeks of
building is neither.

---

## What this stage is not

It is not architecture review. No diagrams, no technology choices, no
model selection. Those belong in the design response at chapter 04, and
mixing them in here is how need statements become unreadable and
therefore unread.

It is also not a funding decision, though at most institutions it will
feed one. Construction keeps the statement of need distinct from the
capital request for good reason: the need can be real and legitimate
and still lose to a more urgent need this cycle. Recording a valid
unfunded need is a useful outcome, and a registry of them is how you
notice the same need arriving from four different units.

---

## Output of this stage

A signed Statement of Need, filed in the registry, carrying:

- A permanent identifier
- The owner's name and the operator's name
- Declared data classes
- Declared population and scale
- The existing-tooling findings

That record is the input to [chapter 03, Classification](03-classification.md),
which uses the declared data, population, and capability to set the
permit tier by objective trigger rather than by anyone's judgment.
