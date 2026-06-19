# AN-2026W22-007: Phase 4B Direct Art Production Report

## Purpose

WP-036 tests whether Art Agent can directly produce the full Phase 4B prototype
art resource set, including backgrounds, gameplay sprites, platform/readability
art, goal art, and UI support art.

This is not final art direction approval, production asset approval, or launch
readiness. It is a production pipeline capability test.

## Execution Summary

Primary generation path:

- `built_in_image_gen` through the Codex `imagegen` skill
- no `OPENAI_API_KEY` workflow
- no CLI fallback
- no Adobe or paid external tool dependency

Transparent sprite/UI path:

- generated on `chroma_key` source background
- processed with the installed imagegen `remove_chroma_key.py` helper
- executed through `uv run --with pillow`

Initial chroma-key removal failed because Pillow was not available in the
default Python environment. The recovery path used `uv run --with pillow`, which
completed without adding project dependency files.

## Produced Asset Set

| asset_id | role | output |
|---|---|---|
| background_section_one_v1 | Section 1 warmup background | `game/assets/phase4b/direct_art/background_section_one_v1.png` |
| background_section_two_v1 | Section 2 hazard/item background | `game/assets/phase4b/direct_art/background_section_two_v1.png` |
| player_avatar_v1 | player avatar | `game/assets/phase4b/direct_art/player_avatar_v1.png` |
| ground_platform_tile_v1 | ground/platform visual | `game/assets/phase4b/direct_art/ground_platform_tile_v1.png` |
| collectible_progression_item_v1 | collectible/progression item | `game/assets/phase4b/direct_art/collectible_progression_item_v1.png` |
| hazard_warning_marker_v1 | hazard cue | `game/assets/phase4b/direct_art/hazard_warning_marker_v1.png` |
| goal_marker_v1 | goal marker | `game/assets/phase4b/direct_art/goal_marker_v1.png` |
| ui_status_panel_v1 | status/result/retry UI panel art | `game/assets/phase4b/direct_art/ui_status_panel_v1.png` |

Each asset has matching `.png.import` metadata after Godot import.

## Quality Read

Art Agent produced a coherent visual language across the set:

- lucid-dream workshop ruin environment
- teal/blue warmup section
- darker amber/red hazard section
- brass/stone/crystal motif across sprites and UI
- no baked text, logos, or external IP references

The backgrounds are visually strong enough to serve as production-candidate
review material, but they may be too detailed for final gameplay without
implementation-side layering, scale, and readability checks.

The player avatar is polished but currently reads as a full character concept,
so BK must decide whether it changes concept positioning too much.

The collectible and goal are visually attractive but both use bright crystal and
gold motifs. BK should verify they remain distinct enough at gameplay scale.

The hazard cue reads clearly as danger and does not imply enemy AI.

The UI panel is clean and contains no baked text, which keeps implementation
text flexible.

## Production Status

All assets are:

- `prototype_only_pending_owner_review`
- `production_candidate_not_approved`
- `production_approved: false`

`imagegen` output alone is not enough for launch approval. A separate BK owner
review, rights review, and likely human_final_pass_required cleanup are still
required before production/public use.

## License And Usage Note

The assets were generated with the Codex built-in image generation path under
BK's ChatGPT Pro access preference. Adobe or other paid external tools were not
used. Paid tool fallback remains optional only with explicit BK approval.

The package records prompt and source-output mapping in:

- `art_candidates/phase4b/direct_art/prompts.json`
- `art_candidates/phase4b/direct_art/manifest.json`
- `art_candidates/phase4b/direct_art/manifest.csv`

## Implementation Boundary

This package does not authorize implementation. Implementation may not replace
current Godot scene visuals until BK approves or redirects the direct art
package and a separate Implementation WP is created.

No Godot scene, script, project config, collision, or layout file was edited.

## Next Handoff

Next expected decision surface:

- `owner_reviews/OR-2026W22-007-phase4b-direct-art-KR.md`

BK should approve, redirect, or reject each generated asset role before any
implementation replacement pass.
