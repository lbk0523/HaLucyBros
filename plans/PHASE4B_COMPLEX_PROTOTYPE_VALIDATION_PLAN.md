# Phase 4B Complex Prototype Production Validation Plan

## Status

This is the Phase 4A handoff plan for Phase 4B. It translates the production retrospective into a bounded production validation loop.

Phase 4B is not final game development. It is a controlled stress test of whether Halucy's production system can build a more complex playable prototype than the Phase 2 greybox and Phase 3 asset import test.

## Objective

Validate that the Phase 0-3 production system can handle a more complex playable game slice while preserving:

- Work Package based execution
- role-separated handoff
- Human Creative Owner authority
- Implementation and QA separation
- evidence-backed QA gates
- Candidate-only learning capture unless separately authorized
- scoped repo hygiene decisions

## Prototype Boundary

The recommended Phase 4B prototype is:

```text
Two-section platformer challenge with one hazard or moving obstacle, collectible/progression state, simple result/retry UI, camera follow or section framing, and at least one imported gameplay-readable asset category.
```

This uses the existing platformer direction only as a continuity surface. It does not approve final genre, final art direction, final game concept, launch readiness, or market position.

## Minimum Complexity Selection

Phase 4B must include at least three complexity features. The recommended selection includes five:

| Feature | Include | Reason |
|---|---|---|
| multi-room or multi-section level flow | yes | Forces more than one local interaction space. |
| enemy, hazard, or moving obstacle | yes | Adds runtime behavior beyond static collision. |
| score, collectible, timer, or progression state | yes | Forces state tracking and result logic. |
| camera behavior beyond static framing | yes | Adds player-facing spatial readability pressure. |
| richer UI state | yes | Requires start/result/retry/status flow. |
| animation or multi-frame visual state | optional | Useful but can be deferred if the slice is already complex enough. |
| imported gameplay-readable art | yes | Reuses Phase 3 art import capability in a gameplay context. |
| player-facing feel gate | yes | Forces QA and owner judgment separation. |

## Required Role Sequence

```text
Phase 4B Scope/Game Brief
-> Research Agent constraints
-> Art Agent requirements and candidate package
-> BK/Human Creative Owner scope/art review
-> Implementation Agent Godot slice
-> QA Agent technical/playability review
-> BK/Human Creative Owner direct play/feel review
-> Learning Librarian Candidate capture
-> Closeout verification
```

Do not skip owner approval before implementation. Do not let QA perform implementation fixes in the same slice.

## Proposed Work Package Sequence

### WP-030: Phase 4B Scope And Game Brief

Owner: `research` or `learning_librarian`

Goal:

- Convert this plan into a concrete local prototype brief.
- Select the exact complexity features.
- Define allowed Godot target files and excluded gameplay scope.

Outputs:

- `plans/PHASE4B_SCOPE_AND_GAME_BRIEF.md`
- next Research WP

Forbidden:

- Godot edits
- asset edits
- final concept selection
- launch/external testing decisions

### WP-031: Research Constraints

Owner: `research`

Goal:

- Produce reference constraints for the chosen multi-section platformer challenge.
- Define layout, hazard/progression, UI, camera, and feel constraints.

Outputs:

- `research_notes/RN-2026W22-003-phase4b-complex-prototype-reference.md`

Verification:

- Research note maps directly to selected complexity features.
- It does not decide final game concept or market positioning.

### WP-032: Art Requirements And Candidate Package

Owner: `art`

Goal:

- Define imported gameplay-readable asset needs for the prototype.
- Produce reviewable art requirements and candidate surfaces.

Required outputs if asset production happens:

- asset requirements table
- asset manifest
- human-editable CSV review surface
- individual candidate files or explicit reuse decision
- preview surface

Verification:

- Owner can approve, redirect, or reject each asset role.
- No final art approval is implied.

### WP-033: Owner Review

Owner: `learning_librarian` or `qa`

Goal:

- Prepare Korean owner-facing review brief for the selected scope, research constraints, and art package.
- Record BK/Human Creative Owner decision before implementation.

Outputs:

- `owner_reviews/OR-2026W22-005-phase4b-scope-art-KR.md`

Pass:

- Owner approves or redirects implementation boundary.

### WP-034: Implementation

Owner: `implementation`

Goal:

- Build the approved Phase 4B local playable prototype slice in Godot.

Expected implementation scope:

