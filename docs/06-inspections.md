# 06. Inspections

This is the chapter that does the actual work.

Building inspection is not a review of intentions. An inspector looks at
the physical thing, at a defined moment, against a published standard,
and either passes it or does not. The sequencing is what makes it
effective, and the sequencing follows one rule:

> Work must not be covered, closed in, or concealed until it has been
> inspected and approved.

If concealed work needs verifying, the building official can require it
uncovered, at the permit holder's expense. That threat is what makes the
schedule real.

Every hold point below exists because something is about to become
invisible, expensive to check, or hard to undo.

---

## The five hold points

Real inspection sequences run roughly: footing and foundation, then
under-slab and rough-in for plumbing, mechanical and electrical, then
framing, then insulation and wall covering, then final. Framing is
inspected only *after* the rough-ins inside it have passed, because
otherwise the framing hides them.

That dependency structure is the part to copy.

```
  H1  FOUNDATION      identity, secrets, credentials, budget
       |              before any real data moves
       v
  H2  ROUGH-IN        connections, tools, permissions, egress
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

| Hold point | Tier 1 | Tier 2 | Tier 3 |
|---|---|---|---|
| H1 Foundation | Automated | Automated | Automated + human |
| H2 Rough-in | Automated | Automated | Automated + human |
| H3 Framing | Automated | Automated | Automated |
| H4 Concealment | Automated | **Human** | **Human** |
| H5 Final | Automated | Automated | **Human** |

Most cells say automated. That is the design working. Human attention
appears at concealment and at final sign-off for high-consequence work,
which is where a machine genuinely cannot help.

---

## H1: Foundation

**Before any real data moves through the system.**

Concealed here: how the thing authenticates and what it can spend.
Credentials get embedded in configuration, CI, and developer machines
very early, and after that they are extremely hard to inventory.

Automated checks:

- [ ] No secrets in source, config, or committed client files. Scan
      history, not just the working tree.
- [ ] Credential scope matches the declared minimum from plan review.
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
[appendix B](../appendix/b-platform-controls.md):

**Cost-pool identifiers may be the only access control on a shared
budget.** Where a gateway implements shared pools as tags, the tag
string can be the entire protection, and it may be attachable from a
request header rather than only from the key. Treat pool identifiers as
secrets with real entropy, never as readable names.

**Administrative accounts may be exempt from the limits you just set.**
LiteLLM documents that rate limits do not apply to proxy admin users.
Verify which of your controls have privileged exemptions, and issue
privileged credentials as their own recorded event.

---

## H2: Rough-in

**Before the system is wired to real systems of record.**

Concealed here: the connection graph. Once a system has fifteen
integrations, nobody re-derives what it can reach.

Automated checks:

- [ ] Tool and integration inventory matches plan review, with no extras
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

### MCP-specific inspection

Pin this to a spec revision and record which one, exactly as a permit
records the code edition it was reviewed under. Verified against
revision **`2026-07-28`**.

- [ ] **Transport** is Streamable HTTP for networked servers. HTTP+SSE
      was replaced in revision `2025-03-26` and is formally deprecated
      as of `2026-07-28`. `stdio` remains current for local servers.
- [ ] Local HTTP servers validate the `Origin` header and bind to
      localhost only
- [ ] Server implements **RFC 9728** protected resource metadata (spec
      MUST)
- [ ] Client sends the **RFC 8707** `resource` parameter and the server
      **validates token audience** (spec MUST)
- [ ] **No token passthrough.** The spec is explicit: servers MUST NOT
      accept tokens that were not issued for them.
- [ ] Proxy servers implement per-client consent, against the confused
      deputy problem (spec MUST)
- [ ] OAuth 2.1, with PKCE. Flag RFC 7591 dynamic client registration as
      deprecated in favor of Client ID Metadata Documents.
- [ ] Scopes minimized, no wildcards
- [ ] **Full untruncated tool descriptions** reviewed by a human. Tool
      poisoning hides instructions in descriptions that client UIs
      truncate.
- [ ] Tool descriptions pinned, drift alarms live. A server revising a
      description after approval is the rug pull.
- [ ] Reviewed **alongside the other servers it will be deployed with**,
      not in isolation, because one server's descriptions can influence
      behavior toward another.
- [ ] Component versions checked against published advisories, at
      minimum CVE-2025-49596 (MCP Inspector, fixed 0.14.1),
      CVE-2025-6514 (`mcp-remote`, fixed 0.1.16), CVE-2025-53110
      (official filesystem server, fixed 2025.7.1)
- [ ] Client configuration files holding third-party keys are not
      world-readable

Two things to internalize rather than merely check.

**Descriptions load before invocation.** `tools/list` content enters the
model's context at connection time, so a server can influence behavior
**without ever being called**. "We will review it when something
actually uses it" is not a strategy.

**Nobody is inspecting these for you.** Anthropic's security
documentation states it "does not security-audit or manage any MCP
server," and the official registry validates publisher namespace
ownership only, with no malware scanning or security review. Registry
presence tells you who published something. It is a business license,
not a certificate of occupancy.

---

## H3: Framing

**The end-to-end path exists and is visible. Requires H1 and H2 passed.**

The dependency is the point: framing hides the rough-ins, so the
rough-ins are inspected first. Here, the working system hides its own
component structure once it starts being treated as a black box.

Automated checks:

- [ ] H1 and H2 recorded as passed
- [ ] End-to-end path exercised with synthetic data
- [ ] Failure behavior matches what plan review described, verified by
      actually breaking a dependency rather than by assertion
- [ ] Errors surface rather than being swallowed
- [ ] No real regulated data used in testing

---

## H4: Concealment

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
- [ ] Logging is **not suppressible by the caller**. This one is
      specific and load-bearing: LiteLLM's per-request `"no-log": true`
      suppresses logging unless an administrator has set
      `global_disable_no_log_param`. Verify the administrative setting,
      not the intention.
- [ ] A human can see what the system did, after the fact, without
      developer access
- [ ] Consequential actions are reversible, or gated on confirmation
- [ ] The oversight point from plan review exists in the running system
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

Note the platform trap from [appendix B](../appendix/b-platform-controls.md):
where an Agent Studio retains execution data by default (336 hours on the
reference platform) and its redaction mechanics are unverified, **assume
every field a workflow touches is in that store** until you have looked.

### The Agent Studio problem

"Agent Studio" here means any low-code environment where people compose
automations and agents visually and publish them, holding credentials to
institutional systems. Where such a platform has **no publish gate**,
this hold point is the only control that exists.

The specifics below were verified against n8n. Verify your own.

n8n's documentation describes clicking Publish to make changes live,
with no reviewer, sign-off, or approval step in the flow, and changes
limited to settings can republish without a click. Edit access is
production change authority. Compounding it, sharing a workflow grants
editors implicit use of the credentials that workflow uses, including
credentials never explicitly shared with them.

So for workflow builds:

- [ ] Named list of who holds edit access, reviewed at this hold point
- [ ] Credential exposure implied by that edit access is stated
      explicitly and accepted by the owner
- [ ] `n8n audit` run and findings triaged. Note it is a point-in-time
      **configuration scanner**, not an activity log: it does not tell
      you who changed what.
- [ ] Execution data retention understood. Default pruning is 336 hours
      and 10,000 executions. Assume any data the workflow touches is in
      execution logs until proven otherwise.
- [ ] Change detection external to the platform, since the platform will
      not tell you a workflow was republished

---

## H5: Final

**Before occupancy. Real data, real configuration.**

Checks:

- [ ] All prior hold points passed and recorded
- [ ] Exercised with real data at real scale
- [ ] **Guardrails verified on the paths that actually carry traffic**,
      not merely enabled somewhere. Coverage is uneven across platform
      APIs. On LiteLLM the documented limitation is that the unified
      guardrail path does not extend to the Responses API, embeddings, or
      speech, and at least one real deployment documents flatly that
      guardrails work only with Chat Completions. Test the path in the
      data flow diagram rather than reading a settings page.
- [ ] Budget and rate limits confirmed live under load
- [ ] Permit conditions each verified, individually
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

**Automated checks run on every change, not once.** A hold point that
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
[appendix C](../appendix/c-evidence-on-gates.md) is specifically about
what happens then.
