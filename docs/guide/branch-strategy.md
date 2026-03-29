# Branch Strategy

## Branch Types

### 1. `main`
- The production-ready branch
- Must remain stable at all times
- No direct pushes
- Only reviewed and approved topic-level changes are merged into this branch

### 2. `topic/<topic-name>`
- The integration branch for a single topic
- Associated with the topic's `plan.md` at `docs/archive/<topic-name>/plan.md`
- Collects the results of all milestones defined in that plan
- Each milestone branch opens its PR against this branch
- Once the topic is complete, this branch opens a final PR to `main`

### 3. `milestone/<topic-name>/mX-<short-name>`
- A branch for implementing exactly one milestone
- Each milestone branch must contain work for only one milestone
- After implementation, it opens a PR against `topic/<topic-name>`
- The milestone PR is merged only after user approval

---

## Workflow

1. A new topic starts with a `topic/<topic-name>` branch and a `plan.md`.
2. The canonical topic plan path is `docs/archive/<topic-name>/plan.md`.
3. The `plan.md` defines the milestones for that topic.
4. Each milestone is implemented in `milestone/<topic-name>/mX-<short-name>`.
5. After completing a milestone, run validation and open a PR against `topic/<topic-name>`.
6. The user reviews and approves each milestone PR.
7. After all milestones are merged, open a final PR from `topic/<topic-name>` to `main`.
8. Merge into `main` only after the final PR is approved.

---

## Rules

- Do not push directly to `main`.
- Protect `main` in GitHub so direct pushes are blocked.
- Require required CI checks to pass before merging to `main`.
- Each milestone branch must contain work for only one milestone.
- The base branch for a milestone PR must always be the corresponding `topic/<topic-name>`.
- Do not open a PR directly to `main` before the topic is complete.
- Every milestone must be merged only after user approval.
- A milestone branch should be created from the latest `topic/<topic-name>` branch.
- After a milestone PR is merged, the milestone branch can be deleted.
