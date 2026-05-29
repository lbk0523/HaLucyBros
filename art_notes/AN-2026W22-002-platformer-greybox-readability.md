# AN-2026W22-002: Platformer Greybox Readability Manifest

## 목적

Phase 2 platformer greybox vertical slice에서 BK가 Owner approval을 판단하고, Implementation Agent가 Godot greybox를 만들 수 있도록 placeholder 시각 가독성 기준을 정의한다.

이 문서는 최종 아트 방향, concept art, generated production asset, imported sprite, brand style, style bible이 아니다. Godot 변경도 승인하지 않는다.

## 입력

- Phase plan: `PHASE2_PLATFORMER_GREYBOX_PLAN.md`
- Game brief: `context/game_brief.md`
- Research note: `research_notes/RN-2026W22-002-platformer-greybox-reference.md`
- Art profile: `agents/profiles/art_agent.yaml`

## 경계

이 manifest는 placeholder geometry만 다룬다.

허용:

- player, floor, obstacle, goal, timer의 shape/readability rule
- greybox contrast rule
- Implementation과 QA가 판단할 수 있는 visual affordance

금지:

- final art
- generated production assets
- imported sprites
- brand style
- character identity
- worldbuilding
- concept art
- animation polish
- camera polish
- score UI
- item/enemy visual direction

## Placeholder Visual System

### Shared Rules

- 모든 주요 요소는 단순한 built-in geometry로 표현한다.
- 색상은 기능 구분을 위해서만 사용한다.
- 미묘한 색상 차이만으로 기능을 구분하지 않는다.
- player, solid surface, obstacle, goal, timer는 한눈에 분리되어야 한다.
- decorative elements는 넣지 않는다. 장식인지 gameplay cue인지 헷갈리는 요소는 제외한다.

권장 기능 색상군:

- player: high-saturation cool color
- floor/platform: neutral dark or mid gray
- obstacle/blocker: darker neutral or warning-adjacent color
- goal: high-contrast green or cyan
- timer: plain high-contrast text or bar
- background: low-contrast flat color

색상값은 final palette가 아니다. Implementation은 Godot 기본 `ColorRect`, `Label`, simple `Area2D`/collision debug-friendly shapes로 대체할 수 있다.

## Element Rules

### Player

Read goal:

- 즉시 조작 대상으로 읽혀야 한다.
- floor/obstacle과 혼동되지 않아야 한다.
- jump 중에도 위치와 몸체 크기가 읽혀야 한다.

Allowed placeholder:

- simple rectangle or capsule-like rectangle approximation
- strong body color
- small direction/facing cue only if route readability에 도움이 될 때

Avoid:

- character face
- costume
- final sprite silhouette
- complex outline
- squash/stretch animation requirement

Implementation handoff:

- player body는 collision shape와 시각 shape가 크게 어긋나지 않아야 한다.
- if a heading/facing cue is used, it must not imply dash, attack, or aim mechanics.

QA checks:

- player is identifiable while standing, moving, and jumping.
- player does not visually merge with solid surfaces.

### Floor And Platforms

Read goal:

- player가 설 수 있는 solid surface로 즉시 읽혀야 한다.
- route path를 구성해야 하며 decoration처럼 보이면 안 된다.

Allowed placeholder:

- horizontal rectangular blocks
- one or two platform heights
- simple ground strip

Avoid:

- slopes
- moving platforms
- texture detail
- decorative background lines that look collidable

Implementation handoff:

- visual floor bounds should match collision bounds closely.
- floor/platform color should differ clearly from background and goal.

QA checks:

- QA can tell where the player should land.
- no visual platform lacks collision unless explicitly marked non-solid, which is not recommended for this slice.

### Obstacles / Blockers

Read goal:

- obstacle should read as a blocker or traversal constraint.
- obstacle should support route judgment without implying enemy, hazard damage, or collectible interaction.

Allowed placeholder:

- rectangular block
- vertical wall segment
- simple raised block requiring a jump

Avoid:

