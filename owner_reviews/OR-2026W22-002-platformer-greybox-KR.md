# OR-2026W22-002: Phase 2 Platformer Greybox Owner Review

## BK가 지금 검수할 것

이번 검수 대상은 최종 게임 컨셉, 최종 아트, 출시 가능성, 시장성 판단이 아니다.

검수할 것은 다음 하나다.

```text
Phase 2 platformer greybox vertical slice를 Godot implementation으로 넘길 만큼 game brief, research note, art/readability manifest가 충분한가?
```

이 문서만 읽고 approve, redirect, reject 중 하나를 결정할 수 있어야 한다. 원문 artifact는 evidence이지만, BK 판단에 필요한 핵심 맥락은 아래에 한국어로 요약한다.

## 원문 Evidence

- Phase 2 plan: `PHASE2_PLATFORMER_GREYBOX_PLAN.md`
- Game brief: `context/game_brief.md`
- Research note: `research_notes/RN-2026W22-002-platformer-greybox-reference.md`
- Art/readability manifest: `art_notes/AN-2026W22-002-platformer-greybox-readability.md`
- 관련 Work Packages:
  - `work_packages/active/WP-2026W22-008.json`
  - `work_packages/active/WP-2026W22-009.json`
  - `work_packages/active/WP-2026W22-010.json`
- 관련 Run records:
  - `runs/RUN-20260528-005.json`
  - `runs/RUN-20260528-006.json`
  - `runs/RUN-20260528-007.json`

JSON은 구조화 artifact라 원문 형식을 유지한다. BK가 판단해야 하는 JSON 핵심은 이 문서의 "권한과 범위 요약"에 포함한다.

## 권한과 범위 요약

Phase 2A, 2B, 2C의 의미:

- `WP-2026W22-008`은 Phase 2 game brief 작성 slice다.
- `WP-2026W22-009`는 platformer greybox reference note 작성 slice다.
- `WP-2026W22-010`은 placeholder Art/readability manifest 작성 slice다.
- 세 slice 모두 Godot 파일 수정을 승인하지 않았다.
- 세 slice 모두 final art, generated production assets, imported sprites, brand style, market launch positioning, final concept selection을 승인하지 않았다.
- `WP-2026W22-010`은 `human_decision_required: true`다.
- Implementation Agent는 BK가 이 owner gate에서 approve하기 전까지 Godot 파일을 수정하면 안 된다.

## Game Brief 요약

Phase 2 playable target은 2D side-view platformer greybox다.

플레이어가 첫 30초 안에 이해해야 하는 것:

- 왼쪽에서 시작한다.
- 오른쪽 끝 목표 지점에 도착해야 한다.
- 제한 시간이 있다.
- 좌우 이동과 fixed-height single jump만 사용할 수 있다.
- 바닥과 장애물은 collision이 있다.
- 중력이 작용한다.
- 가속, 마찰, 점프 타이밍, 경로 형태를 빠르게 판단해야 한다.

성공 조건:

- 제한 시간 안에 오른쪽 목표 지점에 도착한다.

필수 실패 조건:

- 목표 도착 전에 시간이 만료된다.

아직 열려 있는 결정:

- 정확한 제한 시간
- 레벨 길이
- 장애물 수와 배치
- 목표 지점 표현
- 타이머 표현
- 낙하/reset 처리 여부

## Research Note 요약

Research Agent는 Phase 2 구현에 필요한 좁은 reference constraint만 정리했다.

핵심 제안:

- collision/gravity platformer에는 현재 `ColorRect` 직접 `position` 이동이 부족하다.
- Implementation은 `CharacterBody2D` 또는 동등한 collision-aware controller 구조를 써야 한다.
- 이동 업데이트는 `_physics_process(delta)`에서 input, velocity update, collision movement 순서를 단순하게 유지한다.
- `move_and_slide()`와 floor 판정을 사용해 grounded movement와 single jump를 구분한다.
- horizontal velocity는 즉시 max speed로 바꾸기보다 acceleration/friction 값으로 target speed에 수렴시키는 방향이 적합하다.
- jump는 floor contact에서만 가능한 fixed-height single jump로 제한한다.
- slope, moving platform, coyote time, jump buffer, variable jump height, double jump, wall jump, dash는 첫 slice에서 제외한다.
- route는 한 개의 읽기 쉬운 left-to-right path와 한두 개의 단순 obstacle/platform이면 충분하다.

