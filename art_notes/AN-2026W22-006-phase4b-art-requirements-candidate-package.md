# AN-2026W22-006: Phase 4B Art Requirements And Candidate Package

## Purpose

WP-032 defines the Phase 4B gameplay-readable asset needs and prepares a
reviewable candidate surface for BK/Human Creative Owner before implementation
authorization.

This package uses explicit reuse decisions from Phase 3E prepared assets. It
does not generate new images, create new binary assets, import anything into
Godot, approve final art direction, or authorize implementation.

## Inputs

- `plans/PHASE4B_SCOPE_AND_GAME_BRIEF.md`
- `research_notes/RN-2026W22-003-phase4b-complex-prototype-reference.md`
- `art_candidates/phase3e/prepared_manifest.json`
- `art_candidates/phase3e/prepared_preview.png`
- `agents/profiles/art_agent.yaml`

## Outputs

- `art_candidates/phase4b/asset_requirements.json`
- `art_candidates/phase4b/asset_requirements.csv`
- `art_candidates/phase4b/asset_manifest.json`
- `art_candidates/phase4b/asset_manifest.csv`
- `art_candidates/phase4b/reuse_preview.md`

## Asset Role Decisions

| role | decision | rationale |
|---|---|---|
| hazard | reuse candidate with readability risk | Existing obstacle can be reviewed as a hazard/moving-obstacle signifier, but may read as static blocker. |
| collectible | no clear reuse candidate | Existing goal/obstacle/platform art would confuse progression semantics. |
| goal | recommended reuse candidate | Existing prepared goal marker is the cleanest imported gameplay-readable asset for Phase 4B. |
| section_landmark | reuse candidate with collision alignment risk | Existing platform art may support section readability, but should not drive collision or platform-system scope. |

## Reviewability

The primary review surface is `art_candidates/phase4b/reuse_preview.md`.

The CSV files are the human-editable review surfaces:

- `art_candidates/phase4b/asset_requirements.csv`
- `art_candidates/phase4b/asset_manifest.csv`

The JSON files preserve structured handoff data for later QA and implementation
planning.

## Implementation Handoff Boundary

Implementation must not treat this package as authorization to import or use the
assets. WP-033 must first create the Korean owner review gate and record
approval, redirect, or rejection.

If owner approval is later granted, the lowest-risk imported gameplay-readable
asset is:

```text
REQ-P4B-003 / P4B-goal-reuse-P3E-goal-marker-v1
```

The collectible role remains unresolved. Later implementation may use a
placeholder collectible only if owner review explicitly allows placeholder-only
treatment for that role.

## Risks

- Hazard reuse risk: obstacle art may not clearly communicate danger.
- Collectible gap: no existing asset cleanly communicates progression item.
- Section landmark risk: platform art can tempt collision or tileset expansion.
- Rights risk: generated assets remain prototype review only; production/public
  use needs separate rights review.
- Scope risk: no final art direction, production asset approval, Godot import,
  or implementation authorization is implied.

## Next Handoff

Next Work Package: WP-033 Owner Review.

Expected owner review output:

- `owner_reviews/OR-2026W22-005-phase4b-scope-art-KR.md`

The owner review should let BK approve, redirect, or reject each Phase 4B asset
role and should explicitly state whether implementation may use the recommended
goal marker reuse candidate.
