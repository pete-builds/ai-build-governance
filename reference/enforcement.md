---
title: "Machine-Readable Requirements and a Reference Gate"
parent: "Technical and Evidence References"
nav_order: 7
---

# Machine-Readable Requirements and a Reference Gate

Everything else in this framework is procedure and paperwork. A governance model
made only of procedure and paperwork is one whose controls all depend on somebody
choosing to follow them, and requirement 1.5 says not to claim a control the
platform does not enforce. This page is where the framework applies that
requirement to itself.

Two artifacts, both small, both deliberately narrower than the model:

| Artifact | What it is |
|:--|:--|
| `reference/requirements.json` | The numbered requirements and the five verification points, machine-readable. Generated from the chapters by `tools/build-nav.pl`. |
| `tools/reference-gate/` | A working GitHub Actions gate that fails a pull request when a Tier 2 or Tier 3 capability lands without its verification-point evidence. |

---

## What the gate actually enforces

**Three things, and nothing else:**

1. The capability declares a tier. An unclassified capability fails, because
   classification is what decides everything downstream.
2. For the tier declared, every verification point that tier requires has a
   non-empty evidence file.
3. Where the tier requires a **human** at a point, the evidence names one, and
   that human is not the person who opened the change. This one is the
   interesting check, because it is the only place a script can carry a
   requirement the model genuinely cares about: requirement 6.13 wants somebody
   other than the builder to have operated the thing, and pull-request metadata
   is enough to test that.

**What it does not do, stated plainly because a green check mark is a claim:**

- It does not read the evidence. A file saying `Verified-by: colleague` and four
  lines of fiction passes. The gate tests that a named person put their name to
  something, which is a real deterrent and not a verification.
- It does not classify anything. It reads the tier the builder declared. A
  capability that should be Tier 3 and says Tier 1 passes trivially, which is
  why classification review is a human step in chapter 03 and why trigger A
  treats silence as the middle tier rather than the lowest.
- It does not check accessibility, lawful basis, or any concurrent review.
  Requirement 10.6 already says those are never deemed, and they are not
  gateable by a script.
- It does not approve production. Chapter 07 does that, and a person signs it.

A gate that stopped one unclassified Tier 3 change from merging would have
earned its keep. Read as anything more, it becomes the exact failure requirement
1.5 exists to prevent.

---

## Using it

Copy `tools/reference-gate/evidence-gate.yml` into `.github/workflows/` in the
repository that holds the capability, put a
[manifest](https://github.com/pete-builds/ai-build-governance/blob/main/tools/reference-gate/capability.example.yml)
at `governance/capability.yml`, and write evidence to `governance/evidence/H1.md`
through `H5.md` as each point passes.

Evidence for a point that requires a human needs one line the gate can find:

```
Verified-by: name@institution.example
```

**Pin the edition you fetch.** The reference workflow fetches
`requirements.json` at a tagged edition rather than from `main`, because an
unpinned fetch means somebody else's edit silently changes what your gate
enforces. That is the same argument requirement 13.5 makes about third-party
components, applied here: pinning prevents change for something you run and only
detects it for something you do not.

The gate exits 0 on pass, 1 when evidence is missing or self-signed, and 2 when
the manifest itself is unusable. It has no dependencies beyond `python3`, and it
reads the small subset of YAML it needs rather than requiring an institution to
vet a parser.

---

## What is in the JSON, and what is deliberately absent

Present per requirement: the number, the chapter, the file and subsection anchor
it lives at, its title, a one-sentence summary, and the set of RFC 2119 keywords
it contains.

Present per verification point: the identifier, the name, what each tier
requires at that point, and the template that produces its evidence.

**Absent per requirement: tier applicability and the evidence artifact.** This is
the honest part. Neither is recoverable from the chapter text. Tier is stated in
three different places depending on the chapter: sometimes inside the
requirement, sometimes in a table above a block of requirements, sometimes only
in the chapter's Applicability section covering all of them at once. A generator
that guessed would produce a file that looks authoritative and is wrong in ways
nobody would check. So the verification points carry tier, because they genuinely
have one, and the requirements do not.

**One more limitation, measured rather than estimated.** Twelve of the 131
requirements report no normative keyword: 5.4, 6.3, 6.5, 6.13, 7.2, 7.11, 8.2,
11.4, 11.6, 11.10, 13.1, and 13.10. Those state their force in a table or in a
lead-in line the extractor drops, so `normative` is empty for them. It is an
artifact of the extractor, not an absence in the chapter. Do not build anything
that treats an empty `normative` array as "not binding". The gate does not.

---

## Sources and confidence

The verification-point tier mapping is transcribed from the table under
requirement 6.2 in [chapter 06](../model/06-inspections.md). The
builder-cannot-verify-their-own-work check implements part of requirement 6.13.
The pinning argument is requirement 13.5.

**No claim here rests on outside evidence, and none is made about
effectiveness.** Whether a CI gate changes behavior in a decentralized
institution is unmeasured, like most of this framework. It is offered because
one enforced check is worth more than a page describing an intention, not
because anyone has shown that this particular check helps.
