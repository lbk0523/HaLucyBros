# IN-2026W22-001: Phase 3C Asset Integration Assessment

## Purpose

Assess the Phase 3B art candidate package from an Implementation Agent
perspective before any Godot mutation, asset import, transparent sprite
generation, gameplay change, or production-art approval.

This note answers whether the current candidates are suitable for later Godot
integration planning, what prep work is required, and where the art package
would risk expanding gameplay scope.

## Inputs

- Asset requirements CSV: `art_candidates/phase3b/asset_requirements.csv`
- Asset manifest CSV: `art_candidates/phase3b/asset_manifest.csv`
- Asset requirements JSON: `art_candidates/phase3b/asset_requirements.json`
- Asset manifest JSON: `art_candidates/phase3b/asset_manifest.json`
- Individual candidates:
  - `art_candidates/phase3b/individual/P3B-player-v1.png`
  - `art_candidates/phase3b/individual/P3B-floor-platform-v1.png`
  - `art_candidates/phase3b/individual/P3B-obstacle-v1.png`
  - `art_candidates/phase3b/individual/P3B-goal-marker-v1.png`
  - `art_candidates/phase3b/individual/P3B-timer-hud-v1.png`
- Current scene: `game/scenes/main.tscn`
- Current player script: `game/scripts/player.gd`
- Implementation profile: `agents/profiles/implementation_agent.yaml`

## Current Godot Surface

Current scene uses placeholder geometry:

- `Player` is a `CharacterBody2D` with `PlayerCollision`, `PlayerVisual`, and
  `FacingCue`.
- `Ground`, `Blocker`, and `Platform` are `StaticBody2D` nodes with rectangle
  collision and `ColorRect` visuals.
- `GoalArea` is an `Area2D` with rectangle collision and `GoalVisual`.
- `HUD` contains `TimerLabel` and `StatusLabel`.

Current script implements movement, timer, and goal detection. No Phase 3C work
should change this script.

## Godot Target Mapping

| required_asset_id | candidate_id | role | likely Godot target | integration status |
| --- | --- | --- | --- | --- |
| `REQ-P3B-001` | `P3B-player-v1` | player | `Player/PlayerVisual` replacement candidate | not import-ready |
| `REQ-P3B-002` | `P3B-floor-platform-v1` | floor_platform | `Ground/GroundVisual` and `Platform/PlatformVisual` replacement candidate | not import-ready |
| `REQ-P3B-003` | `P3B-obstacle-v1` | obstacle | `Blocker/BlockerVisual` replacement candidate | not import-ready |
| `REQ-P3B-004` | `P3B-goal-marker-v1` | goal_marker | `GoalArea/GoalVisual` replacement candidate | not import-ready |
| `REQ-P3B-005` | `P3B-timer-hud-v1` | timer_hud | `HUD/TimerLabel` visual reference only | defer implementation |

## Asset-by-Asset Assessment

### `REQ-P3B-001` / `P3B-player-v1`

File: `art_candidates/phase3b/individual/P3B-player-v1.png`

Assessment:

- Useful as a prototype player visual candidate.
- Reads as a controllable character and does not imply attack, dash, weapon, or
  aim mechanics.
- Current crop is RGB with background. It is not ready for direct Godot sprite
  import.

Import prep needs:

- transparent background extraction
- final crop bounds
- target sprite size decision
- visual origin/pivot decision
- check against existing `RectangleShape2D_player` size `32 x 48`

Visual Collision Alignment Risk:

- Medium. The candidate silhouette is rounder and wider than the current
  collision rectangle. A later implementation slice must either scale the sprite
  to the existing body or explicitly document any visual/collision mismatch.

Gameplay Scope Risk:

- Low. No new player verb is implied.

### `REQ-P3B-002` / `P3B-floor-platform-v1`

File: `art_candidates/phase3b/individual/P3B-floor-platform-v1.png`

Assessment:

- Useful as a solid-surface visual candidate.
- The grass/stone treatment reads as a platform, not background decoration.
- It is a single crop, not a full tileset.

Import prep needs:

- transparent background extraction
- decide whether to use as stretched sprite, repeated tile, or one-off visual
- crop tileable segment if repetition is needed
- check against current ground `760 x 40` and platform `120 x 24` surfaces

Visual Collision Alignment Risk:

- Medium to high. The candidate has decorative grass and stone depth that may
  not align cleanly with the current flat rectangle collision. A later
  implementation slice should preserve collision geometry and adapt the visual,
  not reshape gameplay to match the art.

Gameplay Scope Risk:

- Low if used as static surface art only.
- Stop if the art leads to slopes, moving platforms, destructible terrain, or
  decorative non-colliding surfaces that look solid.

### `REQ-P3B-003` / `P3B-obstacle-v1`

File: `art_candidates/phase3b/individual/P3B-obstacle-v1.png`