- spikes, flames, creatures, traps, pickups
- visual language that implies damage, lives, or score
- hidden blockers

Implementation handoff:

- one or two obstacles are enough for this first slice.
- obstacles should be visible before the jump/route decision.
- no obstacle should require double jump, wall jump, dash, coyote time, or jump buffer.

QA checks:

- obstacle blocks movement.
- obstacle does not look like a collectible or enemy.
- obstacle route is clear enough to test single-jump reachability.

### Goal Area

Read goal:

- right-side destination should be obvious.
- goal must not look like an obstacle.

Allowed placeholder:

- outlined rectangle
- vertical finish zone
- simple flag-like marker made from geometry
- goal area label if needed for QA readability

Avoid:

- reward chest
- portal effect
- collectible gem
- final level-end animation

Implementation handoff:

- goal should be placed at the right end of the route.
- goal should have a collision/trigger region distinct from visual decoration.
- trigger area should be large enough that QA can verify success without pixel-perfect positioning.

QA checks:

- player understands where to go.
- reaching the goal is visibly distinct from touching an obstacle.

### Timer

Read goal:

- player and QA should understand that time is limited.
- timer should support pass/fail testing without becoming a polished UI system.

Allowed placeholder:

- simple numeric `Label`
- simple horizontal bar
- plain text such as `TIME 20`

Avoid:

- score panel
- medals/ranks
- animated countdown polish
- multi-state HUD

Implementation handoff:

- timer should be visible during play.
- timer should not hide route-critical geometry.
- if exact time is still undecided, start with a conservative value that allows non-perfect completion.

QA checks:

- QA can see remaining time.
- timeout failure can be observed without extra scoring or lives systems.

## Layout Readability

The first route should be one readable left-to-right path.

Recommended structure:

```text
start zone -> short flat movement -> one jump/blocker read -> landing/continue -> right-side goal
```

Constraints:

- no blind jumps
- no offscreen target
- no branching route
- no decorative fake platforms
- no required perfect timing
- no hidden collision
- no moving platform
- no slope

The route should be small enough that QA can manually confirm reachability and scope preservation.

## BK Placeholder Quality Gate

BK can approve this manifest for implementation only if all are true:

1. Player, floor, obstacle, goal, and timer have distinct placeholder reads.
2. The visual rules support the accepted platformer greybox hook.
3. Nothing implies final art, brand, character identity, world, enemy, item, scoring, or camera polish.
4. Implementation can build the greybox without another Art decision.
5. QA can use the visual rules to judge reachability, single-jump constraint, collision clarity, and timeout readability.

If any item fails, BK should redirect before Godot implementation.

## Implementation Handoff

Implementation Agent may use this manifest only after BK/Human Creative Owner approval.

Implementation should:

- keep visuals built-in and placeholder-grade
- align visual bounds with collision bounds
- keep route left-to-right and readable
- make player/floor/obstacle/goal/timer visually distinct
- avoid final assets and decorative visual language

Implementation must not:

- add final sprites or generated assets
- add enemies, items, scoring, camera polish, dash, double jump, wall jump, or final UI
- reinterpret this manifest as final art direction

## QA Handoff

QA Agent should verify:

- player is visually identifiable
- solid surfaces read as solid
- obstacles read as blockers, not enemies/items
- goal reads as destination
- timer is visible and supports timeout testing
- visual bounds and collision behavior are not misleading
- no excluded visual/gameplay feature entered the slice

## Owner Review Handoff

Owner review should approve, redirect, or reject this manifest together with:

- `context/game_brief.md`
- `research_notes/RN-2026W22-002-platformer-greybox-reference.md`

Approval applies only to Phase 2 platformer greybox implementation. It does not approve final creative direction, style bible, production art, brand direction, launch positioning, or durable policy changes.

## Learning Handoff

Learning Librarian should consider Candidate Learning Cards only if later QA/implementation evidence shows a reusable lesson, such as:

- placeholder readability rules reduced implementation ambiguity
- visual/collision mismatch caused QA failure
- owner review needed a different manifest format

This manifest alone does not require a Learning Card.
