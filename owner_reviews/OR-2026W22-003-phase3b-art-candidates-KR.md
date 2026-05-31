# OR-2026W22-003: Phase 3B Art Candidate Owner Review

## BK가 지금 검수할 것

이번 검수 대상은 최종 아트 방향, style bible, production asset, 출시용 asset pack이 아니다.

검수할 것은 다음 하나다.

```text
Phase 3B에서 생성한 prototype-grade art candidate package가 다음 Art/Implementation handoff로 넘길 만큼 reviewable한가?
```

## 원문 Evidence

- Phase 3A boundary: `art_notes/AN-2026W22-003-art-production-capability-boundary.md`
- Candidate report: `art_notes/AN-2026W22-004-art-production-candidate-report.md`
- Asset requirements: `art_candidates/phase3b/asset_requirements.json`
- Asset requirements CSV: `art_candidates/phase3b/asset_requirements.csv`
- Asset manifest: `art_candidates/phase3b/asset_manifest.json`
- Asset manifest CSV: `art_candidates/phase3b/asset_manifest.csv`
- Candidate sheet: `art_candidates/phase3b/phase3b_candidate_sheet_v1.png`
- Individual candidates:
  - `art_candidates/phase3b/individual/P3B-player-v1.png`
  - `art_candidates/phase3b/individual/P3B-floor-platform-v1.png`
  - `art_candidates/phase3b/individual/P3B-obstacle-v1.png`
  - `art_candidates/phase3b/individual/P3B-goal-marker-v1.png`
  - `art_candidates/phase3b/individual/P3B-timer-hud-v1.png`
- Individual preview: `art_candidates/phase3b/individual_preview.png`
- Phase 3B Work Package: `work_packages/active/WP-2026W22-019.json`
- Phase 3B Run: `runs/RUN-20260531-002.json`
- Rework Work Package: `work_packages/active/WP-2026W22-020.json`
- Rework Run: `runs/RUN-20260531-003.json`

## 후보 요약

Phase 3B capability slice에는 5개의 required asset이 있다.

- `REQ-P3B-001` player: 조작 가능한 player visual 후보
- `REQ-P3B-002` floor/platform: solid surface 후보
- `REQ-P3B-003` obstacle: static blocker 후보
- `REQ-P3B-004` goal marker: 오른쪽 도착점 후보
- `REQ-P3B-005` timer/HUD: 시간 압박 visual reference 후보

왜 5개인가:

- Phase 2 greybox에서 실제 검수 대상이 되는 visual role이 위 5개였기 때문이다.
- 이것은 full game asset inventory가 아니라 Phase 3B capability test용 최소 목록이다.
- background, enemy, item, VFX, animation sheet, full tileset, menu/button, marketing art는 이번 slice에서 필요하지 않다.

각 required asset은 개별 candidate file에 매핑되어 있다.

검수/수정 표면:

- prototype 규모에서는 JSON만으로도 agent handoff는 가능하다.
- 하지만 asset이 많아지는 실제 제작에서는 사람이 읽고, 정렬하고, 필터링하고, 직접 수정할 수 있는 CSV가 필요하다.
- 따라서 이번 rework부터 `asset_requirements.csv`와 `asset_manifest.csv`를 함께 둔다.
- JSON은 agent/automation용 structured record이고, CSV는 human review/edit surface다.

파일 정보:

- source sheet: `art_candidates/phase3b/phase3b_candidate_sheet_v1.png`
- individual files: `art_candidates/phase3b/individual/*.png`
- format: PNG
- source resolution: `1774 x 887`
- transparency: 없음
- usage: prototype review only

## 지금 판단하면 안 되는 것

이번 gate에서 결정하지 않는다.

- final art direction
- style bible
- production/public release asset usage
- full asset pack
- Godot import 구현
- movement, collision, enemy, item, score, camera, HUD system 확장
- external tester 또는 platform launch feedback
- Learning Card promotion

## 승인 기준

아래가 맞으면 approve할 수 있다.

1. 후보 5종이 Phase 2 greybox의 기존 역할을 대체하는 visual candidate로 읽힌다.
2. player, floor/platform, obstacle, goal, timer가 서로 구분된다.
3. 후보가 enemy, item, weapon, dash, attack, score 같은 새 gameplay를 암시하지 않는다.
4. required asset list가 왜 5개인지 설명한다.
5. 각 required asset이 candidate id와 개별 image file에 연결되어 있다.
6. 다음 단계가 Godot 구현이 아니라 transparent sprite 추출/iteration/implementation planning 중 하나로 분리되어야 한다는 점이 명확하다.

## Redirect 기준

다음 중 하나라도 있으면 redirect한다.

- player가 조작 대상으로 충분히 읽히지 않는다.
- obstacle이 enemy, hazard, trap처럼 보인다.
- goal marker가 obstacle 또는 collectible처럼 보인다.
- timer/HUD가 scope를 키우는 polished UI system처럼 보인다.
- 현재 RGB crop이 아니라 transparent sprite가 먼저 필요하다.
- style이 Phase 2 greybox replacement test에 비해 너무 강하게 final direction처럼 보인다.

## Reject 기준

다음 중 하나라도 있으면 reject한다.

- 후보 set이 Phase 3 capability validation에 도움이 되지 않는다.
- 새 gameplay feature를 암시하는 정도가 커서 handoff risk가 높다.
- generated asset workflow가 license/usage risk 때문에 prototype review에도 부적합하다.
- Art Agent tool workflow를 다시 설계해야 한다.

## 승인하면 다음 agent가 할 수 있는 일

BK가 approve하면 다음 중 하나를 별도 Work Package로 진행할 수 있다.

- Art Agent: 개별 transparent sprite 후보 생성 또는 crop/cleanup
- QA Agent: manifest와 후보 파일의 일치성, scope risk, license/risk 기록 검토
- Implementation Agent: Godot integration assessment note 작성

approve만으로 Godot 구현은 허용되지 않는다.

## 승인하지 않으면 멈출 일

BK가 redirect 또는 reject하면 다음 작업을 멈춘다.

- 개별 sprite 추출
- Godot import planning
- implementation handoff
- Learning Card capture

대신 Art Agent가 prompt, style, role boundary, candidate set 중 무엇을 고칠지 다시 좁힌다.

## BK 결정 기록란

```text
Decision: redirect
Deciding authority: BK / Human Creative Owner
Decision date: 2026-05-31
Reviewed artifacts:
- art_notes/AN-2026W22-004-art-production-candidate-report.md
- art_candidates/phase3b/asset_manifest.json
- art_candidates/phase3b/phase3b_candidate_sheet_v1.png
Reason: Original package was not reviewable. It did not report which art assets were needed, so BK could not judge whether five assets were sufficient. It also delivered all candidates in one PNG without a durable mapping between asset requirement and candidate image, which does not scale to real game asset review.
Implementation authorization: not authorized.
```

## Rework 기록

위 redirect를 반영해 다음 rework를 수행했다.

- `art_candidates/phase3b/asset_requirements.json`에 required asset list와 5개 asset count rationale을 추가했다.
- `art_candidates/phase3b/asset_requirements.csv`와 `art_candidates/phase3b/asset_manifest.csv`를 human-editable review surface로 추가했다.
- contact sheet를 primary review unit에서 source evidence로 낮췄다.
- `art_candidates/phase3b/individual/*.png`에 개별 candidate file을 만들었다.
- `art_candidates/phase3b/asset_manifest.json`에 `required_asset_id -> candidate_id -> individual_file_path` mapping을 추가했다.

Rework 이후에도 implementation authorization은 없다. BK가 reworked package를 다시 approve하거나 redirect해야 한다.
