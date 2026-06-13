# RN-2026W22-003: Phase 4B Complex Prototype Reference Constraints

## Research Question

For the approved Phase 4B two-section 2D platformer prototype, what narrow
research constraints should Art, Implementation, and QA share before any art
production or Godot implementation starts?

This note covers only layout, hazard or moving obstacle behavior, collectible
or progression state, UI state, camera/readability, feel constraints, and
handoffs.

## Inputs

- `plans/PHASE4B_COMPLEX_PROTOTYPE_VALIDATION_PLAN.md`
- `plans/PHASE4B_SCOPE_AND_GAME_BRIEF.md`
- `production_retrospectives/PR-2026W22-001-phase4a-production-system-retrospective-KR.md`
- `work_packages/active/WP-2026W22-031.json`
- BK/Human Creative Owner chat approval on 2026-06-13 to proceed from WP-030 to
  WP-031

## Owner-Readable Prototype Snapshot

이 노트가 말하는 게임 화면은 아래와 같은 **한 장면짜리 2D 횡스크롤
플랫폼 액션 프로토타입**이다. 아직 최종 게임 컨셉이나 최종 아트 방향은
아니고, Phase 4B에서 제작 시스템을 검증하기 위한 임시 플레이 화면이다.

플레이어가 이해해야 하는 장면:

- 왼쪽에서 시작한다.
- 첫 구간에서 이동과 점프를 확인한다.
- 두 번째 구간에서 보이는 위험물을 피하거나 타이밍을 맞춘다.
- 진행 아이템 하나를 먹는다.
- 오른쪽 목표 지점에 도착하면 성공 UI가 뜬다.
- 실패하거나 다시 하고 싶으면 retry로 같은 상태에서 재시작한다.

## Screen Sketch

이 스케치는 최종 레벨 디자인이 아니라, Art/Implementation/QA가 같은 화면을
상상하기 위한 기준 구도다.

```text
Camera view follows or frames this left-to-right route.

┌──────────────────────────────────────────────────────────────────────────┐
│ UI: READY / ITEM: 0 / 상태 메시지                                       │
│                                                                          │
│ Section 1: warmup                 Section 2: hazard + progression        │
│                                                                          │
│   P                                                                      │
│  [ ]                                                                     │
│███████████        █████████             ★ item                           │
│ start floor        jump ledge             ████████           GOAL        │
│                                          ↓ hazard zone ↓       ▣          │
│                                   ███████░░░░░░░░░░░████████████         │
│                                          danger/read timing              │
└──────────────────────────────────────────────────────────────────────────┘

Legend:
P / [ ] = player placeholder
████    = solid platform or floor
░░░░    = hazard or moving-obstacle lane
★       = collectible / progression item
▣       = goal marker
```

## 30-Second Play Story

1. 화면이 시작되면 플레이어는 왼쪽 바닥 위에 서 있고, UI는 ready 또는
   progress 상태를 보여준다.
2. 플레이어는 오른쪽으로 이동하며 짧은 점프로 첫 발판을 넘어간다.
3. 카메라는 플레이어를 따라가거나 두 번째 구간을 읽을 수 있게 잡아준다.
4. 두 번째 구간에는 명확히 위험해 보이는 영역이나 움직이는 장애물이 있다.
5. 플레이어는 위험 구간을 지나기 전 또는 지난 직후에 보이는 진행 아이템을
   먹는다.
6. UI가 item collected 또는 progress complete 상태로 바뀐다.
7. 플레이어가 오른쪽 goal marker에 닿으면 success/result UI가 뜬다.
8. 위험물에 닿거나 실패 상태가 되면 retry UI가 뜨고, retry 후 아이템과
   위험물 상태가 처음으로 돌아간다.

## Visual Production Target

Art Agent가 다음 단계에서 판단하기 쉽게, 이 프로토타입에 필요한 시각 대상은
아래 5개다.

