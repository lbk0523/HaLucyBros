# AN-2026W22-004: Phase 3B Art Production Candidate Report

## Purpose

Phase 3B tests whether the Art Agent can use a real image generation workflow
and asset review workflow to produce prototype-grade art candidates with enough
evidence for BK/Human Creative Owner review and later Implementation planning.

This report does not approve final art direction, production assets, Godot
integration, gameplay changes, external feedback, or release use.

## Inputs

- Phase 3A boundary: `art_notes/AN-2026W22-003-art-production-capability-boundary.md`
- Phase 3A Work Package: `work_packages/active/WP-2026W22-018.json`
- Phase 3A Run: `runs/RUN-20260531-001.json`
- Phase 2 closeout: `PHASE2_CLOSEOUT.md`
- Phase 2 game brief: `context/game_brief.md`
- Art profile: `agents/profiles/art_agent.yaml`

## Tool Workflow

Tool used:

- built-in `image_gen` tool for bitmap candidate generation
- `file` for format and resolution inspection
- `view_image` for visual review
- `shasum -a 256` for stable file identity
- Codex structuring for manifest, risk notes, and owner review handoff

Generated source:

- default generated path: `/Users/byung/.codex/generated_images/019e7b9e-762c-7810-8e7d-03065b682a4c/ig_078b0661a7b56596016a1b9494cfa48191b8d7b7d7b7f7d07f.png`
- workspace copy: `art_candidates/phase3b/phase3b_candidate_sheet_v1.png`
- sha256: `1ce679a83d4d2780e7ea5324ea2ff94e3c4e0e9517ab78299930e7697ad41c38`
- file info: `PNG image data, 1774 x 887, 8-bit/color RGB, non-interlaced`

Prompt summary:

```text
Create a clean review contact sheet of five separate prototype-grade 2D
platformer asset candidates: player character, floor/platform tile,
obstacle/blocker, goal marker, and timer/HUD treatment. Use a simple readable
indie-game prototype style, one horizontal row, no labels, no text, no enemies,
no items, no score, no weapons, no dash/attack/aim implication, no watermark,
and no final polished production style.
```

## Candidate Set

The original generated sheet contains one candidate for each approved Phase 3
role. After BK review feedback, the review unit was corrected from one contact
sheet to individually mapped candidate files.

Required asset inventory:

- `art_candidates/phase3b/asset_requirements.json`
- `art_candidates/phase3b/asset_requirements.csv`

Individual review files:

- `REQ-P3B-001` -> `P3B-player-v1`: `art_candidates/phase3b/individual/P3B-player-v1.png`
- `REQ-P3B-002` -> `P3B-floor-platform-v1`: `art_candidates/phase3b/individual/P3B-floor-platform-v1.png`
- `REQ-P3B-003` -> `P3B-obstacle-v1`: `art_candidates/phase3b/individual/P3B-obstacle-v1.png`
- `REQ-P3B-004` -> `P3B-goal-marker-v1`: `art_candidates/phase3b/individual/P3B-goal-marker-v1.png`
- `REQ-P3B-005` -> `P3B-timer-hud-v1`: `art_candidates/phase3b/individual/P3B-timer-hud-v1.png`

The manifest is recorded in:

- `art_candidates/phase3b/asset_manifest.json`
- `art_candidates/phase3b/asset_manifest.csv`

The CSV files are the human review/edit surface. JSON remains useful for agent
handoff and automation, but large asset lists should not require BK or a human
reviewer to inspect nested JSON by hand.

Preview convenience file:

- `art_candidates/phase3b/individual_preview.png`

The original contact sheet remains as source evidence:

- `art_candidates/phase3b/phase3b_candidate_sheet_v1.png`

## Visual Review

Pass:

- Candidate roles are visually separated in one contact sheet.
- Player, floor/platform, obstacle, goal marker, and timer/HUD are all present.
- No text, score label, enemy, collectible, weapon, attack, dash, or aim cue is
  visible.
- The obstacle reads as a static blocker rather than an enemy or hazard trap.
- The goal marker reads as a destination and is visually distinct from the
  obstacle.
- The timer/HUD candidate communicates time pressure without text.

Risks:

- The first package was not reviewable because it did not state which assets
  were needed and used one PNG as the main review unit.
- The reworked package fixes review mapping but the individual candidate files
  are still RGB crops with light backgrounds.
- The current CSV is small because Phase 3B is a prototype capability slice;
  future production asset lists should use the same table shape at larger scale.
- Each candidate still needs transparent-background prep before Godot import.
- Rights and attribution status are unknown; use is prototype-review-only until
  BK/Human Creative Owner and rights review approve a narrower usage.
- Timer/HUD has higher gameplay-scope risk because it could imply a polished UI
  system if treated as implementation-ready.

## Implementation Handoff

Implementation may later assess the candidates, but this Phase 3B slice does
not authorize Godot mutation.

If BK approves a candidate set for prototype use, a later Work Package should
decide whether to:

- crop individual candidate regions into separate PNG files
- remove or replace the background
- align visual bounds with existing collision bounds
- import only player/platform/obstacle/goal first
- leave timer/HUD as visual reference until a UI-specific Work Package exists

Implementation must not:

- import the contact sheet directly as production asset art
- change movement, collision, level, camera, enemy, item, scoring, or HUD
  systems because of the art candidate
- treat generated art approval as final art direction approval

## Owner Review Handoff

BK/Human Creative Owner should review:

- whether the requirement list explains why the Phase 3B capability slice uses
  five required assets and what is outside this slice
- whether the generated candidate set is useful enough for prototype visual
  replacement exploration
- whether the individual file mapping is sufficient for review
- whether any role should be rejected or redirected before further asset work
- whether the next Art Agent slice should generate transparent individual
  assets or iterate on style first

Owner review artifact:

- `owner_reviews/OR-2026W22-003-phase3b-art-candidates-KR.md`

## Capability Finding

Phase 3B shows that the Art Agent can use a real image generation workflow and
attach manifest, risk, and implementation-handoff notes. The first package was
not reviewable because it lacked an explicit asset requirement report and used a
single contact sheet as the primary review unit. The rework adds the missing
requirement list and individual candidate mapping.

It does not yet prove:

- transparent sprite asset production
- direct Godot import readiness
- scalable art inventory management for a full game
- final art direction
- production license readiness
- full asset pack creation
- external audience response

## Stop Boundary

This slice stops at prototype candidate generation and owner review handoff.
Godot integration, asset cleanup, transparent sprite extraction, and Learning
Card capture require later explicit Work Packages.