Research note는 market launch positioning, final concept selection, final art direction을 승인하지 않는다.

## Art Manifest 요약

Art Agent는 final art가 아니라 placeholder readability 기준만 제안했다.

핵심 제안:

- player, floor/platform, obstacle/blocker, goal area, timer가 서로 한눈에 구분되어야 한다.
- 모든 주요 요소는 built-in geometry 수준의 placeholder로 표현한다.
- 색상은 기능 구분을 위해서만 사용한다.
- 장식인지 gameplay cue인지 헷갈리는 요소는 제외한다.
- player는 조작 대상으로 즉시 읽혀야 하고 floor/obstacle과 섞이면 안 된다.
- floor/platform은 solid surface로 읽혀야 하며 visual bounds와 collision bounds가 크게 어긋나면 안 된다.
- obstacle은 blocker 또는 traversal constraint로 읽혀야 하며 enemy, hazard damage, collectible로 보이면 안 된다.
- goal은 오른쪽 목적지로 읽혀야 하며 obstacle처럼 보이면 안 된다.
- timer는 timeout test를 할 만큼 보이면 충분하고 polished UI system이 되면 안 된다.

Art manifest는 final sprite, character identity, brand style, worldbuilding, concept art, generated production asset, imported sprite를 승인하지 않는다.

## 지금 판단하면 안 되는 것

이번 gate에서 결정하지 않는다.

- 최종 게임 컨셉
- 출시 제품 방향
- 시장성 또는 audience 방향
- monetization
- 최종 아트 스타일
- 캐릭터 디자인
- 세계관 또는 브랜드 톤
- 실제 에셋 생성 여부
- web export
- enemy, item, scoring system
- camera polish
- double jump, wall jump, dash
- Learning Card promotion
- Canonical 또는 Policy 변경

이 항목 중 하나를 결정하고 싶어지면, 이번 gate를 넘기지 말고 별도 Human Creative Owner decision으로 분리한다.

## 승인 기준

아래 항목이 모두 맞으면 approve할 수 있다.

1. Phase 2 platformer greybox hook이 구현 가능한 수준으로 명확하다.
2. 첫 플레이 루프가 left start -> route read -> move/jump -> right goal -> pass/fail로 충분히 설명된다.
3. Research note가 Implementation과 QA에 필요한 movement/collision/jump constraint를 제공한다.
4. Art manifest가 Implementation과 QA에 필요한 placeholder visual/readability 기준을 제공한다.
5. 제외 범위가 충분히 명확해서 Implementation Agent가 enemy, item, scoring, final art, camera polish 등으로 번질 위험이 낮다.
6. BK가 추가 creative/product 판단 없이 Implementation Work Package 작성으로 넘겨도 괜찮다고 판단한다.

## Redirect 기준

다음 중 하나라도 있으면 approve하지 말고 redirect한다.

- 정확한 제한 시간 또는 레벨 구조가 없어서 implementation scope가 흔들릴 것 같다.
- single jump만으로 route가 성립하는지 판단하기 어렵다.
- Art manifest가 너무 추상적이라 구현자가 다시 아트 판단을 해야 할 것 같다.
- timer, goal, obstacle의 placeholder read가 충분히 분리되지 않았다.
- falling/reset 처리 같은 열린 결정이 구현 중 scope expansion을 만들 것 같다.
- BK가 구현 전에 Research 또는 Art note를 더 좁혀야 한다고 판단한다.

## Reject 기준

다음 중 하나라도 있으면 reject한다.

- platformer greybox 방향 자체가 Phase 2 harness demo에 맞지 않는다고 판단한다.
- 현재 hook이 너무 제품 방향을 강하게 고정한다고 판단한다.
- 구현으로 넘어가면 Phase 2 목적보다 게임 기능 확장이 앞설 위험이 크다.
- Research/Art/Owner gate가 더 이상 의미 있게 분리되지 않는다고 판단한다.