| Gameplay role | What it should communicate | Final art? |
|---|---|---|
| Player | "내가 조작하는 대상" | No |
| Solid floor/platform | "밟을 수 있고 막힌다" | No |
| Hazard or moving obstacle | "닿으면 실패하거나 피해야 한다" | No |
| Collectible/progression item | "먹으면 상태가 바뀐다" | No |
| Goal marker | "아이템을 먹고 도착해야 하는 목적지" | No |

가장 중요한 시각 판단은 예쁜지보다 **역할이 헷갈리지 않는지**다. 예를 들어
hazard와 collectible이 둘 다 동그랗고 밝은 색이면 안 된다. 위험물은 모양,
패턴, 위치, 움직임 중 최소 하나로 "위험"이 읽혀야 하고, collectible은
"먹어도 되는 것"으로 읽혀야 한다.

## Not The Game Yet

이 화면은 "최종 게임은 이런 분위기다"라는 결정이 아니다. 현재 결정된 것은
아래뿐이다.

- side-view 2D platformer로 production complexity를 검증한다.
- 한 장면 안에 두 구간, 위험물, 진행 아이템, 목표, UI, 카메라를 넣는다.
- 최소 하나의 gameplay-readable imported asset category를 쓴다.
- BK/Human Creative Owner가 나중에 직접 플레이해 느낌을 판단한다.

## Source / Rationale

### Godot Area2D for Hazard and Collectible Detection

Godot `Area2D` is the appropriate reference primitive for simple overlap zones:
it can detect bodies or areas entering and exiting when monitoring is enabled,
and `body_entered` can signal that a player has touched a hazard, goal, or
collectible.

Source: https://docs.godotengine.org/en/stable/classes/class_area2d.html

Phase 4B implication:

- The hazard and collectible should be represented as explicit, readable
  overlap zones rather than hidden script-only checks.
- The collectible/progression state should be triggered by one clear collision
  event and should be easy for QA to reset through retry.
- Collision layers and masks should be named or organized clearly enough that
  QA can inspect intent later.

### Godot Camera2D for Local Framing

Godot `Camera2D` is the standard 2D camera node and provides camera controls
such as position following, smoothing, drag behavior, and limits.

Source: https://docs.godotengine.org/en/stable/classes/class_camera2d.html

Phase 4B implication:

- The prototype may use a following camera or section framing, but the camera
  must stay readable rather than cinematic.
- The camera must keep the player, immediate landing path, hazard, collectible,
  and goal feedback visible at the moments where the player must decide.
- Camera limits should prevent showing irrelevant empty space if the scene
  grows wider than the Phase 2 greybox.

### Godot CanvasLayer for UI State

Godot Canvas layers let UI or HUD elements remain in screen space while the
world view changes. This is useful when a camera moves but status/result/retry
feedback should stay readable.

Source: https://docs.godotengine.org/en/latest/tutorials/2d/canvas_layers.html

Phase 4B implication:

- Start/status/result/retry UI should be separated from world transforms.
- UI should not move with the platformer camera unless a later implementation
  Work Package explicitly chooses world-space labels.
- The UI should remain prototype-grade: no title flow, settings, save/load, or
  full menu system.

### Accessibility Readability Baseline

Game Accessibility Guidelines recommends high contrast, clear text formatting,
readable default font size, and avoiding essential information conveyed by color
alone.

Sources:

- https://gameaccessibilityguidelines.com/basic/
- https://gameaccessibilityguidelines.com/ensure-no-essential-information-is-conveyed-by-a-fixed-colour-alone/

Phase 4B implication:

- Hazard, collectible, goal, and UI state should differ by shape, position,
  label, pattern, or motion cue, not only by color.
- Prototype readability matters even before final art. Art Agent should define
  reviewable signifiers for each gameplay role.
- QA should check whether the player can infer "danger", "collect", "goal",
  "success", "fail", and "retry" without relying on hidden knowledge.

### Phase 2 Movement Continuity

Phase 4B inherits the Phase 2 movement base: left/right movement and one
fixed-height ground jump. The new complexity is production-system stress, not a
new movement verb search.

Source: `research_notes/RN-2026W22-002-platformer-greybox-reference.md`

Phase 4B implication:

- Keep acceleration/friction, gravity, collision, and floor-gated single jump
  as the baseline.
