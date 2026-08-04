---
title: "Appendix C: The Evidence on Gates"
parent: "Technical and Evidence References"
nav_order: 3
---

This model makes a strong claim: that heavyweight approval gates make
outcomes worse, and that governance should mostly be automated defaults
plus inspection at points of irreversibility.

That claim needs to be defensible, and where the evidence does not
support it, this appendix says so. Chapter 01 asks every gate to name the
failure it prevents. The same standard applies to the model itself.

---

## 1. Change approval: the evidence is strong and specific

This is the best-supported finding in the appendix, and the load-bearing
citation for the whole model.

DORA's published guidance on streamlining change approval states
directly that external approval approaches "have a negative impact on
software delivery performance," and, on the stability question that
usually justifies them:

> "No evidence was found to support the hypothesis that a more formal,
> external review process was associated with lower change fail rates."

It also names the causal mechanism, which is what makes the finding
usable rather than merely surprising: heavyweight approval pushes teams
toward larger, less frequent batches, and larger batches carry more risk
per release. And it names the institutional trap explicitly:

> adding process after an incident "will make things worse because this
> drives up lead times and batch sizes, creating a vicious cycle."

On why distant approvers do not catch problems:

> "CABs are good at broadcasting change, but people that far removed from
> the change might not understand the implications."

