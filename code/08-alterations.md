# 08. Alterations and Existing Work

Two problems every institution has. Changes to things already running,
and the large pile of things that were built before any of this existed.

Construction has mature answers to both, and the second one is the more
valuable import.

---

## Part 1: Alterations

### Change orders

A **change order** in construction is a formal instrument modifying the
contract, signed by the owner, architect, and contractor, covering scope,
cost, and schedule together. The discipline worth importing is that
tri-party structure: a change is not something the builder decides alone,
and it explicitly accounts for what the change costs.

The lightweight version here: a change re-enters the process **at the
stage where its risk actually changes**, and no earlier.

| Change | Re-enters at |
|---|---|
| Prompt wording, output formatting, non-functional refactor | Nowhere. Automated checks only. |
| New tool, integration, or egress path | **H2 rough-in**, plus reclassification |
| Data classes widened | **Chapter 03**, then plan review |
| Autonomy increased, or a confirmation step removed | **H4 concealment** |
| Audience widened | **Chapter 03**, then a CO amendment |
| Model swapped within the same class | Automated checks, note in record |
| Model swapped to a different capability class | H5 final |
| Purpose changed | **Chapter 02.** This is a new project. |

The last row is the one that gets skipped. A capability repurposed for
something its Statement of Need never described is a new building on an
old foundation, and it should be treated as new work rather than as an
alteration.

**Two changes deserve special mention because platforms will not tell
you they happened.**

*Removing a confirmation step* looks like a small usability
improvement and is actually a change in autonomy tier. It re-enters at
H4.

*Adding an integration* is the most common way a Tier 2 system silently
becomes Tier 3, because it is often the third leg of the lethal trifecta
arriving on its own. Egress inventory drift should alarm automatically
rather than depend on someone remembering this chapter.

### Requests for information

Covered in [chapter 04](04-plan-review.md), but it earns a second mention
here because it matters most during alterations. A builder unsure whether
a change needs re-review must be able to ask cheaply and get a recorded
answer quickly.

Absent that, people guess, and they guess toward not asking. Most
governance failures that look like defiance are unanswered questions.

### Punch lists

A **punch list** near substantial completion catalogs remaining defects:
real, known, tracked, and not blocking occupancy. The useful property is
that it is an honest list of accepted incompleteness rather than a
pretense of perfection.

Have one per capability. Items that are real, known, and consciously
deferred belong on a list with owners and dates, not in someone's head,
and not silently converted into "known limitations" in the registry
without anyone intending to fix them.

---

## Part 2: Existing Work

Every institution adopting this already has AI capabilities running that
never went through any of it. Keys issued informally, workflows built by
people who have since left, MCP servers on someone's machine, retrieval
systems over data nobody classified.

**How you handle this determines whether the model gets adopted or
resented.** Get it wrong and the first act of your new governance regime
is telling every existing builder that their work is now a violation.

### The construction answer

Existing buildings are **not** required to meet the current code. They
are lawfully non-conforming: legal because they complied when built, or
because they predate the requirement. The code applies when you
**alter** the building, and typically only to the altered portion.

This is not laxity. It is what makes adoption of a new code edition
possible at all. A code that retroactively condemned every existing
structure would never be adopted.

### The rule

**Existing work is lawfully non-conforming. Compliance is triggered by
alteration.**

1. **Inventory without penalty.** Run an amnesty. Every existing
   capability gets a registry entry with a named owner and no
   consequence for having existed. The goal is an accurate picture, and
   any penalty attached to disclosure buys you an inaccurate one. This
   is the single highest-value step in adopting this model.
2. **Classify, but do not enforce.** Assign a tier so you know your
   exposure. Do not require existing work to satisfy its tier's gates
   retroactively.
3. **Compliance on alteration.** The next time it is substantively
   changed, the changed part enters at the appropriate stage per Part 1.
4. **Immediate action only for the genuinely unsafe.** Not "does not
   meet the code" but "is actively dangerous." A short list:
   - Credentials exposed, unscoped, or non-expiring
   - Data classes the institution's policy forbids on that platform
   - The full lethal trifecta with no human in the path
   - No owner at all
5. **Orphans get owners or get switched off.** An unowned running
   capability is the worst category in the inventory, and there are only
   two honest resolutions.

### Hazard abatement

Construction has an analogue for step 4: some conditions in existing
buildings must be corrected regardless of when they were built, because
they are dangerous rather than merely outdated. Retrofit requirements
for existing structures exist for exactly this class of problem.

Keep that list **short and defensible.** Every item you add to it is a
retroactive demand on people who did nothing wrong, and the credibility
of the whole amnesty depends on the list being obviously about danger
rather than about tidiness.

If your unsafe list has fifteen items, it is a compliance program
wearing a safety costume, and it will be read that way.

### Sunset by attrition

Most existing non-conforming work resolves itself, and you should expect
that rather than driving it:

- It gets changed, and complies on alteration
- It stops being used, and the record review decommissions it
- Its owner leaves, and it surfaces as an orphan

The periodic record review in [chapter 07](07-occupancy-and-records.md)
is what makes attrition work. Without it, non-conforming work is
permanent, and "lawfully non-conforming" becomes a synonym for "never
looked at again."

Report the ratio of conforming to non-conforming capabilities over time.
It is the honest measure of whether adoption is real, and it is a much
better metric than counting permits issued.
