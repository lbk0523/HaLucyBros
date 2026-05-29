# RN-2026W22-002: Platformer Greybox Reference Note

## 연구 질문

Phase 2 platformer greybox vertical slice에서 Implementation, Art, QA가 공유해야 할 최소 reference constraint는 무엇인가?

범위는 acceleration/friction, fixed-height single jump feel, readable obstacle/path layout에 한정한다.

## 입력

- `PHASE2_PLATFORMER_GREYBOX_PLAN.md`
- `context/game_brief.md`
- Godot 4.x desktop-first, web-capable prototype target
- 현재 Phase 2 제외 범위: final art, enemy, item, scoring, camera polish, web export hard gate, double jump, wall jump, dash

## Source / Rationale

### Godot CharacterBody2D

Godot 4.6 `CharacterBody2D` 문서는 character body가 code-controlled body이며, gravity 같은 힘을 적용할 수는 있지만 실제 이동 계산은 코드가 해야 한다고 설명한다.

Source: https://docs.godotengine.org/en/4.6/tutorials/physics/using_character_body_2d.html

Phase 2 implication:

- 현재 `ColorRect` 직접 `position` 이동은 collision/gravity platformer에는 충분하지 않다.
- Implementation은 `CharacterBody2D` 또는 동등한 collision-aware controller 구조를 사용해야 한다.
- gravity, horizontal acceleration, friction, jump impulse는 explicit velocity update로 관리해야 한다.

### move_and_slide, floor/wall detection

Godot 문서는 `move_and_slide()`가 velocity 기반으로 이동하고 collision surfaces along the way에 따라 slide response를 계산한다고 설명한다. `is_on_floor()`, `is_on_wall()`, `is_on_ceiling()` 판정은 grounded platformer controller에서 floor/wall 의미를 구분하는 데 사용된다.

Sources:

- https://docs.godotengine.org/en/4.6/tutorials/physics/using_character_body_2d.html
- https://docs.godotengine.org/en/latest/classes/class_characterbody2d.html

Phase 2 implication:

- jump 허용 조건은 `is_on_floor()` 계열 floor 판정에 묶어 single jump를 강제한다.
- QA는 wall collision, floor collision, jump gating이 의도대로 구분되는지 봐야 한다.
- slope, moving platform, wall interaction은 Phase 2 첫 slice에 넣지 않는다. 이들은 controller edge case를 늘린다.

### 2D movement baseline

Godot 2D movement overview는 2D movement examples에서 `CharacterBody2D`, input-derived direction, velocity, `_physics_process`, `move_and_slide()` 조합을 기본 구조로 다룬다.

Source: https://docs.godotengine.org/en/4.0/tutorials/2d/2d_movement.html

Phase 2 implication:

- movement update는 `_physics_process(delta)`에 둔다.
- input read, velocity update, collision movement의 순서를 단순하게 유지한다.
- Phase 2 first playable은 custom physics framework가 아니라 Godot 기본 character-body 흐름 위에 올린다.

### Acceleration and friction control

Godot `Vector2.move_toward()`는 현재 vector를 target vector로 고정 delta만큼 이동시키며 target을 지나치지 않는다.

Source: https://docs.godotengine.org/en/stable/classes/class_vector2.html

Phase 2 implication:

- horizontal velocity는 즉시 max speed로 바꾸기보다 target speed로 수렴시키는 방식이 적합하다.
- acceleration/friction 값은 QA가 "너무 미끄럽다", "너무 즉시 멈춘다", "공중 방향 전환이 과하다"처럼 판단할 수 있게 분리된 tuning variable이어야 한다.
- 첫 slice에서는 advanced momentum conservation, coyote time, jump buffering, variable jump height를 넣지 않는다.

## Movement Constraint Recommendations

### Horizontal movement

권장 constraint:

- left/right input maps to a horizontal target speed.
- velocity.x moves toward the target speed with acceleration while input exists.
- velocity.x moves toward zero with friction when no horizontal input exists.
- ground movement and air movement may share the same values in the first slice unless QA finds route judgment impossible.

Implementation-facing rationale:

- direct position movement does not test collision or grounded movement feel.
- instant velocity assignment hides acceleration/friction feel.
- separate acceleration/friction variables make later QA feedback actionable.

