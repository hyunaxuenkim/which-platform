# Workflows

This repository uses a plan-first, milestone-driven workflow.
The default expectation is that the agent drives the flow after the user approves the plan.

## Standard Flow

1. Start by creating a `plan.md` for the topic.
2. Use `docs/template/plan_template.md` as the starting point.
3. The agent drafts the initial plan.
4. Store the active topic plan at `docs/topics/<topic-name>/plan.md`.
5. The user reviews and approves the plan before implementation starts.
6. After approval, create `topic/<topic-name>` from the latest `main`.
7. Commit the approved `plan.md` to the topic branch.
8. For each milestone, create `milestone/<topic-name>/mX-<short-name>` from the latest `topic/<topic-name>`.
9. Implement only that milestone's scope on the milestone branch.
10. Run local validation before commit:
   - `flutter pub get`
   - `flutter analyze`
   - `flutter test`
11. Create a focused commit that stays within the milestone scope.
12. Push the milestone branch.
13. Open a PR from the milestone branch to `topic/<topic-name>`.
14. Write the PR body following `docs/template/pull_request_template.md`.
15. Wait for required CI checks to finish.
16. If CI fails:
    - inspect the failed job
    - fix the issue on the same milestone branch
    - push again
    - wait for CI again
17. Notify the user only after the PR is open and CI is passing.
18. Request user review and approval for the milestone PR.
19. After all milestones are merged into the topic branch, open a final PR from `topic/<topic-name>` to `main`.
20. After the topic is fully complete, move the finalized `plan.md` from `docs/topics/<topic-name>/plan.md` to `docs/archive/<topic-name>/plan.md`.

## Branch Preconditions

- Before implementing a milestone, confirm the current branch matches the target milestone branch.
- If the current branch does not match the milestone being implemented, switch to the correct base branch and create the proper milestone branch before making code changes.
- Do not continue milestone work on a previous milestone branch just because the code happens to be compatible.

## Stacked Milestones

- The default rule is still: create each milestone branch from the latest `topic/<topic-name>`.
- If the next milestone depends on code that exists only on an earlier milestone branch that has not been merged yet, use a stacked branch.
- In that case, create the new milestone branch from the dependent milestone branch instead of from `topic/<topic-name>`.
- Open the dependent milestone PR against the previous milestone branch first.
- After the previous milestone is merged, retarget the dependent milestone PR to `topic/<topic-name>` if needed.
- State clearly in the PR body when a milestone PR is stacked on another unmerged milestone.

## Ownership Expectations

- The agent and user design the plan together.
- The canonical plan location for an active topic is `docs/topics/<topic-name>/plan.md`.
- Move the plan to `docs/archive/<topic-name>/plan.md` only after all milestones for that topic are complete.
- The user is the approval point for the plan and each milestone PR.
- After plan approval, the agent is expected to drive milestone execution with minimal extra prompting.
- The agent should create branches, run validation, prepare commits, and prepare PR content unless blocked by tooling or permissions.

## PR Expectations

- Every milestone PR must target the corresponding `topic/<topic-name>` branch.
- Every final topic PR must target `main`.
- PR descriptions must follow the repository PR template.
- The PR body should be filled with actual milestone-specific content, not left as an empty template.
- GitHub branch protection should block direct pushes to `main`.
- GitHub branch protection should require required CI checks before merging to `main`.

## Validation Rules

Local validation:
- `flutter pub get`
- `flutter analyze`
- `flutter test`

PR validation:
- All required GitHub Actions checks must pass before requesting review
- If CI fails, inspect the failed job, fix the issue, push again, and wait for CI to pass
