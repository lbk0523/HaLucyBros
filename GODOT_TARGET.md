# Godot Target Decision

## Decision

Halucy starts with a **Godot 4.x desktop-first, web-capable prototype target**.

- Primary target for Phase 1: local desktop runnable prototype.
- Web capability: preserved as a design constraint, not a Phase 1 build gate.
- First project root: `game/`.
- First script root: `scripts/`.
- Build command contract: `scripts/build_game.sh`.
- Smoke-test command contract: `scripts/smoke_test.sh`.
- `Godot CLI` remains `pending_setup` in agent profiles until the repository contains a Godot project and verified local commands.

## Rationale

Desktop-first keeps iteration and QA simple during early prototype work. Web-capable remains important because Halucy eventually needs external feedback loops with low distribution friction.

Phase 0 should not create the Godot project, export presets, or build scripts. Those are implementation artifacts and should be created after GitHub sync, when the repository shape is stable.

## Repository Contract

Expected later structure:

```text
game/
  project.godot
  scenes/
  scripts/
  assets/
scripts/
  build_game.sh
  smoke_test.sh
```

This document does not create those files. It only fixes the target contract for Phase 1 planning.

## Agent Impact

**Implementation Agent**

- Owns Godot scene and script implementation after a Work Package authorizes it.
- Keeps implementation under `game/` unless a Work Package explicitly targets another path.
- Treats `Godot CLI` as `pending_setup` until local build and smoke-test commands are verified.

**QA Agent**

- Reviews desktop runnable behavior first.
- Uses smoke-test evidence when commands exist.
- Treats web export as a risk note until it becomes a later phase gate.

**Art Agent**

- Produces asset manifests that can be imported into Godot.
- Must keep license or usage uncertainty visible before assets enter `game/assets/`.

**Learning Librarian Agent**

- Captures repeated Godot setup, import, build, or export failures as Technical or Failure Learning Card candidates.
- Does not promote Godot setup lessons to Canonical or Policy without the required authority basis.

## Phase Gates

**Phase 0 pass**

- Godot target decision is documented.
- No Godot project, export preset, build script, or smoke-test script is required.

**Phase 1 pass**

- A tiny desktop runnable Godot slice exists.
- Local smoke-test criteria are defined and exercised.
- Any web export risk is documented, not necessarily resolved.

**Phase 2 pass**

- Playable vertical slice exists.
- Desktop build remains runnable.
- Web-capable risk is checked against the prototype's actual asset and engine usage.

## Non-Goals

- Do not create `game/project.godot` in Phase 0.
- Do not create export presets in Phase 0.
- Do not create `scripts/build_game.sh` or `scripts/smoke_test.sh` in Phase 0.
- Do not lock a specific Godot patch version before local install and CI realities are known.
- Do not make web export a Phase 1 blocker.

## Open Questions

- Which exact Godot 4.x patch version is installed locally?
- Are export templates installed?
- Which desktop target is first: macOS only, or macOS plus cross-platform later?
- When should web export become a hard gate instead of a risk check?