- Do not introduce double jump, wall jump, dash, attack, health, lives,
  checkpoints, or enemy AI to solve layout difficulty.
- If the hazard makes the route too hard, adjust layout/timing before adding
  verbs.

## Layout Constraints

The prototype should be one scene with two readable local sections:

- Section 1: start and traversal warmup.
- Section 2: hazard/progression/goal challenge.

Recommended structure:

- Use a left-to-right route with a clear visual transition between sections.
- Keep the player route fully inspectable by QA in one scene.
- Put the collectible or progression item before the final goal, so the goal can
  visibly depend on progression.
- Keep the first playable route short enough for a 30-60 second BK direct test.
- Do not build a multi-level campaign, branching route map, secret room, or
  procedural layout.

Art-facing layout constraint:

- The two sections should have distinct readable landmarks or background/shape
  treatment, but not final art direction.

Implementation-facing layout constraint:

- Use simple collision geometry and explicit node names so QA can inspect route,
  hazard, collectible, goal, and reset state.

QA-facing layout check:

- Confirm the player can understand section order, reach the collectible, and
  reach the goal without a blind jump or offscreen required action.

## Hazard / Moving Obstacle Constraints

Use exactly one hazard or one moving obstacle for the first Phase 4B slice.

Acceptable options:

- Static hazard zone that fails/retries the run when touched.
- Moving obstacle with a short, predictable loop.
- Moving platform-like obstacle only if it remains a hazard/timing read, not a
  new traversal system.

Recommended constraints:

- Make the hazard behavior visible before it can punish the player.
- Give enough spacing for the player to observe and choose a timing.
- Avoid one-frame precision, hidden hitboxes, flicker, or surprise activation.
- Do not add health, lives, damage numbers, enemy AI, patrol search, combat, or
  boss behavior.

Implementation-facing rationale:

- A single `Area2D` hazard or simple moving body is enough to stress runtime
  behavior, reset flow, and QA readability without opening enemy-system scope.

QA-facing checks:

- The hazard is readable before contact.
- The hazard cannot make the route unintentionally unwinnable.
- Retry resets hazard state predictably.
- The player does not need an unapproved movement verb to pass.

## Collectible / Progression State Constraints

Use one visible collectible or progression trigger.

Recommended behavior:

- The player touches the item or trigger by collision.
- UI/status changes after collection.
- Goal success should depend on the collected/progression state, or at minimum
  communicate whether progression is complete.
- Retry resets the progression state.

Forbidden expansion:

- No inventory.
- No score meta-system.
- No economy, upgrades, shop, quest, dialogue, or multi-item chain.
- No hidden switch puzzle unless separately approved later.

Implementation-facing rationale:

- One progression boolean is enough to test state, UI feedback, reset behavior,
  and owner readability.

QA-facing checks:

- Before collection, the item reads as interactive.
- After collection, state feedback is visible.
- Goal/result behavior changes or confirms progression clearly.
- Retry returns the item/state to the expected starting condition.

## UI State Constraints

Required UI states:

- Start or ready state.
- In-progress status.
- Success/result state.
- Fail or retry feedback if hazard contact or timeout ends the attempt.

Recommended implementation boundary:

- Use screen-space UI, likely through CanvasLayer or equivalent.
- Keep copy short and functional.
- One retry command is enough.
- Do not create a title screen, settings menu, save system, pause menu, or full
  UI framework.

Readability constraints:

- Status text must be large enough to read in the local desktop prototype.
- Important state should not be color-only.
- UI must not cover the player, hazard, collectible, landing zone, or goal.

QA-facing checks:

- The UI communicates current state without external instructions.
- Retry returns the run to a known start state.
- Success requires reaching the approved goal condition.

## Camera / Readability Constraints

The camera should solve readability, not add spectacle.

Acceptable options:

- Follow the player with conservative smoothing.
- Use simple section framing if that better preserves challenge readability.
- Use camera limits to avoid showing large empty areas.

Required visibility:

- Player position.
- Immediate landing path.
- Hazard timing/read.
- Collectible/progression feedback.
- Goal or next local objective when relevant.

