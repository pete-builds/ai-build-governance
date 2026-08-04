---
id: INSP-AGENT-YYYY-NNN
capability:
registry_id:
tier:
built_with:           # AI coding tools used, if any
inspector:
date:
result: pass | fail | pass with findings
---

# Inspection: Agentic Product

> For a product that plans and acts at runtime, was largely authored by
> AI coding tools, or both. See
> [chapter 10](../guide/03-agentic-products.md).
>
> **Work both parts.** Part A covers code authored by AI agents, where
> the failure is that nobody understands what shipped. Part B covers a
> product that *is* an agent, where the failure is that it does something
> nobody sanctioned. A review that catches one and assumes it covered the
> other is the standard way this goes wrong.
>
> Mark parts N/A honestly. A hand-written agent skips Part A. An
> AI-scaffolded data pipeline with no runtime autonomy skips Part B.

---

# Part A: Code authored by AI agents

## A1. Comprehension (H3)

- [ ] A named human attests they can explain what this does and why it is
      structured this way
- [ ] **The test:** that human answers, without re-reading, what happens
      when the third-party call on the critical path fails

Attesting human: ______________  Answer given: ______________

> If they cannot answer, the code has not been comprehended. Test coverage
> does not substitute. This is the same standard a professional seal
> implies: work performed under responsible charge.

## A2. Dependency provenance (H1)

- [ ] Every dependency resolves to a package with real maintainers,
      history, and adoption
- [ ] No dependency was added solely because a coding tool named it
- [ ] Package names checked against near-neighbours of well-known packages
- [ ] Lockfile committed, versions pinned
- [ ] Licenses acceptable to the institution

| Dependency | Verified real | Why needed |
|---|---|---|
| | [ ] | |

## A3. Tests not from the same source as the bug (H3)

- [ ] At least one adversarial or negative test authored or materially
      revised by a human
- [ ] Failure paths tested, not only success paths
- [ ] A test has been **observed to fail** when its guarded behavior was
      deliberately broken

> If the same agent wrote the implementation and the tests, the tests
> encode the implementation's assumptions including its wrong ones.

## A4. Secrets and generated config (H1)

- [ ] Git history scanned, not just the working tree
- [ ] Generated config, notebooks, and fixtures checked specifically
- [ ] No real credentials in tests or example files

## A5. Bus factor (H3)

- [ ] A second person can run, modify, and deploy it
- [ ] The Standing Owner has seen it work
- [ ] The registry entry is good enough that the builder can leave

---

# Part B: The product is an agent

## B1. Classification (chapter 03)

**Autonomy:**

- [ ] Produces output a human reads and acts on → Tier 1
- [ ] Acts with per-action human approval → Tier 2
- [ ] Acts without per-action human approval → **Tier 3**
- [ ] Can modify its own instructions, tools, or permissions at runtime →
      **Tier 3 plus explicit Decision Authority sign-off**

**Lethal trifecta:**

- [ ] Access to private data
- [ ] Exposure to untrusted content
- [ ] Ability to communicate externally

> All three is **Tier 3**. Agent products reach this routinely: "read the
> incoming message, look something up, reply" is all three legs. If a leg
> cannot be removed, state why:

Tier assigned: ______  Triggers fired: ______________

## B2. Loop and cost bounds (H2)

Enforced **in code**, not by convention. Maps to OWASP LLM10.

| Bound | Value | Enforced where |
|---|---|---|
| Max iterations per task | | |
| Max tool calls per task | | |
| Max consequential actions per task | | |
| Max consequential actions per hour | | |
| Wall-clock timeout | | |
| Hard spend cap | | gateway |

- [ ] Behavior on hitting any limit is defined
- [ ] It **fails closed**. An agent that stops mid-task without leaving a
      half-finished write is better than one that half-finishes.

## B3. Tool inventory and least privilege (H2)

