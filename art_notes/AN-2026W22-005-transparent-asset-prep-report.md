# AN-2026W22-005: Transparent Asset Prep Report

## Purpose

Phase 3E tests whether generated review candidates can be converted into a
transparent prepared asset package suitable for later Godot import planning.

This work does not import assets into Godot, create `.import` files, change
scene/script files, approve final art direction, approve production use, or
expand gameplay.

## Inputs

- Requirements CSV: `art_candidates/phase3b/asset_requirements.csv`
- Candidate manifest CSV: `art_candidates/phase3b/asset_manifest.csv`
- Individual source candidates:
  - `art_candidates/phase3b/individual/P3B-player-v1.png`
  - `art_candidates/phase3b/individual/P3B-floor-platform-v1.png`
  - `art_candidates/phase3b/individual/P3B-obstacle-v1.png`
  - `art_candidates/phase3b/individual/P3B-goal-marker-v1.png`
  - `art_candidates/phase3b/individual/P3B-timer-hud-v1.png`
- Phase 3C implementation assessment:
  - `implementation_notes/IN-2026W22-001-phase3c-asset-integration-assessment.md`

## Prep Scope

Prepared in this slice:

- player
- floor/platform
- obstacle
- goal marker

Deferred:

- timer/HUD

Timer/HUD remains deferred because the current Phase 3C assessment marks it as
a visual reference only and warns that direct implementation can expand into a
polished HUD system.

## Method

The prep used local deterministic image processing with Python PIL.

Method summary:

- Load each Phase 3B RGB crop.
- Flood-fill connected light neutral background pixels from image borders.
- Set those connected background pixels to alpha 0.
- Trim transparent border while preserving 8px padding.
- Save RGBA PNG prepared assets.
- Build a checkerboard preview for quick visual inspection.

No new image generation was performed.

## Prepared Assets

| required_asset_id | source_candidate_id | prepared_asset_id | prepared_file_path | result |
| --- | --- | --- | --- | --- |
| `REQ-P3B-001` | `P3B-player-v1` | `P3E-player-v1-transparent` | `art_candidates/phase3e/prepared/P3E-player-v1-transparent.png` | prepared |
| `REQ-P3B-002` | `P3B-floor-platform-v1` | `P3E-floor-platform-v1-transparent` | `art_candidates/phase3e/prepared/P3E-floor-platform-v1-transparent.png` | prepared |
| `REQ-P3B-003` | `P3B-obstacle-v1` | `P3E-obstacle-v1-transparent` | `art_candidates/phase3e/prepared/P3E-obstacle-v1-transparent.png` | prepared |
| `REQ-P3B-004` | `P3B-goal-marker-v1` | `P3E-goal-marker-v1-transparent` | `art_candidates/phase3e/prepared/P3E-goal-marker-v1-transparent.png` | prepared |
| `REQ-P3B-005` | `P3B-timer-hud-v1` | none | none | deferred |

Preview:

- `art_candidates/phase3e/prepared_preview.png`

Human-editable manifest:

- `art_candidates/phase3e/prepared_manifest.csv`

Structured manifest:

- `art_candidates/phase3e/prepared_manifest.json`

## Validation Results

All prepared world-facing assets are RGBA PNGs with alpha channels.

Validated properties:

- `P3E-player-v1-transparent.png`: `199x223`, RGBA, transparent corners
- `P3E-floor-platform-v1-transparent.png`: `427x161`, RGBA, transparent corners
- `P3E-obstacle-v1-transparent.png`: `199x242`, RGBA, transparent corners
- `P3E-goal-marker-v1-transparent.png`: `194x267`, RGBA, transparent corners

The preview renders the prepared assets over a checkerboard background for
human inspection.

## Quality Risks

Known risks:

- Local background removal may leave light edge halos.
- Prepared files are not final sprites.
- Pivot, scale, and target Godot paths are not decided.
- Platform art is not tile-ready.
- Player, obstacle, and goal marker still need visual/collision alignment
  decisions.
- Rights and production/public-use approval remain unresolved.

## Godot Import Boundary

Phase 3E stops before Godot import.

Not authorized:

- editing `game/**`
- creating `.import` files
- changing `project.godot`
- changing scenes or scripts
- changing collision shapes
- changing movement or HUD behavior
- approving final art or production/public use

## Implementation Handoff

Implementation can now plan against prepared transparent files, but cannot
import them yet.

The next implementation-facing questions are:

- target Godot folder for prototype assets
- file naming convention under the Godot project
- whether Godot `.import` metadata should be tracked
- target scale for each sprite
- pivot/origin convention
- visual/collision mismatch policy
- whether platform visual should be stretched, sliced, or tiled

## Capability Finding

Phase 3E passes the narrow prep capability check:

- generated RGB candidate crops can be transformed into transparent RGBA PNGs
- source-to-prepared mapping can be recorded in CSV and JSON
- timer/HUD can be explicitly deferred rather than accidentally pulling in UI
  implementation scope
- Godot import remains a separate authorization boundary

This does not prove final art quality, production readiness, or full asset pack
management.
