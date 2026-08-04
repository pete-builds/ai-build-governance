# 10. Agentic Products

The case this chapter exists for: **a team has used AI coding tools to
build an agent product, it works on their machine, and they want it in
production.** This is the most common real request, and chapters 01
through 09 handled it only by implication. This chapter makes the path
explicit.

It adds **no new gates.** It maps onto the existing verification points. If this
chapter turns into a parallel process with its own committee, it has
been implemented wrong.

---

## Separate the two risks, because people conflate them

Almost every conversation about "agentic AI in production" mixes two
different problems that need different checks.

| | Risk A: **built by** agents | Risk B: **is** an agent |
|---|---|---|
| What it is | Code authored largely by AI coding tools | A product that plans and acts at runtime |
| Core failure | Nobody understands what shipped | It does something nobody sanctioned |
| Detection | Static, at review time | Runtime, in observability |
| Timing | Before merge | Continuously, forever |
| Chapter mapping | H1 and H3 | H2, H4, and the tier triggers |

A product can be either, both, or neither. A hand-written agent has
Risk B only. A Python data pipeline scaffolded by Claude Code has Risk A
only. Most of what arrives has both, and the reason it goes wrong is
that a review catches one and assumes it covered the other.

Work both columns.

---

## Path A: code authored by AI agents

The governing principle is chapter 01's radical transparency: **if you
cannot explain in plain language what it does, it is not ready.** That
principle is doing real work here rather than being decorative, because
AI-authored code is specifically good at looking finished.

### A1. Comprehension attestation (H3)

A named human states, in writing, that they can explain what the code
does and why it is structured that way. Not "I reviewed it." Not "the
tests pass."

The practical test that separates this from a rubber stamp: **the
attesting human can answer, without re-reading, what happens when the
third-party call on the critical path fails.** If they cannot, the code
has not been comprehended, and no amount of test coverage substitutes.

This is not hostility to AI-assisted development. It is the same
standard a design professional's seal implies: work performed under
responsible charge, meaning someone competent actually understands it.
The volume of code AI tools produce makes this *more* necessary, not
less, precisely because the volume makes skimming feel sufficient.

### A2. Dependency provenance (H1)

The specific concern: AI coding tools suggest package names, and a
suggested package name may not correspond to the package the author
meant, or to any legitimate package at all. Verify that every dependency
**exists, is the one intended, and was not simply accepted because a
tool named it.**

- [ ] Every dependency resolves to a package with a plausible history,
      real maintainers, and adoption
- [ ] No dependency was added solely because a coding agent suggested it
- [ ] Lockfile committed and dependencies pinned
- [ ] Names checked against near-neighbours of well-known packages
- [ ] License of each dependency is acceptable to the institution

This maps to **OWASP LLM03 Supply Chain**. Note the honest limit: the
specific failure mode of AI tools suggesting non-existent package names
is widely discussed among practitioners, but **this model did not verify
published research quantifying it.** Treat the control as cheap
prudence, not as a response to a measured threat. See
[appendix C](../reference/evidence-on-gates.md).

### A3. Tests that did not come from the same source as the bug (H3)

If the same agent wrote the implementation and the tests, the tests
encode the implementation's assumptions, including its wrong ones. They
demonstrate self-consistency, not correctness.

- [ ] At least one adversarial or negative test authored or materially
      revised by a human
- [ ] Failure paths tested, not only success paths
- [ ] A test has been observed to **fail** when the behavior it guards is
      deliberately broken. An unexercised test suite is a hypothesis.

### A4. Secrets and generated configuration (H1)

AI-authored code and its scaffolding are a common source of committed
credentials, because example configuration gets filled in with real
values.

- [ ] History scanned, not just the working tree
- [ ] Generated config, notebooks, and fixtures checked specifically
- [ ] No real credentials in tests or example files

### A5. The bus-factor question (H3)

Chapter 09's two-signature rule applies with force. AI-assisted
development makes it easy for one person to produce more code than a
team can maintain, which is a genuine benefit and a genuine liability.

- [ ] A second person can run, modify, and deploy it
- [ ] The Standing Owner has seen it work
- [ ] The registry entry is good enough that the builder can leave

---

## Path B: the product is an agent

### B1. Classify honestly (chapter 03)

Run the triggers. Agent products fail classification most often on two:

**Autonomy.** An agent that takes consequential action without
per-action human approval is Tier 3. An agent that can modify its own
instructions, tools, or permissions at runtime is Tier 3 **and needs
explicit Decision Authority sign-off**, because nothing you approved stays approved.

**The lethal trifecta.** Agent products acquire all three legs
routinely, because the useful ones read something external, touch
something private, and then act. "Read the incoming ticket, look up the
customer, send a reply" is all three, and it looks completely ordinary.

The rule from chapter 03 stands: if you cannot remove a leg, it is
Tier 3.

### B2. Bound the loop (H2)

An agent is a loop. Unbounded loops are the failure mode that turns a
bug into an incident, and this maps to **OWASP LLM10 Unbounded
Consumption**.

- [ ] Maximum iterations per task, enforced in code
- [ ] Maximum tool calls per task
- [ ] Maximum consequential actions per task **and** per unit time
- [ ] Hard spend cap at the gateway, as a stop rather than an alert
- [ ] Wall-clock timeout
- [ ] Behavior on hitting any limit is defined, and fails **closed**

