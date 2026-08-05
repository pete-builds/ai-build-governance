---
title: Contributing
nav_order: 11
---

# Contributing

This is a model code. It is meant to be adopted, amended, and argued
with.

## The three useful kinds of contribution

**1. Amendments from practice.** You adopted some part of this at your
institution and it did not survive contact with reality. That is the
most valuable thing you can report. Open an issue describing what you
tried, what broke, and what you did instead. "We deleted this section
and nothing bad happened" is a finding, not a complaint.

**2. Corrections to the source material.** This model borrows real
vocabulary from construction governance, and real findings from
published research and standards. If a building-code term is described
incorrectly, a spec section is misquoted, a citation is stale, or a
standard has been revised, say so and point at the authority. Accuracy
of the borrowed material is not decoration here: the whole argument
rests on the analogy being real rather than decorative.

**3. Reference implementations.** If you have mapped this to a stack
other than the one in the
[framework crosswalk](reference/framework-crosswalk.md), that mapping is
worth publishing.

**4. The five numbers.** [Requirement 1.9](model/01-principles.md) names
what would tell anyone whether this framework works. Nobody has published
them. If you adopt this and report them, that single contribution is worth
more than every other kind on this list combined, because it is the only
one that could falsify the design.

## What this repository is not

It is not a place for institution-specific configuration. Do not open a
pull request adding your university's hostnames, account structures,
role names, group names, or internal URLs. Those belong in your own
amendments document, kept wherever your institution keeps internal
process. Keeping this repository free of any single institution's
particulars is what makes it adoptable by the next one.

## Ground rules for changes to the model text

- **Every normative claim carries a citation.** If a section asserts
  that a framework requires something, cite the framework, the document
  number, and the section. If you cannot find the section, say so in
  the text rather than implying precision that is not there.
- **Say when the evidence is contested.** Several questions in here
  genuinely lack a settled answer, most notably whether design review
  boards help or hurt. Sections covering those must present both sides
  and label them as unsettled. Do not resolve a live disagreement by
  deleting one side of it.
- **No new gates without a named failure they prevent.** Any pull
  request that adds a review step, an approval, or a required artifact
  must state the specific failure it exists to catch. A gate that
  cannot name its failure mode is overhead, and the model's own
  principles say to remove it.
- **Prefer deleting.** This model is more likely to fail by being too
  heavy to follow than by being too permissive. Contributions that
  remove a step, merge two artifacts, or automate a manual check are
  held to a lower bar than contributions that add one.
- **Never renumber a requirement.** Append within the chapter, even where
  that leaves numbers out of positional order. An amendment or an
  exception record citing `8.7` must still mean the same provision three
  editions later.
- **Run `./tools/check.sh` before opening a pull request.** Fourteen checks,
  each of which exists because that exact mistake was made here. If you
  add a chapter, confirm the conformance glob covers it: it has silently
  needed widening before.
- **Do not remove an `UNVERIFIED` label to make a section read better.**
  The check fails if the count drops, deliberately. Every one of them is
  a place someone declined to assert something they could not confirm.

## Style

- Plain language. If a sentence needs to be read twice, rewrite it.
- No em dashes. Use commas, colons, periods, or restructure.
- Define construction terms on first use. The audience is engineers and
  IT staff, not architects.
- Tables for anything with more than three parallel cases.

## Licensing

Contributions are accepted under the repository's CC BY 4.0 license. By
opening a pull request you agree your contribution may be distributed
under those terms.
