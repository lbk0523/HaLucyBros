# OR-2026W22-005: Phase 4B Scope / Art Owner Review

## BK가 지금 검수할 것

이번 검수 대상은 최종 게임 컨셉, 최종 아트 방향, production asset pack,
출시용 visual polish가 아니다.

검수할 것은 다음 하나다.

```text
Phase 4B의 한 장면짜리 2D 플랫폼 프로토타입 범위와 Art 재사용 후보가
Implementation planning으로 넘길 만큼 이해 가능하고 안전한가?
```

이번 owner review는 구현 허가서가 아니다. BK가 approve하더라도 별도
Implementation Work Package가 생기기 전까지 Godot 파일은 수정하지 않는다.

## 검수 대상 artifact

- Phase 4B scope brief: `plans/PHASE4B_SCOPE_AND_GAME_BRIEF.md`
- Visual Research reference: `research_notes/RN-2026W22-003-phase4b-complex-prototype-reference.md`
- Art package note: `art_notes/AN-2026W22-006-phase4b-art-requirements-candidate-package.md`
- Art reuse preview: `art_candidates/phase4b/reuse_preview.md`
- Asset requirements JSON/CSV:
  - `art_candidates/phase4b/asset_requirements.json`
  - `art_candidates/phase4b/asset_requirements.csv`
- Asset manifest JSON/CSV:
  - `art_candidates/phase4b/asset_manifest.json`
  - `art_candidates/phase4b/asset_manifest.csv`
- WP-032: `work_packages/active/WP-2026W22-032.json`
- WP-032 Run: `runs/RUN-20260613-002.json`

BK가 판단하는 데 필요한 내용은 아래에 한국어로 요약한다. JSON/CSV 원문은
agent handoff와 세부 확인용이다.

## 화면 요약

현재 Phase 4B 프로토타입은 아래 화면을 검증 대상으로 한다.

```text
한 장면짜리 2D 횡스크롤 플랫폼 액션 프로토타입

왼쪽 시작
-> 첫 구간에서 이동/점프 확인
-> 두 번째 구간에서 위험물 또는 움직이는 장애물 회피
-> 진행 아이템 하나 획득
-> 오른쪽 goal marker 도착
-> success / fail / retry UI 확인
```

이 화면은 "최종 게임은 이런 분위기"라는 결정이 아니다. Phase 4B의 목적은
Phase 0-3에서 만든 제작 시스템이 더 복잡한 playable slice에서도 작동하는지
검증하는 것이다.

## Asset Role 검수 요약

| role | 현재 제안 | BK가 판단할 것 |
|---|---|---|
| hazard / moving obstacle | Phase 3E obstacle asset 재사용 후보 | 위험물로 읽히는가, 아니면 단순 벽처럼 보이는가 |
| collectible / progression item | 재사용 후보 없음 | 새 Art 후보가 필요한가, placeholder-only로 허용할 수 있는가 |
| goal marker | Phase 3E goal marker 재사용 추천 | Phase 4B의 imported gameplay-readable asset으로 써도 되는가 |
| section landmark | Phase 3E floor/platform 재사용 후보 | 구간 구분에 도움이 되는가, collision scope를 키우지 않는가 |

## 후보별 판단 메모

### 1. Hazard / moving obstacle

후보:

```text
art_candidates/phase3e/prepared/P3E-obstacle-v1-transparent.png
```

장점:

- 이미 transparent prepared asset으로 존재한다.
- Phase 4B에서 "위험하거나 피해야 하는 대상" 후보로 검수할 수 있다.

리스크:

- hazard라기보다 static blocker, 즉 그냥 막힌 물체처럼 읽힐 수 있다.
- 구현에서 실제 위험 판정은 별도 trigger로 만들어야 하며, 이미지 자체가
  collision이나 gameplay를 결정하면 안 된다.

BK 선택지:

- approve reuse for prototype
- redirect to new hazard candidate generation
- reject mapping
- allow placeholder-only hazard

### 2. Collectible / progression item

후보:

```text
현재 명확한 재사용 후보 없음
```

장점:

- 잘못된 재사용을 하지 않고 gap을 명확히 기록했다.

리스크:

- goal marker나 obstacle을 collectible로 재사용하면 "먹어도 되는 것"과
  "목표/위험" 의미가 섞일 수 있다.
- Phase 4B 구현에서 progression state는 필요하므로, 시각 후보를 새로 만들지
  않으면 placeholder-only 처리가 필요하다.

BK 선택지:

- redirect to new collectible candidate generation
- allow placeholder-only collectible for Phase 4B prototype
- reject progression item visual plan

### 3. Goal marker

후보:

```text
art_candidates/phase3e/prepared/P3E-goal-marker-v1-transparent.png
```

장점:

- 현재 패키지에서 가장 안전한 재사용 후보.
- Phase 4B가 요구하는 "최소 하나의 imported gameplay-readable asset" 조건을
  작게 만족시키기 좋다.
- 목표 지점 역할이 비교적 명확하다.

리스크:

- goal trigger나 progression requirement는 이미지가 아니라 구현 로직으로
  분리해야 한다.
- final art나 production asset approval은 아니다.

BK 선택지:

