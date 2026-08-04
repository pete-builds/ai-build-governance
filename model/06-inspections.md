# 06. Inspections

This is the chapter that does the actual work.

Building inspection is not a review of intentions. An inspector looks at
the physical thing, at a defined moment, against a published standard,
and either passes it or does not. The sequencing is what makes it
effective, and the sequencing follows one rule:

> Work must not be covered, closed in, or concealed until it has been
> inspected and approved.

If concealed work needs verifying, the governance platform team can require it
uncovered, at the authorization holder's expense. That threat is what makes the
schedule real.

Every verification point below exists because something is about to become
invisible, expensive to check, or hard to undo.

---

## The five verification points

Real inspection sequences run roughly: footing and foundation, then
the stage where wiring and pipework go in ("rough-in"), then
framing, then insulation and wall covering, then final. Framing is
inspected only *after* the connections inside it have passed, because
otherwise the frame hides them.

That dependency structure is the part to copy.

```
  H1  FOUNDATION      identity, secrets, credentials, budget
       |              before any real data moves
       v
  H2  CONNECTIONS     tools, permissions, egress paths
       |              before wiring to real systems
       v
  H3  FRAMING         end-to-end path visible
       |              requires H1 and H2 passed
       v
  H4  CONCEALMENT     the do-not-conceal gate
       |              before abstraction, autonomy, or a nice UI
       v
  H5  FINAL           real data, real guardrails, real records
                      precondition for occupancy
```

| Verification point | Tier 1 | Tier 2 | Tier 3 |
|---|---|---|---|
| H1 Identity and Credentials | Automated | Automated | Automated + human |
| H2 Connections and Permissions | Automated | Automated | Automated + human |
| H3 End-to-End Path | Automated | Automated | Automated |
| H4 Pre-Concealment | Automated | **Human** | **Human** |
| H5 Final Verification | Automated | Automated | **Human** |

Most cells say automated. That is the design working. Human attention
appears at concealment and at final sign-off for high-consequence work,
which is where a machine genuinely cannot help.

---

## H1: Identity and Credentials

**Before any real data moves through the system.**

Concealed here: how the thing authenticates and what it can spend.
Credentials get embedded in configuration, CI, and developer machines
very early, and after that they are extremely hard to inventory.

Automated checks:

- [ ] No secrets in source, config, or committed client files. Scan
      history, not just the working tree.
- [ ] Credential scope matches the declared minimum from design review.
      Flag wildcard scopes explicitly.
- [ ] Key expiry set, within the institutional maximum
- [ ] Budget cap set as a hard stop, not a soft alert
- [ ] Rate limits set
- [ ] Model allowlist set rather than inherited default-all
- [ ] Key is attributable to a service account or a named human, not a
      shared team secret

Human check at Tier 3:

- [ ] Is the credential's scope actually the minimum, or the minimum
      that was convenient? Ask what breaks if each permission is removed.

Two platform-specific traps, drawn from
[appendix B](../reference/platform-controls.md):

> **REQUIREMENT**
> Two classes of trap **MUST** be checked, because both are common and
> neither is visible from the credential itself.
>
> **Shared cost pools may be protected by nothing but their identifier.**
> Where a gateway implements shared budgets by a name or tag, that string
> can be the entire access control. Pool identifiers **MUST** be generated
> with real entropy and treated as secrets, never chosen for readability.
>
> **Privileged accounts may be exempt from the limits you just set.** You
> **MUST** establish which of your controls have administrative exemptions,
> and issue privileged credentials as their own recorded event.

> **GUIDANCE**
> The specific behavior on your platform is a profile question, not a code
> question. See [reference/platform-profiles/](../reference/platform-profiles/).
> If nobody has written a profile for your stack, writing one is the first
> useful thing to do.

---

## H2: Connections and Permissions

**Before the system is wired to real systems of record.**

Concealed here: the connection graph. Once a system has fifteen
integrations, nobody re-derives what it can reach.

Automated checks:

- [ ] Tool and integration inventory matches design review, with no extras
- [ ] Egress inventory matches, with no undeclared outbound paths
- [ ] Tool definitions **pinned by hash or version**, with drift alarms
- [ ] Transport meets current standard (see the MCP checklist below)
- [ ] No credential is passed through to a downstream service that was
      not issued for it
