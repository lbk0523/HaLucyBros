# Phase 2 Game Brief: Platformer Greybox Vertical Slice

## Status

This brief defines the Phase 2A player-facing direction for the first playable platformer greybox slice.

It is not a final game concept, final art direction, market positioning document, launch plan, or automation policy. It exists so Research, Art, Owner Review, Implementation, QA, and Learning can operate from the same bounded playable target.

## Production Goal

Create a small 2D side-view platformer greybox that demonstrates Halucy's role-separated production harness can produce a playable core loop with traceable handoffs.

The player starts on the left side of the level and must reach a goal area at the right end before a short timer expires.

## Player-Facing Hook

In the first 30 seconds, the player should understand:

- I begin on the left.
- I need to reach the goal on the right.
- I can move horizontally and perform one fixed-height jump from the ground.
- Floors and obstacles are solid.
- Gravity pulls me down.
- I need to judge acceleration, friction, jump timing, and route shape quickly enough to reach the goal before time runs out.

## Player Verbs

Allowed player verbs:

- move left
- move right
- fixed-height single jump from the ground

Not allowed in this slice:

- double jump
- wall jump
- dash
- attack
- interact
- collect item
- activate switch

## Core Loop

The core loop is:

```text
start left -> read path -> move and jump through greybox route -> reach right-side goal before timer ends -> pass or fail
```

This loop should be testable without final art, enemies, items, scoring, camera polish, or web export.

## Level And Interaction Requirements

The greybox level should include:

- a clear start position on the left
- a clear goal area on the right
- floor collision that supports the player
- at least one obstacle or platform arrangement that requires route judgment
- gravity
- acceleration and friction that are noticeable enough for QA to comment on movement feel
- a timer representation sufficient for player and QA readability

The level should stay small enough for independent QA to verify reachability manually.

## Success Condition

The player succeeds when the player reaches the right-side goal area before the timer expires.

Success does not require score, collection, enemy defeat, level ranking, or animation polish.

## Failure Condition

The required failure condition is timer expiration before reaching the goal.

Falling/reset behavior remains decision debt. If implementation needs a fall boundary, it must keep the behavior placeholder-grade and avoid expanding into lives, checkpoints, health, scoring, or broader level systems.

## Visual Direction Boundary

This slice uses placeholder geometry only.

Research and Art should define readability constraints for:

- player shape
- floor and obstacle shape
- goal area
- timer
- contrast between player, world, and goal

They should not define final sprites, final character identity, brand style, production assets, or concept art.

## Explicitly Excluded Scope

This brief excludes:

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
- market launch positioning
- monetization
- final game title or brand direction
- broad automation
- Learning Card promotion beyond Candidate
- Canonical or Policy decisions

## Handoff Requirements

Research Agent should produce a narrow reference note for platformer acceleration, friction, fixed-height jump feel, and readable obstacle path constraints.

Art Agent should produce a placeholder readability manifest for player, floors, obstacles, goal area, and timer.

BK/Human Creative Owner must approve the game brief, research note, and art/readability manifest before Godot implementation begins.

Implementation Agent may mutate Godot files only after the owner approval gate authorizes the greybox implementation slice.

QA Agent must independently verify reachability, gravity/collision behavior, fixed-height single jump scope, movement feel, and excluded-scope preservation.

Learning Librarian Agent should create Candidate Learning Cards only if reusable lessons are supported by evidence.

## Open Decisions

These decisions remain open for later Work Packages:

- exact time limit
- exact level length
- obstacle count and layout
- goal area representation
- timer representation
- whether falling causes reset or only blocks progress
- whether `CharacterBody2D` is mandatory or simply the expected implementation direction

## Phase 2A Acceptance Criteria

This brief is sufficient for Phase 2A if:

- the first 30 seconds of play are understandable from the brief
- accepted Phase 2 decisions are represented
- excluded scope is explicit
- Research and Art can produce their next artifacts without re-deciding the game direction
- implementation remains blocked until owner approval is recorded