## 승인하면 다음 agent가 할 수 있는 일

BK가 approve하면 Implementation Agent는 별도 Work Package를 통해 다음 범위 안에서만 Godot implementation을 시작할 수 있다.

허용:

- `game/scenes/main.tscn` platformer greybox 변경
- `game/scripts/player.gd` collision-aware platformer controller 변경
- 필요 시 Work Package가 명시한 supporting Godot file 추가
- gravity
- floor/obstacle collision
- horizontal acceleration/friction
- fixed-height single jump
- left start, right goal, short timer
- simple placeholder geometry
- implementation Run record 작성

금지:

- final art
- generated production assets
- imported sprites
- enemy behavior
- item or collectible system
- scoring system
- camera polish
- web export as hard gate
- double jump
- wall jump
- dash
- schema/profile/automation/CI 변경
- Learning Card promotion

## 승인하지 않으면 멈출 일

BK가 redirect 또는 reject하면 Implementation Agent는 Godot 파일을 수정하지 않는다.

대신 아래 중 하나로 돌아간다.

- game brief 수정
- research note 보강
- art/readability manifest 보강
- Phase 2 방향 재논의
- 열린 decision debt 정리

## Implementation Authorization Boundary

이 owner review 문서 생성만으로는 implementation이 승인되지 않는다.

Implementation이 시작되려면 이 문서의 "BK 결정 기록란"에 approve가 기록되어야 하고, 그 approve 범위를 입력으로 삼는 별도 Implementation Work Package가 작성되어야 한다.

## BK 결정 기록란

아래 중 하나로 기록한다.

```text
Decision: approve
Deciding authority: BK / Human Creative Owner
Decision date: 2026-05-28
Reviewed artifacts:
- PHASE2_PLATFORMER_GREYBOX_PLAN.md
- context/game_brief.md
- research_notes/RN-2026W22-002-platformer-greybox-reference.md
- art_notes/AN-2026W22-002-platformer-greybox-readability.md
Reason: Game brief, research note, and art/readability manifest are sufficient for the Phase 2 platformer greybox implementation slice.
Implementation authorization: Implementation Agent may proceed only through a separate Work Package that preserves this owner-approved scope.
```

Approve 예시:

```text
Decision: approve
Deciding authority: BK / Human Creative Owner
Decision date: YYYY-MM-DD
Reason: Game brief, research note, and art/readability manifest are sufficient for the Phase 2 platformer greybox implementation slice.
Implementation authorization: Implementation Agent may proceed only through a separate Work Package that preserves this owner-approved scope.
```

Redirect 예시:

```text
Decision: redirect
Deciding authority: BK / Human Creative Owner
Decision date: YYYY-MM-DD
Reason: <무엇을 더 좁히거나 바꿔야 하는지 기록>
Implementation authorization: not authorized.
```

Reject 예시:

```text
Decision: reject
Deciding authority: BK / Human Creative Owner
Decision date: YYYY-MM-DD
Reason: <왜 Phase 2 implementation으로 넘기면 안 되는지 기록>
Implementation authorization: not authorized.
```

## BK 최종 실행 검수 기록

```text
Decision: approve implemented result for Phase 2 greybox gate
Deciding authority: BK / Human Creative Owner
Decision date: 2026-05-29
Reviewed artifact: Godot 실행 결과
Summary: 재미를 판단할 수 있는 수준의 게임은 아니지만, Phase 2 테스트 의도대로 잘 제작되었다.
Control feel: 기대 이상이다. 특히 관성에 의해 텐션이 발생하는 것이 잘 표현되었다.
Phase gate meaning: 이 판단은 Phase 2 platformer greybox가 Halucy harness로 playable greybox를 만들 수 있는지 검증하는 목적에는 충분하다는 뜻이다. 최종 게임 재미, 출시 제품 방향, 최종 아트, 시장성, 추가 기능 확장은 승인하지 않는다.
Next boundary: Learning Librarian Agent는 이 실행 검수와 QA 결과를 근거로 Candidate Learning Card 필요 여부를 판단할 수 있다.
```
