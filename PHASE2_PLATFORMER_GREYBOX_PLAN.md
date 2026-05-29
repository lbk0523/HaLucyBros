# Phase 2 Platformer Greybox Plan

## Status

This document fixes the working plan for Phase 2 before any Phase 2 implementation begins.

Phase 2 is a **platformer greybox vertical slice**. Its purpose is to demonstrate the Halucy production harness with a playable slice, not to select a final launch product, final art direction, market position, or broad automation policy.

The plan preserves the Phase 1 production loop:

```text
Research Agent -> Art Agent -> BK/Human Creative Owner -> Implementation Agent -> QA Agent -> Learning Librarian Agent
```

## Accepted Decisions

- Build from the current movement toy, but shift from top-down movement to a 2D side-view platformer greybox.
- The player starts on the left and must reach a goal area at the right end.
- The slice uses a short time limit.
- The slice tests movement direction, acceleration, route feel, and path judgment.
- Floors and obstacles have collision.
- Gravity applies.
- Player verbs are limited to horizontal movement and fixed-height single jump.
- The slice remains placeholder-grade and uses simple geometry.

## Excluded Scope

Phase 2 first playable does not include:

- final art
- imported final sprites
- enemy behavior
- collectible item systems
- scoring systems
- camera polish
- web export as a hard gate
- double jump
- wall jump
- dash
- broad automation
- Learning Card promotion beyond Candidate
- Canonical or Policy decisions

## Artifact Map

Phase 2 should produce or update these artifact families in order:

| Stage | Artifact | Purpose |
|---|---|---|
| Plan | `PHASE2_PLATFORMER_GREYBOX_PLAN.md` | Durable execution plan and phase boundary |
| Game brief | `context/game_brief.md` | Player-facing hook, verbs, success/fail conditions, excluded scope |
| Research | `research_notes/RN-2026W22-002-platformer-greybox-reference.md` | Narrow reference pack for platformer feel, acceleration, jump, obstacle path readability |
| Art | `art_notes/AN-2026W22-002-platformer-greybox-readability.md` | Placeholder visual/readability manifest for player, floor, obstacle, goal, timer |
| Owner review | `owner_reviews/OR-2026W22-002-platformer-greybox-KR.md` | BK approval, redirect, or rejection before Godot implementation |
| Implementation | `game/scenes/main.tscn`, `game/scripts/player.gd` | Godot greybox and first playable behavior |
| Run evidence | `runs/RUN-*.json` | Execution record for each Work Package that mutates artifacts |
| QA | `reviews/RV-*.json` | Independent QA review of build, scope, playability, and constraints |
| Learning | `learning_cards/candidate/LC-*.json` | Candidate-only reusable lessons when evidence justifies capture |

## Proposed Work Package Sequence

### WP-A. Phase 2 Game Brief

Owner: Research Agent or planning operator with BK direction.

Targets:

- `context/game_brief.md`
- Work Package and Run records as required by the current repo workflow

Inputs:

- `PHASE1_CLOSEOUT.md`
- `HALUCY_FOUNDATION.md`
- `Halucy Codex 구현 계획.md`
- `PHASE2_PLATFORMER_GREYBOX_PLAN.md`

Output requirements:

- State the hook in player-facing terms.
- Define player verbs: horizontal movement and fixed-height single jump.
- Define success and fail conditions.
- Record excluded scope.
- Keep the slice greybox and harness-demo oriented.

Stop if:

- The brief starts choosing final genre, brand, monetization, or launch positioning.
- The brief cannot describe the first 30 seconds of play clearly enough for Research and Art handoff.

### WP-B. Research Reference Pack

Owner: Research Agent.

Targets:

- `research_notes/RN-2026W22-002-platformer-greybox-reference.md`
- Work Package and Run records as required by the current repo workflow

Scope:

- Platformer acceleration and friction references.
- Fixed-height single jump feel.
- Simple obstacle/path layout references.
- Constraints useful to Implementation and QA.

Forbidden:

- Market launch conclusion.
- Final concept selection.
- Final genre claim.
- Asset recommendation that bypasses Art review.

Stop if:

- Research cannot produce implementation-useful constraints.
- Research expands into market strategy instead of playable greybox feel.

### WP-C. Art And Readability Manifest

Owner: Art Agent.

Targets:

- `art_notes/AN-2026W22-002-platformer-greybox-readability.md`
- Work Package and Run records as required by the current repo workflow

Scope:

- Placeholder player silhouette.
- Floor, obstacle, and goal readability.
- Timer readability.
- Contrast and shape constraints for greybox testing.
- Visual rules that help QA judge collision, route, and goal clarity.

Forbidden:

- Final art direction.
- Generated production assets.
- Imported sprites.
- Brand style.
- Concept art.

Stop if:

- The manifest is too vague for Implementation to build without another Art decision.
- The manifest implies final art approval.

### WP-D. Owner Approval Gate

Owner: BK/Human Creative Owner.

Targets:

- `owner_reviews/OR-2026W22-002-platformer-greybox-KR.md`

Decision options:

- approve
- redirect
- reject

The Implementation Agent must not mutate Godot files until this gate approves the game brief, research input, and art/readability manifest as sufficient for a greybox implementation slice.

Stop if:

- BK approval is missing.
- BK approves only part of the direction and asks for another Research or Art pass.
- The implementation target or excluded scope changes materially.

### WP-E. Godot Greybox Implementation

Owner: Implementation Agent.

Targets:

- `game/scenes/main.tscn`
- `game/scripts/player.gd`
- supporting Godot files only if explicitly authorized by the Work Package
- `runs/RUN-*.json`