The last item is where this is usually wrong. An agent that hits its
limit mid-task and leaves a half-finished write is worse than one that
refuses to start.

### B3. Inventory the tools, and mean it (H2)

Every tool the agent can reach, with scope and justification, per
chapter 04. Then the question that matters: **could it do its job with
fewer tools or narrower scopes?**

This maps to **OWASP LLM06 Excessive Agency**, which is the single most
relevant catalogue entry for agent products. Excessive agency is not
usually a design decision. It accumulates, one convenient permission at
a time.

If the agent uses MCP servers, each one gets the
[MCP inspection](../templates/inspection-mcp-server.md). Note especially
that tool descriptions load at connection time and can influence
behavior without ever being invoked, and that servers must be reviewed
**as a set** rather than individually.

### B4. Treat memory and state as an attack surface (H2)

An agent that persists anything, conversation history, a scratchpad, a
vector store, a task queue, has a channel by which today's untrusted
input becomes tomorrow's instruction. OWASP's MCP guidance names
**memory poisoning** explicitly alongside tool poisoning, and **LLM04
Data and Model Poisoning** covers the broader case.

- [ ] Everything persisted is enumerated
- [ ] Anything derived from untrusted input is marked as such and stays
      marked
- [ ] Persisted content cannot silently become an instruction on a later
      run
- [ ] Retrieval corpora have a provenance record, and a way to remove an
      entry
- [ ] State can be cleared, and clearing has been exercised

### B5. Make the reasoning observable before concealing it (H4)

This is the concealment gate, and for agent products it is the whole
game. An agent's most dangerous property is that its behavior must be
*inferred* rather than read.

- [ ] Each run records inputs, the tool calls made, their results, and
      the actions taken, with enough context to reconstruct **why**
- [ ] Logging is not suppressible by the caller
- [ ] A human can review a run after the fact without developer access
- [ ] Consequential actions are reversible, or gated on confirmation
- [ ] Scheduled and event-triggered runs are visible to a named person.
      An unattended schedule with nobody watching **is** concealment.
- [ ] For advisory agents, the human override rate is measured.
      Unmeasured, an advisory agent is a deciding agent.

### B6. Define the escalation path (H4)

An agent that cannot say "I do not know" will guess, and a guess that
takes action is the worst available outcome.

- [ ] Conditions under which it must stop and ask are defined
- [ ] There is somebody to ask, reachable in practice
- [ ] Refusing is a supported outcome rather than a failure state
- [ ] Uncertainty is surfaced to the user, not smoothed away

---

## Reaching production

Agent products are where **progressive delivery** earns its place, and
it is the strongest argument this model has against pre-release gating.
Separating deployment from release means limiting who is exposed and
reversing in seconds, which lowers the value of approving in advance.

For an agent product that means:

| Stage | What it looks like |
|---|---|
| Deployed, not released | Runs on real inputs, takes **no** consequential action. Log what it *would* have done. |
| Shadow | Compare its proposed actions against what humans actually did. This is the cheapest accuracy measurement available and almost nobody does it. |
| Canary with a human gate | Real actions, small population, each one confirmed |
| Canary, unattended | Real actions, small population, bounded rate, watched |
| Full | Full population, limits still enforced |

The shadow stage is the one to insist on. It produces the measurable
success criterion chapter 02 demanded, at no risk, before anything is
irreversible.

**Occupancy.** Agent products are the canonical case for a
**time-limited production approval**: real expiry, one renewal, and a
genuine possibility of being switched off. "Agent pilot" is otherwise
the most permanent state in institutional computing.

**Certificate conditions** for an agent product should name, explicitly:
the actions it may take, the population it may affect, the tools it may
reach, its autonomy level, and its rate limits. Operating outside that
envelope is operating without a certificate.

---

## What "done" means

An agent product is ready when a person who did not build it can answer
all six:

1. What is it allowed to do, and what is it not allowed to do?
2. What did it do yesterday?
3. How would we know if it started doing something wrong?
4. How do we stop it, and how fast?
5. What does it cost, and what is the cap?
6. Who owns it when the person who built it leaves?

If any answer requires reading the source, the product is not ready. It
is a prototype with users, which is a legitimate thing to be, and should
hold a time-limited approval that says so.

---

## Honest accounting of this chapter

Per [appendix C](../reference/evidence-on-gates.md), which requires this
model to say where it is guessing:

**Evidence-backed:** the lethal trifecta as a forcing rule; the OWASP
catalogue mappings (LLM03 Supply Chain, LLM04 Data and Model Poisoning,
LLM06 Excessive Agency, LLM10 Unbounded Consumption, and memory
poisoning from OWASP's MCP guidance); MCP tool-description and
connection-time behavior; progressive delivery's deployment-versus-release
distinction.

**Design judgment, not findings:** the comprehension attestation and its
specific test; the dependency-provenance checks, since published
research quantifying AI-suggested non-existent packages was not verified
here; the five-stage rollout ladder; the six readiness questions; and
the claim that shadow mode is underused, which is an impression rather
than a measurement.

**Unresearched, and worth saying plainly:** no published guidance on
production-readiness governance for agent products specifically was
located during the research behind this model. This chapter reasons from
adjacent evidence and from the same principles as the rest of the code.
It is the chapter most likely to be wrong, and the one where an
amendment from practice would be worth the most.