- multi-section level structure
- one hazard or moving obstacle
- collectible/progression state
- simple UI state
- camera follow or section framing
- imported gameplay-readable assets where approved

Forbidden:

- final art polish
- broad movement verb expansion beyond approved scope
- external tester workflow
- platform/export work
- unapproved files

Verification:

- `scripts/smoke_test.sh` with clean output check
- headless scene runtime
- imported asset metadata check where applicable
- no unapproved Godot file changes

### WP-035: QA

Owner: `qa`

Goal:

- Independently review the implementation for technical correctness, scope preservation, playability, asset import validity, UI state, camera/readability, and owner-play readiness.

Pass:

- technical gate passes
- known risks are explicit
- owner direct play judgment is requested, not replaced by QA

### WP-036: Owner Play/Feel Review

Owner: `learning_librarian` or `qa`

Goal:

- Record BK/Human Creative Owner direct test result.

Pass:

- BK can judge whether the slice validates Phase 4B production capability.
- The decision does not approve final game fun, launch readiness, final art, or external testing.

### WP-037: Learning Capture

Owner: `learning_librarian`

Goal:

- Capture reusable production, technical, art-handoff, QA, or prompt lessons as Candidate Learning Cards only.

Forbidden:

- Working, Canonical, or Policy promotion
- raw transcript dumping
- multi-lesson cards

### WP-038: Phase 4B Closeout Verification

Owner: `qa`

Goal:

- Verify artifacts, scope, QA result, owner decision, learning capture, repo hygiene, and explicit deferred work.

Outputs:

- `PHASE4B_CLOSEOUT.md`

Pass:

- Phase 4B can state whether Halucy's production system survived the more complex prototype validation.

## Phase 4B QA Gates

Required gates:

- Work Package schema validation
- Run schema validation
- Review schema validation
- Learning Card schema validation when cards are created
- smoke test with explicit clean-output check
- headless scene runtime
- imported asset source and `.png.import` metadata check when imported assets are in scope
- approved target-file diff review
- QA/Implementation separation check
- owner direct play/feel review

Additional gates for complex prototype:

- multi-section flow is reachable
- hazard or moving obstacle does not make the slice unwinnable unless intentionally documented
- collectible/progression state is visible and resets predictably
- UI state communicates start/result/retry or equivalent status
- camera/readability does not hide the player, hazard, goal, or progression feedback

## Repo Hygiene Rules For Phase 4B

- `game/.godot/` remains ignored and must not be evidence.
- `game/assets/**/*.png.import` is tracked when the matching source PNG is an approved game asset.
- `game/scripts/*.gd.uid` must be explicitly allowed or rejected in the implementation WP. If Godot recreates a sidecar, QA must record whether it is part of the approved output or cleanup scope.
- Work Packages stay in `active/` unless a dedicated lifecycle cleanup WP is approved.
- Commit/stage/push remains out of scope unless BK explicitly asks for shipping.

## Learning Rules

- Learning Librarian may create Candidate Learning Cards.
- Phase 4B may identify Working/Canonical/Policy candidates, but must not promote them.
- Promotion requires a separate owner-approved WP.
- Each Learning Card must contain one reusable claim, evidence, scope, and reuse rule.

## Owner Decision Points

Owner decision required before implementation:

- selected complexity features
- allowed target files
- art/asset package approval or redirect
- excluded scope

Owner decision required after QA:

- direct play/feel result
- whether Phase 4B validates production capability
- whether rework is required before closeout

## Explicit Non-Goals

- final game concept selection
- final art direction or style bible
- production asset approval beyond prototype use
- external tester workflow
- platform launch feedback
- web/export readiness
- monetization or market positioning
- automation implementation unless separately approved
- Learning Card promotion

## Readiness For First Phase 4B Work Package

Ready when BK accepts this plan's prototype boundary and confirms the first WP should create the Phase 4B scope/game brief.

Recommended first execution WP:

```text
WP-030: Phase 4B Scope And Game Brief
```

The first WP should not edit Godot. It should select the concrete complexity features, target files, forbidden scope, expected artifacts, and verification gates for the production loop.

## Stop Conditions

- If the prototype scope becomes final product direction, stop.
- If implementation starts before owner approval of scope and art boundary, stop.
- If QA and implementation are assigned to the same agent slice, stop.
- If external testing or platform feedback enters the loop, stop.
- If Learning Card promotion is attempted, stop.
- If generated assets are imported without explicit manifest and metadata checks, stop.
