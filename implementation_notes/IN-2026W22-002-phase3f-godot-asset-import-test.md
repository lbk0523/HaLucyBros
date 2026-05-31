# IN-2026W22-002: Phase 3F Godot Asset Import Test

## Purpose

Test whether Phase 3E transparent prepared assets can be copied into the Godot
project, imported by Godot, referenced from `main.tscn`, and loaded at runtime
without changing gameplay, collision, movement, or final art direction.

This is an implementation proof, not final art approval.

## Inputs

- Prepared assets:
  - `art_candidates/phase3e/prepared/P3E-player-v1-transparent.png`
  - `art_candidates/phase3e/prepared/P3E-floor-platform-v1-transparent.png`
  - `art_candidates/phase3e/prepared/P3E-obstacle-v1-transparent.png`
  - `art_candidates/phase3e/prepared/P3E-goal-marker-v1-transparent.png`
- Prepared manifest: `art_candidates/phase3e/prepared_manifest.csv`
- Current scene: `game/scenes/main.tscn`
- Current player script: `game/scripts/player.gd`
- Smoke test: `scripts/smoke_test.sh`

## Implemented Changes

Copied prepared assets into the Godot project:

- `game/assets/phase3e/player.png`
- `game/assets/phase3e/floor_platform.png`
- `game/assets/phase3e/obstacle.png`
- `game/assets/phase3e/goal_marker.png`

Godot generated import metadata:

- `game/assets/phase3e/player.png.import`
- `game/assets/phase3e/floor_platform.png.import`
- `game/assets/phase3e/obstacle.png.import`
- `game/assets/phase3e/goal_marker.png.import`

Updated `game/scenes/main.tscn`:

- added Texture2D external resources for the imported prototype assets
- replaced `PlayerVisual`, `GroundVisual`, `PlatformVisual`, `BlockerVisual`,
  and `GoalVisual` placeholder `ColorRect` nodes with `Sprite2D` nodes
- kept `Background`, `StartMarker`, `HUD/TimerLabel`, and `HUD/StatusLabel`
  as placeholder UI/geometry
- kept all collision nodes and shapes unchanged
- kept `game/scripts/player.gd` unchanged

Godot recreated:

- `game/scripts/player.gd.uid`

Current repo policy treats script `.gd.uid` sidecars as tracked alongside their
script when recreated by Godot.

## Import Failure And Recovery

First smoke test failed after copying PNGs and referencing them from the scene:

- Godot reported `No loader found for resource: res://assets/phase3e/*.png`
- `main.tscn` could not resolve the Texture2D resources

Cause:

- The PNG files existed in `game/assets/phase3e/`, but Godot had not imported
  them yet.

Recovery:

- Ran `godot --headless --path game --import`
- Godot generated `.png.import` files and `.godot/imported/**` cache artifacts
- `.godot/**` remains ignored; `.png.import` files are part of the project asset
  import state

## Verification Results

Passed after import:

- `scripts/smoke_test.sh`
- clean smoke output check with no `SCRIPT ERROR` or `ERROR:` lines
- `godot --headless --path game --scene res://scenes/main.tscn --quit-after 3`
- scene static check found `Texture2D`, `Sprite2D`, and `res://assets/phase3e`
  references

## Gameplay Boundary

Not changed:

- player movement
- collision shapes
- timer logic
- goal detection logic
- level route
- camera
- HUD behavior
- scoring
- enemies
- items

The implementation only tests whether prepared art assets can load in the scene.

## Visual Collision Risk

Known risks remain:

- player sprite is wider/rounder than the rectangular collision shape
- platform art is decorative and not tile-ready
- obstacle corners are rounded while collision remains rectangular
- goal marker visual is larger than the trigger area

These are acceptable for the import test but must be reviewed before claiming
visual polish or production readiness.

## Capability Finding

Phase 3F passes the narrow capability test:

- prepared transparent PNGs can be copied into the Godot project
- Godot can generate import metadata for them
- `main.tscn` can reference them as `Texture2D`
- runtime and smoke checks pass after import

This does not prove final art quality, production-readiness, or player-facing
feel. It proves the asset pipeline can reach a working Godot scene without
changing gameplay scope.

## Next Boundary

Recommended next step:

- QA review of this implementation import test.

Do not proceed to broader art pack generation, visual polish, or gameplay
changes before QA and BK/Human Creative Owner review this result.