- [ ] Private and link-local address ranges blocked for any
      server-supplied URL the client will fetch

Human check at Tier 3:

- [ ] Could an attacker who controls the untrusted input reach anything
      in the egress inventory? Trace one concrete path end to end.

### Protocol-specific inspection

> **REQUIREMENT**
> Where a build exposes or consumes tools over a protocol, the inspection
> **MUST** be pinned to a **stated protocol revision**, and the revision
> **MUST** be recorded, exactly as an authorization records the code edition it was
> reviewed under.

> **GUIDANCE**
> Protocol revisions move fast enough to invalidate a checklist within
> months. The full checklist lives in
> [templates/inspection-mcp-server.md](../templates/inspection-mcp-server.md)
> rather than here, so it can be re-pinned without amending the code, and so
> this chapter stays about verification points rather than becoming a security
> manual. Current protocol facts are in
> [reference/platform-profiles/mcp.md](../reference/platform-profiles/mcp.md).

Two properties generalize beyond any one protocol and belong in the code:

> **REQUIREMENT**
> **Tool definitions MUST be pinned, with drift alarmed.** A server that
> revises a tool description after approval has voided the approval.

> **REQUIREMENT**
> **Tool descriptions MUST be reviewed in full, untruncated, by a human, and
> alongside the other servers the build will run with.** Descriptions can
> influence model behavior before any tool is invoked, and one server's
> descriptions can influence behavior toward another, so a server cannot be
> cleared in isolation.

> **GUIDANCE**
> The second requirement is the one people skip because it feels
> paranoid. It is the documented attack. "We will review it when something
> calls it" does not work when the description loads at connection time.

**Nobody is inspecting these for you.** Platform vendors state plainly that
they do not security-audit third-party servers, and registry presence
establishes who published something rather than whether it is safe. It is a
business license, not a production approval. That absence is the entire
reason this verification point exists.

---

## H3: End-to-End Path

**The end-to-end path exists and is visible. Requires H1 and H2 passed.**

The dependency is the point: the frame hides the connections, so the
connections are inspected first. Here, the working system hides its own
component structure once it starts being treated as a black box.

Automated checks:

- [ ] H1 and H2 recorded as passed
- [ ] End-to-end path exercised with synthetic data
- [ ] Failure behavior matches what design review described, verified by
      actually breaking a dependency rather than by assertion
- [ ] Errors surface rather than being swallowed
- [ ] No real regulated data used in testing

---

## H4: Pre-Concealment Verification

**The most important gate in this model.**

In construction, this is the inspection before insulation and wall
covering. Everything is about to disappear behind a finished surface.

The software equivalent is the moment a system stops showing its work.
That happens when you put an agent behind a clean UI, remove a
confirmation step, chain tool calls without surfacing intermediate
ones, or move it to a schedule so no human is present when it runs.

**Nothing may be concealed until its actions are observable and
reversible.**

Checks:

- [ ] Every consequential action is **logged with enough context to
      reconstruct why it happened**: inputs, tool calls, outputs,
      identity
- [ ] Logging is **not suppressible by the caller.** Verify the
      administrative setting that prevents suppression, not the intention.
      Several gateways honor a per-request suppression flag unless an
      administrator has explicitly disabled it; the flag name for your
      platform is in its
      [profile](../reference/platform-profiles/)
- [ ] A human can see what the system did, after the fact, without
      developer access
- [ ] Consequential actions are reversible, or gated on confirmation
- [ ] The oversight point from design review exists in the running system
- [ ] Rate of consequential actions is bounded per unit time
- [ ] For anything advisory: the **human override rate is measured**.
      Unmeasured, an advisory system is a deciding system, as chapter 03
      notes.

Human sign-off required at Tier 2 and above. This is the one gate worth
a person's time at every tier above minor works, because it is the
transition from a system whose behavior is apparent to one whose
behavior must be inferred.

### Log enough to reconstruct, not everything

Everything above demands observability, and observability creates a new
dataset that **can be more sensitive than the system it observes.** A
trace holding inputs, outputs, tool results, retrieved context, and
identity is a concentrated copy of the very data the tier was assigned to
protect, sitting somewhere nobody classified.

An earlier edition of this model asked for the logging and never asked
this question. The rule is **log enough to reconstruct the event**, not
store every input and output.

