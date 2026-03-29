# Commit Convention

## Principles
- One commit should represent one coherent change
- Do not mix unrelated changes in a single commit
- Commits must stay within the current milestone scope
- Validation must pass before commit unless the commit is explicitly marked as WIP

## When to Commit
- Commit after completing a meaningful, reviewable unit of work
- Prefer 1~3 commits per milestone PR
- Do not create excessive micro-commits for trivial intermediate states

## Allowed Commit Types
- `feat`: new functionality
- `fix`: bug fix
- `refactor`: internal restructuring without behavior change
- `test`: add or update tests
- `docs`: documentation only
- `chore`: tooling or maintenance changes

## Commit Message Format
`<type>(<scope>): <summary>`

Examples:
- `feat(auth): add Kakao login button`
- `fix(api): handle empty response payload`
- `test(subway): add station search coverage`

## Commit Scope Rules
- Scope should be the module, feature, or domain area changed
- Avoid vague scopes like `misc` or `update`

## Commit Content Rules
- Include code, tests, and related small documentation together when they belong to the same change
- Do not include formatting-only changes unless they are isolated and intentional
- Do not include unrelated file cleanups

## WIP Commits
- Avoid WIP commits on PR branches unless necessary
- If used, squash or clean them up before merge