QA-facing checks:

- player can start, stop, and reverse direction intentionally.
- stopping does not feel like an immediate teleport to zero speed.
- movement is not so slippery that the right-side goal is unreachable under the time limit.

### Fixed-height single jump

권장 constraint:

- jump is allowed only when the player is on the floor.
- jump applies one fixed vertical impulse or fixed jump velocity.
- holding the jump button should not increase jump height in this first slice.
- no double jump, wall jump, dash, coyote time, or jump buffer.

Implementation-facing rationale:

- fixed-height single jump keeps route design and QA reachability simple.
- floor-gated jump is enough to test gravity, collision, and obstacle traversal.
- variable jump height and forgiveness mechanics should wait until the basic route is playable.

QA-facing checks:

- pressing jump while grounded produces one consistent-height jump.
- pressing jump while airborne does not trigger another jump.
- every required obstacle can be cleared with the single jump.
- no route requires wall contact, dash timing, or hidden advanced input.

### Gravity and collision

권장 constraint:

- gravity always affects the player when not supported by floor collision.
- floor and obstacle collision should use simple rectangular placeholder geometry.
- walls/obstacles should block movement clearly without causing the player to tunnel, stick unpredictably, or climb by accident.
- slopes and moving platforms are out of scope.

Implementation-facing rationale:

- rectangular greybox collision is sufficient for the harness demo.
- slope and moving-platform behavior would add controller interpretation work that is not needed for the first playable.

QA-facing checks:

- player lands on floor and does not fall through.
- player cannot pass through obstacles.
- player does not gain unintended vertical movement from wall contact.

## Readable Obstacle / Path Layout Constraints

권장 layout:

- one readable left-to-right route
- one or two simple obstacles or platforms
- visible right-side goal
- no blind jumps
- no offscreen route requirement
- no failure state that requires lives, checkpoints, health, or scoring

Art-facing readability constraints:

- player, floor, obstacle, goal, and timer must be visually distinct even with placeholder shapes.
- solid collision surfaces should read as solid.
- goal should read as destination, not obstacle.
- timer should be visible enough for QA/player judgment but should not become a polished UI system.

Implementation-facing constraints:

- keep the first level small enough for manual QA reachability verification.
- prefer a route that can be completed with margin rather than requiring perfect execution.
- use placeholder dimensions that make collision intent obvious.

QA-facing checks:

- player understands the route without instruction text beyond the greybox affordances.
- the goal is reachable before timeout with ordinary play.
- if timeout is the only required fail condition, no extra fail systems are introduced.

## Uncertainty

- Exact time limit remains open. The first implementation should choose a conservative value that allows QA to complete the route without perfect play.
- Exact obstacle count and level length remain open. The implementation should start smaller than a full level.
- Falling/reset behavior remains open. If needed, keep it placeholder-grade and avoid lives/checkpoints.
- `CharacterBody2D` is the expected direction, but this note does not change schema or mandate a final controller architecture beyond collision-aware platformer movement.
- Platformer feel is subjective. This note gives constraints for the first playable, not final movement tuning.

## Handoff To Art Agent

Art Agent should create a placeholder readability manifest for:

- player body
- floor
- obstacle
- goal area
- timer
- contrast and shape rules

Art Agent should not create final sprites, style bible, brand direction, or production assets.

## Handoff To Implementation Agent

Implementation Agent should wait for Art output and BK/Human Creative Owner approval before Godot edits.

After approval, implementation should:

- use collision-aware platformer movement
- implement gravity
- implement horizontal acceleration/friction
- implement fixed-height single jump gated by floor contact
- build a small left-to-right greybox route
- keep excluded systems out

## Handoff To QA Agent

QA Agent should verify:

- smoke/build cleanliness
- left start and right goal are present
- player can reach the goal before timeout
- gravity and floor collision work
- obstacles block movement
- jump is single and fixed-height
- movement feel exposes acceleration/friction
- no excluded feature entered the slice

## Handoff To Learning Librarian Agent

Learning Librarian should only create Candidate Learning Cards if this slice produces reusable evidence, such as:

- a repeatable Godot controller constraint
- a useful Research-to-Art handoff pattern
- a failure mode in platformer greybox scope control

Routine task completion alone is not a Learning Card.
