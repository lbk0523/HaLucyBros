# RN-2026W22-001: Placeholder Movement Toy Reference Note

## 연구 질문

현재 placeholder movement toy를 최종 게임 컨셉으로 확장하지 않으면서, Art Agent와 Implementation Agent가 다음 tiny slice에 참고할 수 있는 최소 movement reference는 무엇인가?

## 경계

이 문서는 시장 조사, 컨셉 추천, 최종 아트 방향, Godot 변경 요청이 아니다. 목적은 Research -> Art -> Implementation handoff에 필요한 작은 참고 기준을 남기는 것이다.

## 현재 toy 상태

- `game/scripts/player.gd`는 `ColorRect`를 직접 움직인다.
- 입력은 `Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")`를 사용한다.
- 이동은 `position += direction * SPEED * delta` 방식이다.
- gravity, floor, jump, wall, collision 상태가 없으므로 현재 toy는 platformer보다 top-down movement test에 가깝다.

## 참고 근거

- Godot 4 `CharacterBody2D` 문서는 character body가 script-driven 2D body이며, `move_and_slide()`가 `velocity`를 기준으로 움직인다고 설명한다. floor/ceiling 개념이 없는 top-down 이동에는 `MOTION_MODE_FLOATING`이 맞는 방향이다. 참고: https://docs.godotengine.org/en/4.0/classes/class_characterbody2d.html
- PICO-8은 128x128 display, 16 colours, 256개의 8x8 sprite 같은 강한 제약을 가진다. 이 제약은 작은 화면에서도 읽히는 단순하고 강한 visual language가 중요하다는 참고점으로만 사용한다. 참고: https://www.lexaloffle.com/pico-8.php

## 관찰

1. 현재 toy의 핵심은 "게임처럼 만들기"가 아니라 "움직이는 placeholder가 읽히는지 확인하기"다.
2. 다음 tiny slice에서 가장 중요한 것은 조작 대상, 방향, 속도감을 한눈에 판단할 수 있게 만드는 것이다.
3. 작은 placeholder visual language만으로도 충분하다. 예를 들면 뚜렷한 player shape, 작은 방향 표시, 단순한 ground/reference cue가 있으면 된다.
4. collision이나 물리 접촉이 필요해지는 시점에는 `CharacterBody2D` 검토가 가능하지만, 이 문서는 그런 구현 변경을 승인하지 않는다.

## Art Agent에 넘길 내용

Art Agent는 최종 스타일이 아니라 placeholder readability만 다룬다. 다음 항목을 좁게 제안하면 충분하다.

- player placeholder silhouette
- heading/facing cue
- ground 또는 motion reference cue
- tiny desktop smoke-test scene에서의 contrast 기준

## Implementation Agent에 대한 제한

Implementation Agent는 Art Agent 산출물과 BK owner approval이 나오기 전까지 Godot 파일을 수정하지 않는다.

이 research note만으로 다음 변경을 하면 안 된다.

- 최종 게임 컨셉 선택
- top-down/platformer 등 장르 결정
- `CharacterBody2D` 전환
- collision, gravity, jump, camera, animation system 추가
- actual asset 추가

## 불확실성

이 문서는 genre, audience, store, monetization, market signal을 비교하지 않았다. Halucy가 어떤 최종 게임이 되어야 하는지도 결정하지 않는다. 그런 판단은 BK/Human Creative Owner의 별도 결정이 필요하다.

## Handoff Summary

- Art Agent: 현재 movement toy에 대한 tiny placeholder visual/readability note를 작성한다.
- Implementation Agent: Art note와 BK approval 전에는 Godot 변경을 기다린다.
- Learning Librarian Agent: 이후 review에서 재사용 가능한 handoff lesson이 발견될 때만 Candidate Learning Card를 검토한다.