- [ ] **Field-level redaction** applied to the classes that need it, and
      verified by inspecting an actual stored trace rather than by reading
      a config
- [ ] **Purpose-limited**: every field retained answers a question someone
      will actually ask. Fields nobody can name a use for get dropped.
- [ ] **Traces are classified at the level of the most sensitive data they
      contain**, and access-controlled to that standard. A Tier 3 system's
      traces are Tier 3 data.
- [ ] **Retention set by data classification**, not by platform default
- [ ] **Operational metrics separated from content-bearing records**, so
      dashboards, alerting, and rate monitoring do not require access to
      prompts and outputs
- [ ] Who may read traces is a named list, reviewed at the same interval
      as the capability

The tension here is real and does not fully resolve. H4 exists so behavior
can be reconstructed, and minimization removes material that might have
been needed. Resolve it deliberately per capability and **record the
choice**, rather than defaulting to logging everything because the
platform does.

Note the platform trap from [appendix B](../reference/platform-controls.md):
where an Agent Studio retains execution data by default (336 hours on the
reference platform) and its redaction mechanics are unverified, **assume
every field a workflow touches is in that store** until you have looked.

### When the platform has no publish gate

> **REQUIREMENT**
> Where the delivery platform provides **no technical approval step before
> production**, this verification point is the only control that exists, and the
> institution **MUST** record that fact rather than describing the review as
> though a gate enforced it.

> **REQUIREMENT**
> In that situation, above Tier 1 the build **MUST** additionally:
> maintain a named list of everyone holding edit access, reviewed at this
> verification point; state and have the Standing Owner accept the **credential
> exposure that edit access implies**; and implement change detection
> **external to the platform**, because the platform will not tell you a
> change went live.

> **REQUIREMENT**
> At least two compensating controls **MUST** be adopted above Tier 1.
> Separate production and development environments, a smaller named group
> with production edit access, export to version control with alerting on
> diff, periodic reconciliation of live artifacts against the registry, and
> a channel where publishes are announced are all acceptable.

> **GUIDANCE**
> This is not hypothetical. At least one widely used Agent Studio platform
> has no publish gate at all, so edit access is production change authority,
> and sharing an artifact conveys use of credentials never explicitly
> shared. Verify your own platform before assuming otherwise:
> [reference/platform-profiles/n8n.md](../reference/platform-profiles/n8n.md).
> The full checklist is
> [templates/inspection-agent-studio.md](../templates/inspection-agent-studio.md).

---

## H5: Final Verification

**Before occupancy. Real data, real configuration.**

Checks:

- [ ] All prior verification points passed and recorded
- [ ] Exercised with real data at real scale
- [ ] **Guardrails verified on the paths that actually carry traffic**,
      not merely enabled somewhere. Coverage is routinely uneven across a
      platform's APIs, so a key with guardrails "enabled" can carry all its
      real traffic down an unguarded path. **Test the path from the data
      flow diagram. Do not read the setting.** Per-platform coverage gaps
      are in the [profiles](../reference/platform-profiles/).
- [ ] Budget and rate limits confirmed live under load
- [ ] Authorization conditions each verified, individually
- [ ] Registry entry complete: owner, operator, data classes, tools,
      egress, tier, review date
- [ ] Rollback exercised, not merely documented
- [ ] Someone other than the builder has operated it successfully

Human sign-off at Tier 3.

The second-to-last item is the one people skip. An untested rollback is
a hypothesis.

---

## Conduct of inspections

**Inspections check the running system, never the description of it.**
An inspection satisfied by a document is a review, and chapter 04
already happened.

**Automated checks run on every change, not once.** A verification point that
fires once at the beginning verifies a state the system has since left.
Where a check can run continuously, it should, and H1 and H2 in
particular should be standing checks.

**A failed inspection is a finding with a named remedy**, not a
judgment. Name what would pass.

**Log the pass, not just the fail.** The record that H4 passed on a date
with a named signer is what makes the alteration path in
[chapter 08](08-alterations.md) meaningful.

**Do not let inspection become review.** If human inspection load grows,
the correct response is more automation or fewer Tier 3 projects, not a
standing meeting. A recurring inspection meeting is a change advisory
board that has not admitted it yet, and the evidence in
[appendix C](../reference/evidence-on-gates.md) is specifically about
what happens then.