[Source: DORA](https://dora.dev/capabilities/streamlining-change-approval/)

### The nuance that matters more than the headline

**DORA is not saying review is useless.** It recommends **peer review at
code check-in** plus automated testing, continuous integration, and
monitoring as the substitute, and reframes the review body's role "from
gatekeeper to process architect and information beacon."

So the finding is narrow and specific: what harms outcomes is *external,
heavyweight, deployment-gating* approval by people distant from the work.
Lightweight review close to the work is endorsed.

This is precisely why chapter 04 uses timeboxed peer review with an
advice process at Tier 2 rather than either a board or nothing, and why
chapter 06 pushes almost everything into automation. Anyone citing DORA
to argue for no review at all is misreading it.

**Confidence: high** for the quoted DORA guidance, which was fetched
directly. The frequently-quoted line from the *Accelerate* book, that
external approval is "worse than having no change approval process at
all," is consistent with DORA's public position but was **not verified
against the book text**. Treat that specific phrasing as paraphrase risk
and cite the DORA page instead.

### The limit of this evidence

DORA studies software delivery performance: throughput and stability. It
does not measure whether a system should have been built, whether its
data handling was lawful, or whether it treats people fairly. Those are
the questions a university most needs answered.

So the honest reading is: **DORA tells us how not to gate, not whether to
govern.** This model uses it to shape the *mechanism* while getting the
*content* of review from elsewhere.

---

## 2. Architecture review boards: genuinely contested

Chapter 09 warns against the Authority Having Jurisdiction becoming a
review board. Here is the actual state of the argument, both sides,
because it is not settled.

**Against centralized ARBs.** ThoughtWorks' Technology Radar has
historically placed traditional centralized architecture review boards in
its "Hold" ring, characterizing them as slow, disconnected from
day-to-day code, and prone to becoming ivory-tower bottlenecks. The
promoted alternative is a decentralized **architecture advice process**:
anyone may make a decision, provided they consult the parties affected
and record the decision, typically as an ADR.

**For ARBs.** The arguments are real and should not be caricatured.
Without some central function you get technology sprawl, duplicated
capability across units, inconsistent security posture, and no mechanism
for institution-wide concerns that no individual team is incentivized to
carry. In a decentralized university this is not hypothetical: the same
capability genuinely does get built three times in three units.

**What the evidence actually supports.** There is no controlled study
settling this, as distinct from DORA's specific and much narrower finding
about change approval boards. The ARB question is contested among
practitioners, and both positions rest largely on experience reports.

**Confidence: medium**, and the specific ThoughtWorks Radar edition and
quote wording were not verified.

**What this model does about it, stated as a judgment call rather than a
finding:** it adopts the advice process at Tier 2, keeps a blocking
reviewer at Tier 3 where institutional exposure is real, and satisfies
the pro-ARB concerns through the **registry** (chapter 07) rather than
through a board. A registry answers "are we building this twice" without
anyone having to attend a meeting. That is a design bet, not a
conclusion from data, and it is fair to disagree with it.

---

## 3. Paved roads and golden paths: well established as practice, thin as measurement

The idea that platform teams should provide a well-supported default path
rather than police deviation is widely adopted and consistently reported.
Netflix is generally credited with "paved road" and Spotify with "golden
path," the latter implemented through Backstage's software templates
(Backstage was open-sourced in 2020 and is a graduated CNCF project). The
CNCF's platforms work frames the principle as "guardrails, not gates,"
and Team Topologies describes the platform team as enabling governance by
default rather than governance by gatekeeping.

**Confidence: medium.** These attributions are consistently reported but
were not pinned to a single dated primary source for either the Netflix
or Spotify origin, and the CNCF phrasing was not verified verbatim.

More importantly: **I found no rigorous measurement that paved roads
improve governance outcomes specifically.** The case for them is
mechanical and plausible, that defaults determine behavior, rather than
empirically demonstrated in a governance context. Principle 1 of this
model rests on that mechanism, and it is honest to label it a
well-supported design intuition rather than a research finding.

---

## 4. Stage-gate: the origin, and the known failure mode

**Stage-Gate** originates with Robert G. Cooper in the 1980s: sequential
stages separated by go/kill decision gates. The commonly reported model
runs roughly discovery, scoping, business case, development, testing and
validation, launch.

The documented criticisms are consistent and relevant here: it becomes a
bureaucratic obstacle course of paperwork, it is rigid and effectively
linear, and risk-averse gatekeepers systematically favor incremental over
novel ideas. Cooper himself later introduced Agile-Stage-Gate hybrids in
response.

**Confidence: medium.** Stage names were not verified against Cooper's own
materials; the criticisms are widely and consistently reported.

**Why this model borrows the structure but not the gates.** This model is
visibly stage-shaped: need, then classification, then review, then
inspection, then occupancy. What it deliberately does not do is put a
go/kill committee decision between each stage. The gates are automated
where possible, timeboxed with deemed approval where human, and
positioned at irreversibility rather than at every stage boundary. If
adopting this produces a queue of projects awaiting stage decisions, the
adoption has reproduced the failure mode rather than avoided it.

---

## 5. Progressive delivery: the strongest argument against pre-release gating

**Progressive delivery** was coined by James Governor of RedMonk in 2018,
after Microsoft's Sam Guckenheimer described "deployment rings." Its core
move is separating **deployment** (code reaches production) from
**release** (a feature becomes visible to users), using feature flags,
canary releases, and blast-radius limitation.

The governance implication is significant and underappreciated: if you
can limit who is exposed to a change and reverse it in seconds, the value
of approving it in advance drops sharply. Runtime control substitutes for
pre-release approval.

**Confidence: medium-high** on the attribution, which is consistently
reported; the specific 2018 post was not fetched.

This is why chapter 01 gates on irreversibility. Anything you can undo
cheaply and expose gradually does not need a gate. The corollary matters
for AI work specifically: **the irreversible actions in an AI system are
usually not deployments.** They are outbound messages, writes to systems
of record, and credential grants. That is where the gates belong, and
that is what chapter 06's hold points target.

---

## 6. ADRs and RFCs: practices, not findings

**Architecture Decision Records** originate with Michael Nygard's post
"Documenting Architecture Decisions" (2011-11-15), which specifies the
title, context, decision, status, consequences format, scopes them to
"architecturally significant" decisions, and establishes the convention
of marking superseded rather than deleting.
[Source: Nygard](https://cognitect.com/blog/2011/11/15/documenting-architecture-decisions)
**Confidence: high**, fetched directly. **MADR** and Nat Pryce's
**adr-tools** are real, though not independently verified here.

Real RFC processes worth studying for their handling of the bounded-time
problem: the **Rust RFC process**, notably its 10-day final comment
period with an explicit merge, close, or postpone outcome, and the
**IETF** standards track under BCP 9, amended by **RFC 6410** in 2011 to
reduce three maturity levels to two, with Internet Standard requiring at
least two independent interoperable implementations.
**Confidence: medium-high**, not independently fetched.

No claim is made that these improve outcomes measurably. They are
conventions that make decisions legible later, and this model adopts them
for that reason alone. The Rust final comment period is the specific
mechanism chapter 04's deemed-approval rule imitates.

---

## 7. Where this model is guessing

Stated plainly, because principle 3 demands it and because a governance
document that hides its own uncertainty has no standing to ask for
rigor.

| Design choice | Basis |
|---|---|
| Three tiers rather than four or five | Judgment. No evidence on optimal tier count. Three because more invites boundary arguments. |
| The specific trigger thresholds in chapter 03 | Judgment, except the lethal trifecta, which is a reasoned rule rather than a measured one. |
| Five hold points | Modeled on real inspection sequences. No evidence this is the right number for software. |
| 3-day and 10-day turnarounds | Invented. Pick numbers you can actually meet. |
| Deemed approval on turnaround expiry | Reasoned from the DORA batch-size mechanism plus the Rust FCP convention. Untested here. |
| 90-day temporary occupancy | Invented, and probably the most arbitrary number in the model. |
| Review intervals (annual, 6-month, quarterly) | Invented. |
| The two-signature rule for transient builders | Structural reasoning about workforce, not evidence. No published higher-ed practice on this was located. |
| Requiring Tier 3 reviewer independence | Analogy to IBC special inspection. Sound reasoning; the analogy is not evidence. |

The trigger rules, hold-point placement, and independence requirement are
the parts of this model I would defend hardest. The specific numbers are
the parts I would change first on contact with reality, and amendments
reporting what actually worked are the most valuable contribution anyone
can make to this document.

---

## 8. What nobody has measured

Open questions that would change this model if answered:

- Does any of this reduce actual harm from AI systems in higher
  education? No study located. Everything here is reasoning from adjacent
  evidence.
- Do intake gates reduce wasted effort more than they suppress useful
  experimentation? Genuinely unknown, and it cuts both ways.
- Does the registry stay accurate in practice without enforcement? This
  model bets heavily on it via chapter 07 and retainage, and that bet is
  untested.
- What fraction of AI capabilities in a decentralized institution are
  ever visible to central IT at all? Numbers exist in vendor and survey
  reporting, but nothing verifiable was located, so no figure is quoted
  anywhere in this model.

If you adopt this and measure any of the above, that result is worth more
than the rest of this appendix.
