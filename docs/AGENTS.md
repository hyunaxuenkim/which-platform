# 🤖 [AGENTS.md]

This repository follows a **plan-first, milestone-driven, PR-validated development system**.
Agents must strictly follow the rules defined in this document.

---

# Before starting any work
- Read `docs/guide/workflow.md`

---

# Required Reading by Task
- For workflow, read: `docs/guide/workflow.md`
- For branch, read: `docs/guide/branch-strategy.md`
- For commit, read: `docs/guide/commit-convention.md`
- For PR, read: `docs/template/pull_request_template.md`
- For project information, read: `docs/domain`

---

# Local Repository Structure
- docs/archive → source of truth for scope and milestones that already finished
- docs/archive/<topic-name>/plan.md → canonical location for each topic plan
- docs/domain → source of domain informations

---

# ⚠️ Agent Constraints

Agents MUST:

- run local validation before commit
- create a focused commit for the completed milestone work
- push the milestone branch
- open a PR to the correct base branch
- wait until all required CI checks pass
- if CI fails, inspect the failure, fix it, and push again

Agents MUST NOT:

- modify unrelated files
- skip validation
- introduce hidden changes
- expand scope without updating plan
- merge code without PR
