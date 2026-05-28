# AN-2026W22-001: Placeholder Movement Toy Readability Note

## 목적

현재 movement toy에 대해 BK가 Art -> Implementation handoff를 판단할 수 있도록, 최종 아트가 아닌 placeholder 시각 가독성 기준만 정의한다.

Owner-facing 검수는 `owner_reviews/OR-2026W22-001-placeholder-readability-KR.md`를 기준으로 한다. 이 Art note는 agent-facing 원문이지만, BK 검수 의존성이 영어 문서에 걸리지 않도록 한국어로 제공한다.

## 입력

- Research note: `research_notes/RN-2026W22-001-placeholder-movement-toy.md`
- 현재 scene 관찰: `game/scenes/main.tscn`에는 48x48 `ColorRect` player가 있다.
- 현재 movement 관찰: `game/scripts/player.gd`는 `Input.get_vector(...)`로 얻은 방향을 `position`에 직접 더한다.

## 경계

이 문서는 최종 아트 방향, concept art, asset generation, license decision이 아니다. Godot 변경도 승인하지 않는다. BK가 승인한 뒤 다음 implementation slice에서 사용할 수 있는 placeholder visual read만 설명한다.

## Placeholder Visual Direction

움직이는 동안에도 읽히는 단순 geometric player read를 사용한다.

- Player silhouette: 48x48 body shape를 유지한다. square나 diamond 모두 가능하지만, 즉시 조작 대상으로 읽혀야 한다.
- Heading/facing cue: player body에 붙은 작고 대비가 강한 방향 표시를 둔다. 예시는 short notch, triangle, 밝은 edge다.
- Ground/motion reference cue: 움직임 판단을 돕는 sparse grid, crosshair origin, faint trail ticks 같은 비장식 reference cue를 둔다.
- Contrast constraints: player body, facing cue, background/reference cue는 명도 차이가 분명해야 한다. 미묘한 색상 차이만으로 구분하지 않는다.

## Implementation Handoff

BK가 승인하면 Implementation Agent는 movement toy scope를 유지하면서 tiny Godot-only readability change를 만들 수 있다.

허용되는 구현 아이디어:

- player를 placeholder geometry로 유지
- direction/facing cue를 child 또는 overlay로 추가
- minimal background/reference cue 추가
- imported asset, final sprite, UI panel, animation system, gameplay mechanic, concept expansion 회피

이 note는 `CharacterBody2D`, collision, gravity, jump, camera work, export setting, new input semantics를 요구하지 않는다.

## BK Placeholder Quality Gate

BK가 승인하려면 아래가 모두 맞아야 한다.

1. player가 한눈에 조작 대상으로 식별된다.
2. object가 움직일 때 direction 또는 facing이 읽힌다.
3. background/reference cue가 final game art처럼 보이지 않으면서 movement 판단에 도움을 준다.
4. 방향이 placeholder-grade에 머물고 final genre, character, world, brand style을 암시하지 않는다.
5. Implementation Agent가 Art Agent에게 visual direction을 다시 물어보지 않고 tiny Godot change를 만들 만큼 구체적이다.

하나라도 실패하면 BK는 implementation 전에 reject 또는 redirect해야 한다.

## Handoff Summary

- BK/Human Creative Owner: `owner_reviews/OR-2026W22-001-placeholder-readability-KR.md`에서 approve, redirect, reject 중 하나를 결정한다.
- Implementation Agent: BK approval 전까지 Godot 파일을 수정하지 않는다.
- QA Agent: implementation 이후 placeholder scope 유지와 movement readability 개선 여부를 검토한다.
- Learning Librarian Agent: 이후 review에서 재사용 가능한 handoff lesson이 발견될 때만 Learning Card를 검토한다.
