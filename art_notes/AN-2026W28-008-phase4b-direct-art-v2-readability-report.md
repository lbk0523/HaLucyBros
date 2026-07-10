# AN-2026W28-008: Phase 4B Direct Art v2 Readability Report

## Outcome

The complete v2 prototype art set has been generated and persisted. It replaces
neither the v1 files nor the current Godot scene. It is review material for the
next BK/Human Creative Owner decision only.

## Why this pass exists

The v1 playable-art integration was redirected for a **Visual Readability Fail**:
the foreground gameplay roles were not sufficiently separated and the background
behaved too much like another gameplay layer. This pass focuses on the defined
readability contract rather than final-art polish.

## Readability design

| Priority | Role | Primary silhouette | Color support |
|---|---|---|---|
| 1 | Player | Compact hooded body | Teal, cream, orange |
| 2 | Goal | Tall halo-and-monolith beacon | Gold, indigo, pale cyan |
| 3 (equal) | Hazard | Jagged three-spike cluster | Red-orange, charcoal |
| 3 (equal) | Item | Rounded seed-relic droplet with leaf fins | Lime, mint |
| 4 | Safe platform | Broad horizontal slab | Slate, muted moss |
| 5 | HUD/status | Wide empty plaque | Indigo, muted brass |
| 6 | Background | Distant soft ruins and mountains | Muted indigo, teal, violet |

Hazard and item are intentionally different before color: sharp asymmetric
triangles versus a rounded seed-and-leaf form. The goal is markedly taller and
more architectural than the compact item. The background has distant ruin
silhouettes only and must remain at the lowest game-layer priority.

## Generation and asset preparation

- Tool: Codex built-in `image_gen`; the authorized fallback was used because
  `OPENAI_API_KEY` was unavailable for the preferred PerfectPixel route.
- Background: generated as a direct RGB PNG and copied to the project target.
- Player, goal, hazard, item, platform, and HUD: generated against a flat
  `#ff00ff` chroma-key field, then processed with the imagegen
  `remove_chroma_key.py` helper using border auto-key, soft matte, despill, and
  transparent/opaque thresholds of 12/220.
- All generated sources, final project paths, SHA-256 hashes, dimensions, and
  prompt mappings are recorded in the v2 prompt and manifest files.

## Local art QA performed

- All seven PNGs are parseable.
- The background is `1672x941` RGB; every other output is alpha-capable RGBA
  and has transparent corners after chroma-key removal.
- Every sprite/UI asset has a non-empty alpha bounding box and non-trivial
  non-transparent coverage.
- Visual inspection confirmed no baked text on the background, gameplay sprites,
  or empty HUD panel, and no external-IP or named-artist instruction was used.

This is visual candidate QA, not gameplay QA. Small-scale readability, crop,
placement, and interaction with the real level remain checks for a later
implementation package and independent QA pass.

## Status and handoff

All assets remain prototype-only and `production_candidate_not_approved`;
`production_approved` remains `false` and `human_final_pass_required` remains
`true`. Their owner-review state is now
`approved_for_prototype_integration_planning`.

BK/Human Creative Owner must approve, redirect, or reject this asset package.
Only an approval or conditional approval may authorize a separate Implementation
Work Package. This Art Work Package changed no scene, script, project setting,
collision, layout, gameplay logic, v1 direct-art file, review, Learning Card,
commit, push, merge, or deployment.

## Owner decision

On 2026-07-10, BK/Human Creative Owner approved all seven v2 assets for
**prototype integration planning**. Production approval remains false, and the
approval does not itself authorize implementation; a separate Implementation
Work Package remains required.
