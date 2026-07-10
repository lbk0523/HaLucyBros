# Phase 4B Scope And Game Brief

## Status

This brief starts Phase 4B Complex Prototype Production Validation.

Phase 4B is a local playable production-system stress test. It is not final
game concept approval, final art direction, launch readiness, market
positioning, external testing, or Learning Card promotion.

## Production Question

Can the Phase 0-3 Halucy production system build a more complex playable Godot
prototype while preserving Work Package execution, role-separated handoff,
Human Creative Owner authority, Implementation and QA separation, evidence
gates, Candidate-only learning capture, and explicit repo hygiene decisions?

## Concrete Local Prototype Boundary

The Phase 4B local prototype is:

```text
A two-section 2D platformer challenge where the player moves from a left start
through a first traversal section, crosses a hazard section, collects a visible
progression item, reaches a goal, and sees simple result/retry UI.
```

Continuity from Phase 2 is intentional: this remains a platformer because the
existing greybox already proved the baseline movement and owner feel handoff.
The new test is higher production complexity, not a new genre search.

## Selected Complexity Features

Phase 4B selects these complexity features:

| Feature | Selection | Boundary |
|---|---|---|
| Multi-section level flow | Required | Two readable local sections in one prototype scene; no multi-level campaign. |
| Hazard or moving obstacle | Required | One hazard or moving obstacle with clear player-readable behavior; no enemy AI system. |
| Collectible or progression state | Required | One visible collectible/progression item that affects result or goal state; no economy, inventory, upgrades, or score meta-system. |
| UI state | Required | Start/status plus result/retry feedback; no full menu, settings, save, or title flow. |
| Camera behavior | Required | Follow or section framing sufficient to keep player, hazard, goal, and progression feedback readable; no cinematic camera system. |
| Imported gameplay-readable art | Required | At least one approved asset category must be used in a gameplay-readable role; final art quality is not approved. |
| Player-facing feel gate | Required | QA can recommend technical pass, but BK/Human Creative Owner must directly judge play/feel. |
| Animation or multi-frame visual state | Optional | Allowed only if later Research/Art/Implementation scope proves the slice needs it. |

The minimum pass target is at least the first seven required features above.

## Player-Facing Hook

In the first 30-60 seconds, the player should understand:

- I start in section one and move toward a second section.
- I can move left, move right, and perform one fixed-height ground jump.
- I must read the route, avoid or time one hazard/moving obstacle, collect or
  trigger one progression item, and reach the goal.
- The UI tells me whether I am starting, progressing, succeeding, failing, or
  retrying.
- The camera/framing keeps the immediate challenge readable.

## Player Verbs

Allowed player verbs:

- move left
- move right
- fixed-height single jump from the ground
- touch or collect one progression item by collision
- reach goal or retry after result state

Forbidden player verbs:

- double jump
- wall jump
- dash
- attack
- health, lives, damage, or death-loop system
- inventory, upgrades, shop, crafting, dialogue, or quest interaction
- switches beyond a single progression gate if explicitly approved later

## Allowed Target Surfaces

WP-030 may create or update only:

- `plans/PHASE4B_SCOPE_AND_GAME_BRIEF.md`
- `work_packages/active/WP-2026W22-030.json`

Later Phase 4B Work Packages may target these surfaces only when explicitly
approved in their own WP:

- `research_notes/RN-2026W22-003-phase4b-complex-prototype-reference.md`
- `art_notes/**`
- `art_candidates/phase4b/**`
- `owner_reviews/**`
- `implementation_notes/**`
- `reviews/**`
- `runs/**`
- `learning_cards/candidate/**`
- `game/scenes/main.tscn`
- `game/scripts/player.gd`
- `game/assets/phase4b/**`
- `game/tests/**` only for bounded, non-shipping QA fixtures explicitly named
  by a later Phase 4B Work Package; this does not authorize a broad test
  framework, gameplay implementation, or external testing

`game/.godot/**` remains ignored and must not be evidence. New
`game/scripts/*.gd.uid` sidecars are not approved by this brief; a later
Implementation WP must explicitly allow or reject them. `game/assets/**/*.png`
and matching `.png.import` files are allowed only for approved gameplay-readable
assets in the relevant Art/Implementation WP.

A `game/tests/*.gd.uid` sidecar may be tracked only when the same approved Work
Package explicitly names both the bounded QA fixture and its UID metadata as
targets and verification artifacts. Test UID metadata is repository hygiene,
not gameplay evidence by itself.

## Forbidden Gameplay Scope

Phase 4B does not include:

- final game concept selection
- final art direction, style bible, production asset approval, or brand work
- broad movement expansion beyond the approved Phase 2 movement base
- combat, enemy AI, health, lives, checkpoints, boss, or multi-level systems
- procedural generation
- audio, music, cutscenes, narrative, dialogue, or quest systems
- save/load, settings, platform export, web deployment, or release packaging
- market validation, monetization, launch planning, or external testing
- Learning Card promotion to Working, Canonical, or Policy
- Work Package lifecycle cleanup unless a dedicated cleanup WP is approved

## Role Boundaries

Research Agent:

- defines reference constraints for the selected complexity features
- must not decide final game concept or market positioning

Art Agent:

- defines asset requirements, manifest, review surfaces, and candidate package
  for gameplay-readable assets
- must not approve final creative direction or edit Godot gameplay logic

Implementation Agent:

- implements only after BK/Human Creative Owner approval of scope, constraints,
  and art package
- may change only approved target files in its own Implementation WP
- must not self-approve QA

QA Agent:

- independently checks implementation correctness, scope preservation,
  playability, UI state, camera/readability, asset import validity, and owner
  play-readiness
- must not modify implementation files under review

Learning Librarian Agent:

- may create Candidate Learning Cards only when reusable evidence exists
- must not promote Working, Canonical, or Policy Learning Cards

Human Creative Owner:

- approves or redirects scope/art before implementation
- directly judges play/feel after QA
- keeps final creative/product and Canonical/Policy authority

## Verification Expectations

WP-030 verification:

- Work Package JSON validates against `schemas/work_package.schema.json`.
- This brief defines concrete prototype boundary, selected complexity features,
  allowed target surfaces, forbidden gameplay scope, role boundaries,
  verification expectations, and next handoff.
- No Godot files, art assets, implementation notes, reviews, runs, Learning
  Cards, schema files, or lifecycle moves are changed.

Later Phase 4B verification gates:

- Work Package, Run, Review, and Learning Card schema validation where relevant
- `scripts/smoke_test.sh` with explicit clean-output check
- headless scene runtime for `res://scenes/main.tscn`
- approved target-file diff review
- multi-section flow reachable
- hazard or moving obstacle readable and not unintentionally unwinnable
- collectible/progression state visible and predictably reset
- start/status/result/retry UI communicates state
- camera/framing does not hide player, hazard, goal, or progression feedback
- imported source PNG and `.png.import` metadata verified when assets are used
- Implementation and QA separation preserved
- BK/Human Creative Owner direct play/feel review recorded before Phase 4B pass

## Next Handoff

Next Work Package: WP-031 Research Constraints.

Expected next output:

- `research_notes/RN-2026W22-003-phase4b-complex-prototype-reference.md`

WP-031 should translate this brief into reference constraints for layout,
hazard/progression behavior, UI state, camera/readability, and feel. It should
not start art production, edit Godot files, approve implementation, or decide
final game direction.
