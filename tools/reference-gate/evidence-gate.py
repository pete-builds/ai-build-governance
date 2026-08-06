#!/usr/bin/env python3
"""Reference gate: fail a pull request when a Tier 2 or Tier 3 capability lands
without the verification-point evidence its tier requires.

This enforces ONE narrow thing. It is not an implementation of the governance
model, and it cannot be. It checks that declared evidence exists, is non-empty,
and at Tier 3 was signed by somebody other than the person opening the change.
It does not and cannot check whether the evidence is true.

Usage, from the root of a repository that holds a capability:

    evidence-gate.py --manifest governance/capability.yml \
                     --points   reference/requirements.json \
                     --author   "$PR_AUTHOR"

Exit codes: 0 pass, 1 evidence missing or unsigned, 2 the manifest itself is
unusable. A non-zero exit is meant to fail the pull request.
"""

import argparse
import json
import os
import sys

TIER_KEYS = {"1": "tier_1", "2": "tier_2", "3": "tier_3"}


def read_manifest(path):
    """Read the small subset of YAML this needs: flat `key: value` and
    `key:` followed by `  - item` lists. Deliberately not a YAML parser, so
    that the gate has no dependencies an institution has to vet."""
    if not os.path.exists(path):
        die(2, f"no manifest at {path}. A governed capability declares its tier "
               f"in one; see tools/reference-gate/capability.example.yml")
    data, current = {}, None
    with open(path, encoding="utf-8") as fh:
        for raw in fh:
            line = raw.split("#", 1)[0].rstrip()
            if not line.strip():
                continue
            if line.lstrip().startswith("- ") and current:
                data[current].append(line.lstrip()[2:].strip().strip("\"'"))
                continue
            if ":" not in line:
                continue
            key, _, val = line.partition(":")
            key, val = key.strip(), val.strip().strip("\"'")
            if val:
                data[key], current = val, None
            else:
                data[key], current = [], key
    return data


def die(code, msg):
    print(f"evidence-gate: {msg}", file=sys.stderr)
    sys.exit(code)


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--manifest", default="governance/capability.yml")
    ap.add_argument("--points", default="reference/requirements.json")
    ap.add_argument("--author", default=os.environ.get("PR_AUTHOR", ""))
    ap.add_argument("--evidence-dir", default=None)
    args = ap.parse_args()

    man = read_manifest(args.manifest)

    tier = str(man.get("tier", "")).strip()
    if tier not in TIER_KEYS:
        die(2, f"manifest declares tier {tier!r}; expected 1, 2 or 3. "
               f"Classification is chapter 03 and is not optional.")

    if tier == "1":
        print("evidence-gate: Tier 1, self-certified. Nothing for this gate to check.")
        return 0

    try:
        with open(args.points, encoding="utf-8") as fh:
            points = json.load(fh)["verification_points"]
    except (OSError, KeyError, json.JSONDecodeError) as exc:
        die(2, f"cannot read verification points from {args.points}: {exc}")

    ev_dir = args.evidence_dir or man.get("evidence_dir") or "governance/evidence"
    tier_key = TIER_KEYS[tier]
    failures, checked = [], 0

    for pt in points:
        mode = pt.get(tier_key, "")
        if not mode:
            continue
        checked += 1
        path = os.path.join(ev_dir, f"{pt['id']}.md")
        if not os.path.exists(path):
            failures.append(f"{pt['id']} ({pt['name']}): no evidence at {path}. "
                            f"Tier {tier} requires this point ({mode}).")
            continue
        with open(path, encoding="utf-8") as fh:
            body = fh.read()
        if len(body.strip()) < 40:
            failures.append(f"{pt['id']} ({pt['name']}): {path} is effectively empty. "
                            f"A file that exists is not evidence.")
            continue
        # Where the tier requires a human, the evidence must name one.
        if "human" in mode:
            signer = None
            for line in body.splitlines():
                low = line.lower()
                if low.startswith("signed-off-by:") or low.startswith("verified-by:"):
                    signer = line.partition(":")[2].strip()
                    break
            if not signer:
                failures.append(
                    f"{pt['id']} ({pt['name']}): tier {tier} requires human "
                    f"verification ({mode}), and {path} carries no "
                    f"`Verified-by:` line naming who did it.")
            elif args.author and signer.lower() == args.author.lower():
                # Requirement 6.13: somebody other than the builder operated it.
                failures.append(
                    f"{pt['id']} ({pt['name']}): verified by {signer}, who opened "
                    f"this change. The model requires someone other than the "
                    f"builder (see model/06-inspections.md, requirement 6.13).")

    if failures:
        print(f"evidence-gate: Tier {tier} capability is missing required evidence.\n",
              file=sys.stderr)
        for f in failures:
            print(f"  - {f}", file=sys.stderr)
        print(f"\n{len(failures)} of {checked} required verification points did not "
              f"pass this gate.", file=sys.stderr)
        print("This gate checks that evidence exists and was signed by someone "
              "else. It does not check that the evidence is true.", file=sys.stderr)
        return 1

    print(f"evidence-gate: Tier {tier}, {checked} verification points have "
          f"non-empty evidence, and every point needing a human names one who is "
          f"not the author.")
    print("That is all this gate verifies. It is not a production approval.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