Assessment:

- Useful as a static blocker candidate.
- It reads as a solid block and does not imply enemy, collectible, spike, trap,
  or damage rules.

Import prep needs:

- transparent background extraction
- crop cleanup around edges
- scale to current `RectangleShape2D_block` size `70 x 56` or document mismatch
- confirm it remains visually distinct from floor/platform stone

Visual Collision Alignment Risk:

- Medium. The visual has rounded/chamfered corners while collision is
  rectangular. This is acceptable for a prototype if scaled conservatively, but
  QA should know the collision remains rectangular.

Gameplay Scope Risk:

- Low. No new behavior implied.

### `REQ-P3B-004` / `P3B-goal-marker-v1`

File: `art_candidates/phase3b/individual/P3B-goal-marker-v1.png`

Assessment:

- Useful as a goal marker candidate.
- Reads as a finish marker and is visually distinct from obstacle/blocker.

Import prep needs:

- transparent background extraction
- visual scale decision relative to current goal collision `40 x 64`
- separate visual marker from trigger area

Visual Collision Alignment Risk:

- Medium. The flag visual is wider than the current goal collision. A later
  implementation slice should keep `GoalArea/GoalCollision` as the trigger and
  treat the flag as visual-only unless a separate scope decision changes goal
  interaction.

Gameplay Scope Risk:

- Low. It implies destination only, not portal, reward chest, or progression
  system.

### `REQ-P3B-005` / `P3B-timer-hud-v1`

File: `art_candidates/phase3b/individual/P3B-timer-hud-v1.png`

Assessment:

- Useful as visual reference for time pressure.
- Not recommended for immediate implementation in the next Godot slice.

Import prep needs:

- defer until a UI-specific Work Package exists
- decide whether HUD remains `Label`-based or becomes sprite/UI composition
- avoid replacing timer text with an unreadable decorative element

Visual Collision Alignment Risk:

- Not applicable.

Gameplay Scope Risk:

- Medium. Treating this as implementation-ready could expand scope into a
  polished HUD system, bar fill logic, animation, or new UI layout work.

## Import Prep Needs

Before any candidate can be imported into Godot, a later authorized Work Package
must decide:

- destination folder under the Godot project
- file naming convention for imported prototype assets
- whether `.import` files and Godot-generated metadata are tracked or ignored
- transparent background workflow
- scale targets for player, floor/platform, obstacle, and goal marker
- whether platform visuals are stretched, sliced, or tiled
- whether timer/HUD remains deferred

Minimum recommended next asset-prep outputs:

- transparent player PNG
- transparent obstacle PNG
- transparent goal marker PNG
- platform visual prepared for either single-use stretch or tile experiment
- updated manifest rows linking prepared files back to `required_asset_id`

## Visual Collision Alignment Risk

Keep collision authoritative. Art should adapt to existing prototype collision,
not the other way around.

Risk summary:

- player: medium, because visual silhouette differs from `32 x 48` collision
- floor/platform: medium to high, because decorative depth can imply collision
  shape that does not exist
- obstacle: medium, because rounded visual corners do not match rectangle
  collision exactly
- goal marker: medium, because visual width can exceed trigger region
- timer/HUD: not applicable

QA implication:

- A later implementation slice must make visual/collision mismatch explicit
  before claiming the asset import is acceptable.

## Gameplay Scope Risk

Do not let asset integration change the Phase 2 gameplay contract.

Allowed later assessment or prep:

- static visual replacement
- transparent sprite prep
- scale/crop decisions
- visual-only marker alignment

Not allowed without a separate Work Package:

- movement changes
- collision shape changes driven by art
- slopes
- moving platforms
- destructible blocks
- enemy, hazard, trap, damage, item, or score behavior
- timer/HUD system implementation
- camera or animation polish

## Excluded Implementation

This assessment does not authorize:

- editing `game/scenes/main.tscn`
- editing `game/scripts/player.gd`
- editing `game/project.godot`
- adding assets under `game/**`
- generating transparent sprites
- creating Godot `.import` files
- changing collision shapes
- changing movement or HUD behavior
- approving final art direction or production use

## Next Work Package Options

Recommended next options, in order:

1. `Phase 3D QA Review`: QA checks the Phase 3B/3C package for mapping,
   forbidden-scope risk, and implementation-readiness gaps.
2. `Phase 3D Asset Prep`: Art Agent creates transparent individual prototype
   asset files and updates CSV/JSON manifest rows. No Godot import.
3. `Phase 3E Implementation Planning`: Implementation Agent writes a concrete
   import plan with target Godot paths and expected generated files. No Godot
   mutation.
4. `Phase 3F Godot Import Prototype`: only after owner approval, import a
   minimal subset of approved prepared assets into Godot.

Do not jump directly from this assessment to Godot import. The current asset
files are reviewable candidates, not implementation-ready sprites.
