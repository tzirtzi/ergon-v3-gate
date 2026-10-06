# ergon-v3-gate

A throwaway, public repository for Ergon's V3 exit gate (Ergon roadmap §15; the spec is
`specs/drills/v3-exit-gate.yaml` in the Ergon repository). Ergon runs a dependency diamond here:
A writes `gate/a.txt`; B and C, in parallel after A, write `gate/b.txt` and `gate/c.txt`; D, after
both, writes `gate/d.txt`. Ergon pushes D's branch, opens a draft pull request, follows the CI below
and marks the pull request ready when it passes. Nothing here is merged or kept.
