# 05. Authorization to Build

A building authorization is a narrow instrument, and its narrowness is what
makes it useful. It says: *this* work, at *this* location, per *these*
reviewed documents, subject to *these* inspections, and it **expires**.

Three properties are worth importing exactly.

**An authorization authorizes construction, not occupancy.** Holding an authorization
does not entitle you to move in. That requires a separate certificate,
after inspections. Software governance almost never separates these, and
collapsing them is why "it's approved" comes to mean "it's live."

**An authorization carries conditions.** Approval is routinely conditional, and
the conditions are enforceable rather than advisory.

**An authorization expires.** Real authorizations lapse if work does not start, or does
not progress, within a stated period. This is the mechanism that keeps
an authorization from becoming a permanent entitlement, and it is the
single most under-used idea in software governance.

---

## What each tier authorizes

### Tier 1: Self-Certified

Analogous to work that needs no authorization: painting, replacing a fixture.
Real codes exempt this work explicitly rather than by omission, and the
exemption list is published.

- **Self-certified.** The builder records the Statement of Need and
  proceeds.
- **Automated inspections still apply.** Exempt from review, not from
  the checks that run in the pipeline.
- **Occupancy self-issued**, valid only within declared scope.
- **Any trigger crossing into Tier 2 voids it immediately.** The build
  stops until the higher authorization is issued.

Publish your Tier 1 exemptions as a list. An unpublished exemption is
an invitation to argue.

### Tier 2: Standard Authorization

- Peer design review with a published turnaround, per chapter 04
- Automated inspections plus one human verification point (concealment, H4)
- Occupancy issued by a peer who is not the builder
- Conditions attached and recorded

### Tier 3: Independent Review

- Independent review by someone off the project
- Full hold-point set with human sign-off at H1, H4, and H5
- Occupancy issued by the Final Decision Authority
- A named standing institutional owner is a precondition, not a
  deliverable
- Time-limited by default; renewal requires the record review from
  chapter 07

---

## Conditions of approval

Conditions are how a reviewer says yes to something that is not yet
safe. They are written into the authorization, and each must be verifiable at a
named verification point. A condition nobody checks is a wish.

Standard conditions worth having in every institution's amendments:

| Condition | Verified at |
|---|---|
| Budget cap set, with a hard stop rather than an alert | H1 |
| Credential scoped to the declared minimum | H1 |
| Key expiry set within institutional maximum | H1 |
| No secrets in source, config, or client files | H1 |
| Egress limited to the declared inventory | H2 |
| Tool definitions pinned; drift alarms | H2 |
| Logging enabled and not caller-suppressible | H4 |
| Human oversight point present and reachable | H4 |
| Guardrails enabled on the paths that actually carry traffic | H5 |
| Registry entry complete with named owner | H5 |

That last-but-one condition needs care, and it is the kind of thing
[appendix B](../reference/platform-controls.md) exists to catch:
guardrail coverage is frequently uneven across a platform's APIs. On
LiteLLM the documented limitation is that the unified guardrail path does
not extend to the Responses API, embeddings, or speech, and at least one
real deployment's own gateway documentation states flatly that guardrails
work only with Chat Completions. A condition reading "guardrails enabled"
is therefore satisfiable while the traffic that matters flows down an
unguarded path. Write conditions against the paths in the data flow
diagram, not against a settings page, and **test the path rather than
reading the setting.**

---

## Expiry, and why it matters most

| Authorization event | Default |
|---|---|
| Work must begin within | 60 days of issue |
| Authorization lapses if no inspection passes within | 180 days |
| Tier 3 authorizations expire at | 12 months, renewable |

Lapsing is not a punishment. It is garbage collection. Institutions
accumulate approved-but-abandoned projects, and each one is a live
credential, a budget line, and an unowned integration. Expiry converts
that silent accumulation into a scheduled question.

The related move, and the one that does the most good in practice, is
in [chapter 07](07-production-approval.md): pilots get a **temporary**
production approval with a real expiry date. "Pilot" is otherwise
the most durable state in institutional computing.

---

## Stop work

Real codes let a governance platform team order work stopped: for
unauthorizationted work, for proceeding past an uninspected verification point, or for
an immediate hazard.

The equivalent authority here should be narrow, fast, and rarely used.
Grounds:

- Work proceeding past a failed or skipped verification point
- Data flowing that the authorization does not authorize, especially a class
  the institution's policy forbids
- An active credential exposure
- A capability operating outside its declared scope

The action is proportionate and reversible where possible: disable the
key, unpublish the tool, deactivate the workflow. Not "delete the
project."

**Whoever holds stop-work authority must be named in your amendments,
and it must be a small number of people who can be reached quickly.**
Emergency authority that requires a committee is not emergency
authority. Equally, stop-work used routinely is a sign the earlier
stages are not working, and it should be tracked as a defect in the
process rather than a success of enforcement.

---

## Recorded Exceptions

Construction allows a recorded exception: a documented, justified departure from
the code, granted by a named authority, recorded permanently.

Have this, and make it respectable. A governance model with no legitimate
exception path gets bypassed rather than amended, and then you have lost
both the control and the information.

A recorded exception records: which requirement, why compliance is impractical,
what compensating control applies instead, who granted it, and when it
will be revisited.

Track recorded exceptions in aggregate. **Repeated recorded exceptions against the same
requirement are evidence the requirement is wrong**, not evidence that
builders are unruly. That feedback loop is how a model code improves
between editions, and it is why chapter 01 asks you to delete gates that
never catch anything.