Maps to OWASP LLM06 Excessive Agency, the most relevant catalogue entry
for agent products. Excessive agency accumulates one convenient
permission at a time.

| Tool | Scope | Could it be narrower? |
|---|---|---|
| | | |

- [ ] Asked and answered: could this do its job with fewer tools?
- [ ] Every MCP server it reaches has passed the
      [MCP inspection](inspection-mcp-server.md)
- [ ] MCP servers reviewed **as a set**, since one server's tool
      descriptions can influence behavior toward another

## B4. Memory and state as attack surface (H2)

- [ ] Everything persisted is enumerated below
- [ ] Anything derived from untrusted input is marked as such, and stays
      marked
- [ ] Persisted content cannot silently become an instruction on a later
      run
- [ ] Retrieval corpora have provenance records and a removal path
- [ ] State can be cleared, and clearing has been **exercised**

| Persisted thing | Derived from untrusted input? | Can it become an instruction? |
|---|---|---|
| | | |

> OWASP's MCP guidance names memory poisoning explicitly; LLM04 covers
> the broader case. An agent with a scratchpad has a channel by which
> today's input becomes tomorrow's instruction.

## B5. Observability before concealment (H4)

**This is the gate that matters.** An agent's most dangerous property is
that its behavior must be inferred rather than read.

- [ ] Each run records inputs, tool calls, results, and actions taken,
      with enough context to reconstruct **why**
- [ ] Logging is not suppressible by the caller
- [ ] A human can review a run afterward without developer access
- [ ] Consequential actions are reversible, or gated on confirmation
- [ ] Scheduled and event-triggered runs are visible to a named person.
      An unattended schedule with nobody watching **is** concealment.
- [ ] For advisory agents: **override rate is measured**

Named person who watches: ______________
Override rate, if advisory: ______________

## B6. Escalation (H4)

- [ ] Conditions requiring it to stop and ask are defined
- [ ] There is somebody to ask, reachable in practice
- [ ] Refusing is a supported outcome, not a failure state
- [ ] Uncertainty is surfaced to the user rather than smoothed away

---

# Part C: Route to production (H5)

Progressive delivery. Record the date each stage was cleared.

| Stage | What it means | Cleared |
|---|---|---|
| Deployed, not released | Real inputs, **no** consequential action. Log what it would have done. | |
| **Shadow** | Compare proposed actions against what humans actually did | |
| Canary, human gate | Real actions, small population, each confirmed | |
| Canary, unattended | Real actions, small population, bounded rate, watched | |
| Full | Full population, limits still enforced | |

> **Insist on the shadow stage.** It produces the measurable success
> criterion the Statement of Need demanded, at no risk, before anything is
> irreversible. It is the cheapest accuracy measurement available.

Shadow-stage result (accuracy, disagreement rate, notable failures):

---

# Part D: Readiness

A person who did not build it answers all six. If any answer requires
reading the source, this is a prototype with users, which is legitimate
but should hold a **temporary** production approval that says so.

| # | Question | Answer |
|---|---|---|
| 1 | What is it allowed to do, and not allowed to do? | |
| 2 | What did it do yesterday? | |
| 3 | How would we know if it started doing something wrong? | |
| 4 | How do we stop it, and how fast? | |
| 5 | What does it cost, and what is the cap? | |
| 6 | Who owns it when the builder leaves? | |

Answered by (not the builder): ______________

---

## Findings

| # | Section | Finding | Blocking? | What would resolve it |
|---|---|---|---|---|
| | | | | |

## Result

- [ ] **Pass**
- [ ] **Pass with findings** (accepted defect list)
- [ ] **Fail**

| | Name | Date |
|---|---|---|
| Inspector | | |
| Comprehension attested by | | |
| Standing Owner | | |

> **Re-inspect on:** any new tool or integration, any autonomy increase
> including removal of a confirmation step, any change to loop or spend
> bounds, model change to a different capability class, audience widening,
> and at the tier's periodic record review.