- approve reuse for Phase 4B prototype
- redirect to new goal candidate
- reject mapping

### 4. Section landmark

후보:

```text
art_candidates/phase3e/prepared/P3E-floor-platform-v1-transparent.png
```

장점:

- 첫 구간과 두 번째 구간을 구분하는 visual landmark로 쓸 수 있다.
- 기존 prepared asset을 재사용하므로 새 이미지 생성 없이 검수 가능하다.

리스크:

- platform asset을 쓰면 collision, slope, tile system, moving platform 같은
  구현 scope가 커질 수 있다.
- section landmark는 visual role로만 제한해야 한다.

BK 선택지:

- approve reuse as visual landmark only
- redirect to simpler landmark candidate
- reject mapping
- allow placeholder-only section treatment

## 지금 판단하면 안 되는 것

이번 gate에서 결정하지 않는다.

- 최종 게임 컨셉
- 최종 아트 방향 또는 style bible
- production/public release asset usage
- Godot 구현 방식
- collision polish
- enemy AI, combat, health/lives/checkpoint
- double jump, dash, wall jump 같은 movement verb 추가
- full UI/menu/settings/save system
- platform export, launch readiness, external tester workflow
- Learning Card promotion

## 승인 기준

아래가 맞으면 approve할 수 있다.

1. Phase 4B 화면이 "한 장면짜리 2D 플랫폼 프로토타입"으로 이해된다.
2. hazard, collectible/progression, goal, section landmark 역할이 서로
   헷갈리지 않게 검수 가능하다.
3. goal marker 재사용이 Phase 4B의 imported gameplay-readable asset 조건을
   작게 만족시키는 방향으로 받아들일 수 있다.
4. collectible은 재사용 후보가 없다는 판단이 납득된다.
5. placeholder-only 또는 새 후보 생성이 필요한 역할을 BK가 분리해서 판단할
   수 있다.
6. approve가 final art, production asset, 또는 Godot implementation approval이
   아니라는 점이 명확하다.

## Redirect 기준

다음 중 하나라도 있으면 redirect한다.

- 화면 구도가 여전히 어떤 게임인지 이해하기 어렵다.
- hazard 후보가 위험물로 읽히지 않는다.
- collectible을 placeholder-only로 처리하면 progression state가 너무
  헷갈릴 것 같다.
- goal marker가 goal보다 collectible이나 obstacle처럼 보인다.
- section landmark가 collision/platform system 확장을 유도할 것 같다.
- 새 Art 후보 생성이 owner 판단 전에 필요하다.
- Art package가 implementation handoff로 넘기기에는 review surface가 부족하다.

## Reject 기준

다음 중 하나라도 있으면 reject한다.

- Phase 4B scope 자체가 현재 Halucy 제작 검증에 맞지 않는다.
- Art reuse package가 prototype review에도 도움이 되지 않는다.
- 기존 Phase 3E prepared asset 재사용이 의미 혼동을 크게 만든다.
- 새 게임 방향, 최종 아트 방향, 또는 release asset 판단으로 범위가 번진다.

## 승인하면 다음 agent가 할 수 있는 일

BK가 approve하면 다음 단계는 별도 Work Package로 진행한다.

- Implementation Agent가 Godot 구현 계획 또는 구현 WP를 만들 수 있다.
- 구현 WP는 승인된 asset role과 placeholder-only role을 명시해야 한다.
- goal marker를 imported gameplay-readable asset으로 사용하는 것이 허용될 수
  있다.
- collectible은 BK 결정에 따라 새 Art 후보 생성 또는 placeholder-only로
  분리한다.

approve만으로 직접 Godot 구현은 시작하지 않는다.

## 승인하지 않으면 멈출 일

BK가 redirect 또는 reject하면 다음 작업을 멈춘다.

- Godot implementation planning
- asset import
- QA review
- owner play/feel review
- Learning Card capture
- Phase 4B closeout

대신 Research/Art가 화면 구도, asset role, candidate package 중 무엇을 고칠지
다시 좁힌다.

## BK 결정 기록란

```text
Decision: approve with constraints
Deciding authority: BK / Human Creative Owner
Decision date: 2026-06-13
Reviewed artifacts:
- research_notes/RN-2026W22-003-phase4b-complex-prototype-reference.md
- art_candidates/phase4b/reuse_preview.md
- art_notes/AN-2026W22-006-phase4b-art-requirements-candidate-package.md

Scope decision:
- Phase 4B visualized Research reference: proceed approval recorded in chat on 2026-06-13.

Asset role decisions:
- hazard / moving obstacle: approve Phase 3E obstacle reuse for Phase 4B prototype only, with the constraint that implementation must make danger readability explicit through trigger/framing/UI or other approved prototype cues.
- collectible / progression item: approve placeholder-only treatment for Phase 4B prototype; no existing Phase 3E asset is approved as collectible.
- goal marker: approve Phase 3E goal marker reuse for Phase 4B prototype only.
- section landmark: approve Phase 3E floor/platform reuse as visual landmark only, not as collision, slope, tileset, or moving-platform scope.

Not approved:
- final art direction
- production asset usage
- Godot implementation without separate WP
- launch/external testing

Implementation authorization: not authorized until a separate Implementation Work Package is approved.
```
