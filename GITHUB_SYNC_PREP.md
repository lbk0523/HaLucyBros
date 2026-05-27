# GitHub Sync Prep

Target repository: `https://github.com/lbk0523/HaLucyBros`

## Current Local State

As of 2026-05-27:

- Local folder: `/Users/byung/Documents/halucy bros`
- The folder is not currently a git repository.
- The latest recorded remote probe, `git ls-remote --exit-code https://github.com/lbk0523/HaLucyBros.git HEAD`, returned exit code `2` with no output from this environment.

This does not prove the repository is absent. It may be private, inaccessible from the current credentials, empty, or temporarily unavailable. Re-check remote access before any sync action.

## Sync Decision

Recommended path: **clone remote first if access is available**.

Reason:

- The remote may already contain files.
- The current local folder is not a git repository.
- Clone-first reduces the chance of overwriting or mixing remote state with local planning artifacts.

Fallback path:

- Initialize the current folder only after remote access and remote contents are understood.
- Do not use current-folder init as the default path.

## Files Ready for Review Before Sync

Phase 0 files currently ready for review:

- `HALUCY_FOUNDATION.md`
- `CONTEXT.md`
- `Halucy Codex 구현 계획.md`
- `PHASE0_CLOSEOUT.md`
- `GODOT_TARGET.md`
- `GITHUB_SYNC_PREP.md`
- `agents/HANDOFF_MAP.md`
- `agents/profiles/research_agent.yaml`
- `agents/profiles/art_agent.yaml`
- `agents/profiles/implementation_agent.yaml`
- `agents/profiles/qa_agent.yaml`
- `agents/profiles/learning_librarian_agent.yaml`
- `schemas/agent_profile.schema.json`
- `schemas/work_package.schema.json`
- `schemas/run.schema.json`
- `schemas/review.schema.json`
- `schemas/learning_card.schema.json`
- `templates/learning-card.md`
- `learning_cards/candidate/.gitkeep`
- `learning_cards/working/.gitkeep`
- `learning_cards/canonical/.gitkeep`
- `learning_cards/policy/.gitkeep`

Do not include:

- `.DS_Store`
- local temporary files
- generated Godot project files
- export presets
- build or smoke-test scripts before they are intentionally created
- sample Work Package, Run, Review, or Learning Card files before they are intentionally created

## Pre-Sync Checklist

- Re-check GitHub repository access with the intended account.
- Confirm whether the remote repository already contains files.
- Confirm whether the remote default branch exists.
- Confirm final document names.
- Confirm `.DS_Store` and other local-only files are excluded.
- Confirm all JSON schemas parse.
- Confirm all YAML profiles parse.
- Confirm handoff map still matches `agents/profiles/*.yaml`.
- Confirm no private API keys, tokens, or personal notes are included.
- Create a first commit only after document review.

## Proposed First Commit Scope

Commit title:

```text
docs: establish Halucy phase 0 architecture
```

Commit contents:

- foundation and context documents
- Phase 0 closeout
- phase-based implementation plan
- Godot target decision
- agent profiles
- handoff map
- Phase 0 schemas
- Learning Card template and store placeholders

## Execution Notes

Do not push until remote access and contents are confirmed.

If clone succeeds:

1. Clone the remote into a clean folder.
2. Inspect remote files.
3. Copy only reviewed Phase 0 files into the clone.
4. Run parse and boundary checks.
5. Commit reviewed files.

If clone fails:

1. Identify whether the cause is auth, wrong URL, private repo access, or empty/uninitialized remote state.
2. Do not initialize and push from the current folder until that cause is understood.
