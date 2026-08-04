# 07. Production Approval and Records

Two ideas, and the institution's long-term health depends far more on
the second than the first.

---

## Part 1: Production Approval

A building can be finished and still not legally occupiable. The
production approval is a separate instrument issued after
inspections, and without it, occupancy is unlawful regardless of how
complete the building looks.

**Import the separation.** "It works" and "it may operate" are different
events with different evidence and, importantly, **different signers**.
Collapsing them is why so much software arrives in production by
gradually being used more.

### Issuing a CO

Requires: H5 passed, every authorization condition individually verified, a
complete registry entry, and a named owner and operator who have
acknowledged the role.

| Tier | Issued by |
|---|---|
| 1 | Self-issued, within declared scope |
| 2 | A peer who is not the builder |
| 3 | The Final Decision Authority |

The CO states what is authorized: which data classes, which population,
which tools, which egress. **Operating outside that envelope is
operating without a certificate**, and it is grounds for the stop-work
action in chapter 05. This is what makes the scope statement enforceable
rather than decorative.

### Time-Limited Production Approval: the honest pilot

A TCO is conditional and time-bound. Real ones are issued in fixed
increments, only where the occupied portion is safe, and **continued
occupancy after expiry is unlawful**.

This is the fix for the most durable object in institutional computing:
the permanent pilot.

**Every pilot gets a TCO with a real expiry date.** On that date exactly
one of three things happens:

1. It converts to a full CO, having met the remaining conditions
2. The TCO is renewed once, with the outstanding conditions restated and
   a named owner accountable for them
3. **It is switched off**

Option 3 has to be genuinely available or the other two mean nothing.
The value here is not bureaucratic. It converts an indefinite drift into
a scheduled decision, and it gives the operator a legitimate reason to
ask for resources or permission to stop.

Suggested defaults: 90 days, renewable once for 90. A pilot needing more
than six months is not a pilot; it is unfunded production, and calling it
that is more useful to everyone.

### Operational handover

Construction marks **operational handover** as the point where the
owner can use the work for its intended purpose. It matters because it
triggers things: warranty periods begin, and retained payment is
released.

Import the trigger structure, because it puts consequences in the right
place:

- **Warranty** becomes an explicit support commitment. Who responds when
  this breaks, during what hours, and for how long? An AI capability
  with no named responder is not complete, it is abandoned in advance.
- **Withheld completion** is the leverage. Hold something back until the records
  are done. In construction it is money; here it might be the permanent
  credential, the production budget increase, the public announcement,
  or the project being marked complete on the dashboard people care
  about.

Withheld completion is the mechanism that makes Part 2 actually happen. Without
it, records are a request. With it, they are a condition of being
finished.

---

## Part 2: Deployed System Record

Construction distinguishes **deployed system records**, the contractor's field
markups of what was really installed, from **deployed system record**, the
design professional's clean final compilation. They are legally distinct
documents, and the reason both exist is that what gets built is never
exactly what was drawn.

**The design documents describe intent. The record describes reality.
Governance depends on the second.**

A capability with no accurate record is ungoverned no matter how
carefully it was reviewed on the way in. Review is a moment. The record
is the only artifact that persists, and it is the only thing that
answers the questions you will actually be asked:

- What do we have running?
- What can it reach?
- Who owns it?
- If it broke, who would notice?

### The registry

One entry per capability. Machine-readable, in version control, and
generated from the platform wherever possible rather than typed.

| Field | Notes |
|---|---|
| Identifier | Stable, from the Statement of Need |
| Name and description | Plain language, for someone unfamiliar |
| Tier | Current, with date last classified |
| Owner | Standing institutional role, not just a person |
| Operator | The person actually running it |
| Data classes | As authorized by the CO |
| Population and scale | Who it serves |
| Tools and integrations | With scopes |
| Egress paths | Every one |
| Platform and location | Where it runs |
| CO status | Full, temporary with expiry, or lapsed |
| Last record review | Date |
| Next review due | Date |
| Related ADRs | Links |
| Known limitations | Plain language, including error behavior |

The last field is the one users benefit from most and the one most often
omitted. A capability whose documented limitations are honest is one
people can use safely.

### Keeping it true

A registry that is not maintained is worse than none, because it is
consulted and believed.

**Generate what you can.** Keys, budgets, active workflows, and
registered tools can mostly be enumerated from the platforms. Anything
generated cannot drift.

**Reconcile on a schedule.** Compare the registry against reality and
treat mismatches as findings:

| Mismatch | Meaning |
|---|---|
| In platform, not in registry | Unauthorizationted work. Chapter 08's existing-work path applies. |
| In registry, not in platform | Decommissioned without closing the record, or the record was aspirational |
| Scope wider than the CO authorizes | Operating without a certificate |
| Owner no longer employed | Orphan. Escalate immediately. |

**Record what the platform cannot.** Some facts exist nowhere but the
record. The clearest example, from
[appendix B](../reference/platform-controls.md): where a gateway
implements shared budget pools as tags, the platform does not store
which team owns a pool. That mapping exists **only** where a human wrote
it down. It is a pure deployed-system-record, and if the record is lost, the
information is simply gone.

### Periodic record review

| Tier | Review interval |
|---|---|
| 1 | Annually, or on any trigger change |
| 2 | Every 6 months |
| 3 | Quarterly |

The review asks five questions, in this order:

1. **Is it still used?** If not, decommission. This is the most valuable
   possible outcome and should be recorded as a success.
2. **Is the record accurate?**
3. **Has the tier changed?** Re-run chapter 03's triggers.
4. **Does the owner still exist?**
5. **Are its dependencies still supported?** Model deprecations,
   platform advisories, pinned versions with published vulnerabilities.

Question 5 has teeth in this domain. Models get retired on published
schedules, gateway platforms publish security advisories, and pinned MCP
components accumulate known vulnerabilities. A capability that was
correct at H5 decays without anyone touching it.

### Decommissioning

Closing a record is part of the record. Verify and note:

- [ ] Credentials revoked, not merely unused
- [ ] Budget and pool membership removed
- [ ] Tool or workflow unpublished so nothing can still call it
- [ ] Data retained or destroyed per policy, with the choice stated
- [ ] Dependent systems identified and notified
- [ ] Registry entry marked decommissioned, with date and reason, and
      **kept**

Keep decommissioned entries. Nygard's rule for decision records applies
to capability records too: do not delete, mark superseded. The history of
what an institution tried and retired is genuinely useful, not least for
answering "why don't we just build a thing that does X" for the fourth
time.