Likely implementation direction:

- Replace the current `ColorRect` direct-position movement with a platformer controller suitable for collision and gravity.
- Use `CharacterBody2D` or an equivalent Godot 4.x structure appropriate for floor collision, horizontal acceleration/friction, gravity, and fixed-height single jump.
- Build simple placeholder floor, obstacles, start position, goal area, and timer feedback.
- Preserve desktop-first local smoke testing.

Forbidden:

- Final assets.
- Enemy systems.
- Item systems.
- Score systems.
- Camera polish.
- Web export.
- Double jump, wall jump, dash.
- Broad schema, profile, adapter, CI, or automation changes unless separately authorized.

Verification:

- `scripts/smoke_test.sh`
- output cleanliness check for `SCRIPT ERROR` or `ERROR:`
- schema validation for the Run record
- changed-file scope check against the Work Package targets

Stop if:

- Godot cannot load the scene cleanly.
- Collision or jump behavior requires unauthorized scope expansion.
- The implementation cannot keep the route playable with fixed-height single jump only.

### WP-F. Independent QA Review

Owner: QA Agent.

Targets:

- `reviews/RV-*.json`
- optional QA notes only if authorized by the Work Package

Checks:

- Build and smoke test pass.
- Player starts left and can reach the right-side goal.
- Gravity, floor collision, and obstacle collision behave as intended.
- Jump is single and fixed-height.
- Movement feel exposes acceleration/friction and route judgment.
- Excluded scope stayed excluded.
- Human creative judgment is recorded where required.

Stop if:

- QA cannot verify reachability.
- QA finds scope drift into excluded features.
- QA is performed by the same agent/session that implemented the slice without an independent review boundary.

### WP-G. Learning Capture

Owner: Learning Librarian Agent.

Targets:

- `learning_cards/candidate/LC-*.json`
- Work Package and Run records as required by the current repo workflow

Scope:

- Candidate-only learning capture.
- Capture reusable production, technical, prompt, or failure lessons only when evidence supports them.
- Do not turn routine status notes into Learning Cards.

Forbidden:

- Working, Canonical, or Policy promotion.
- Hidden memory.
- Raw transcript dumping.

Stop if:

- No reusable lesson exists.
- A proposed card mixes multiple lessons.
- Evidence links do not support the claim.

## Owner Approval Gate

Owner approval is required before Phase 2 Godot implementation begins.

The owner review should answer:

- Is the platformer greybox hook approved for a harness-demo first playable?
- Are the Research and Art inputs concrete enough for Implementation?
- Are excluded features still excluded?
- Is the slice small enough to QA independently?
- Does BK approve implementation now, redirect the plan, or reject the slice?

The approval applies only to this Phase 2 platformer greybox slice. It does not approve final game direction, launch positioning, final art, broader automation, or durable policy changes.

## Verification Strategy

Planning artifacts:

- Confirm accepted decisions are represented.
- Confirm excluded scope is explicit.
- Confirm each artifact has a role owner and handoff target.

Research and Art artifacts:

- Check that they are narrow enough for implementation.
- Check that they do not bypass Human Creative Owner authority.

Implementation:

- Run `scripts/smoke_test.sh`.
- Treat output containing `SCRIPT ERROR` or `ERROR:` as failure even if the process exits successfully.
- Validate Run record schema with current AJV command style.
- Confirm changed files match the active Work Package targets.

QA:

- QA must be independent from implementation.
- QA must record reachability, control constraints, scope preservation, and playability judgment.

Learning:

- Capture Candidate Learning Cards only when evidence supports a reusable lesson.
- Do not promote to Working, Canonical, or Policy during this Phase 2 first playable slice unless a separate authority path is approved.

## Stop Conditions

Stop Phase 2 execution and return to planning if any of these occur:

- BK does not approve the game brief, research note, or art/readability manifest.
- The playable hook cannot be stated clearly enough for implementation.
- The slice expands into final art, enemies, item systems, score systems, camera polish, web export, double jump, wall jump, or dash.
- Research or Art artifacts are too vague for Implementation to proceed.
- Implementation requires unauthorized files or systems.
- `scripts/smoke_test.sh` fails or emits `SCRIPT ERROR` or `ERROR:`.
- QA cannot confirm that the player can reach the goal with fixed-height single jump.
- QA is not independent from Implementation.
- Learning capture tries to create policy or canonical memory without the required authority.

## Decision Debt

These decisions remain open and should be resolved before or during the relevant Work Package:

- Exact time limit, such as 20 seconds or 30 seconds.
- Level length and obstacle count.
- Whether failure includes only timeout, or also falling/reset.
- Goal area representation.
- Timer representation.
- Whether `CharacterBody2D` is mandatory or simply the expected implementation direction.
- Whether `game/scripts/player.gd.uid` sidecar files should be tracked if Godot creates them.
- Whether `scripts/smoke_test.sh` should be hardened before or during the implementation slice.
- Whether existing active Phase 1 Work Packages should be moved to `done/` before Phase 2 starts.

## Next Execution Boundary

The next executable slice is **Phase 2A planning artifacts**, not Godot implementation.

Recommended next action:

1. Create a Work Package for `context/game_brief.md`.
2. Write the Phase 2 platformer greybox game brief.
3. Record the Run evidence.
4. Verify the brief covers accepted decisions, excluded scope, success/fail conditions, and handoff needs.

Only after game brief, research reference, art/readability manifest, and owner approval are complete should the Implementation Agent mutate Godot files.