Forbidden expansion:

- No cinematic camera.
- No camera shake.
- No cutscenes.
- No hidden offscreen route requirement.

QA-facing checks:

- The player is not lost during jumps, hazard timing, collection, or result.
- Camera movement does not make the hazard harder to read than intended.
- UI remains readable while the world camera moves.

## Feel Constraints

Keep Phase 2 movement verbs and tune complexity through layout/timing:

- move left
- move right
- fixed-height single ground jump
- touch one progression item
- reach goal or retry

Recommended feel target:

- The player should be able to clear the route with ordinary play after a quick
  read, not perfect execution.
- Hazard timing should be forgiving enough for BK direct test to judge the
  production system, not raw difficulty.
- Movement should remain recognizable from Phase 2 unless later owner review
  explicitly redirects feel.

Forbidden feel changes:

- double jump
- wall jump
- dash
- attack
- health, lives, or checkpoints
- advanced platformer forgiveness systems unless separately approved

## Imported Gameplay-Readable Art Constraints

Phase 4B requires at least one imported gameplay-readable asset category, but
this Research slice does not produce art.

Recommended asset roles for Art Agent to evaluate:

- hazard signifier
- collectible/progression item
- goal marker
- optional section landmark

Selection guidance:

- Prefer importing one asset category that directly improves gameplay
  readability rather than decorative background art.
- The asset role must have a clear placeholder fallback if candidate art is
  redirected.
- Final art quality, style bible, brand direction, and production asset approval
  remain out of scope.

## Art Handoff

Art Agent should next define:

- asset requirement table for hazard, collectible/progression, goal, and any
  section landmark
- manifest and human-editable CSV review surface
- individual candidate files or explicit reuse/no-new-art decision
- preview surface that lets BK judge gameplay role readability

Art Agent should not:

- edit Godot files
- approve final art direction
- create launch/brand materials
- bypass owner review

## Implementation Handoff

Implementation Agent should wait for Art output and BK/Human Creative Owner
scope/art approval before Godot edits.

Later implementation should be constrained to:

- one scene with two sections
- one hazard or moving obstacle
- one collectible/progression state
- simple UI state and retry
- camera follow or section framing
- imported gameplay-readable asset category approved by owner
- target files explicitly approved by the Implementation Work Package

Implementation should not:

- add unapproved movement verbs
- expand into enemy AI, health/lives/checkpoints, save/load, audio, title flow,
  platform export, or external testing
- self-approve QA or owner play feel

## QA Handoff

QA Agent should verify:

- Work Package, Run, and Review schema validation
- clean smoke output
- headless scene runtime for `res://scenes/main.tscn`
- approved target-file diff only
- two-section flow is reachable
- hazard or moving obstacle is readable and not unintentionally unwinnable
- collectible/progression state is visible and predictably reset
- start/status/result/retry UI communicates state
- camera/framing does not hide player, hazard, goal, or progression feedback
- imported source PNG and `.png.import` metadata exist when assets are used
- Implementation and QA separation is preserved
- BK/Human Creative Owner direct play/feel review is still required before
  Phase 4B pass

## Handoff To Learning Librarian Agent

Learning Librarian should only create Candidate Learning Cards if Phase 4B later
produces reusable evidence, such as:

- a repeatable hazard/progression QA pattern
- a useful Research-to-Art asset-role handoff pattern
- a Godot import/runtime validation lesson
- a scope-control failure in complex prototype production

Routine Research completion alone is not a Learning Card trigger.

## Uncertainty

- Exact hazard type remains open for Art/Owner review; Research recommends one
  hazard or moving obstacle but does not choose final creative treatment.
- Exact camera setup remains open; Implementation should choose the simplest
  framing that satisfies readability after owner-approved constraints.
- Exact UI wording remains open; later Art/Implementation should keep it short
  and functional.
- Exact imported asset category remains open; Art should propose the smallest
  gameplay-readable asset package that satisfies Phase 4B.
- Play/feel quality remains a BK/Human Creative Owner judgment after QA; this
  note does not claim the prototype will be fun or production-ready.
