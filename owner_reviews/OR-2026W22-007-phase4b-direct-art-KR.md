# OR-2026W22-007: Phase 4B Direct Art Owner Review

## BK가 검수할 것

이번 검수는 Art Agent가 Phase 4B prototype에 필요한 전체 art resource set을
직접 생성할 수 있는지 확인하는 gate다.

검수 대상은 "최종 출시용 art 승인"이 아니라 다음이다.

```text
Art Agent가 ChatGPT/imagegen 기반으로 만든 새 PNG asset set이
Phase 4B prototype의 gameplay-readable art 후보로 검수할 만큼 충분한가?
```

## 검수 대상 artifact

- Contact sheet: `art_candidates/phase4b/direct_art/contact_sheet.md`
- Prompt record: `art_candidates/phase4b/direct_art/prompts.json`
- Manifest JSON/CSV:
  - `art_candidates/phase4b/direct_art/manifest.json`
  - `art_candidates/phase4b/direct_art/manifest.csv`
- Art production report:
  - `art_notes/AN-2026W22-007-phase4b-direct-art-production-report.md`
- PNG assets:
  - `game/assets/phase4b/direct_art/background_section_one_v1.png`
  - `game/assets/phase4b/direct_art/background_section_two_v1.png`
  - `game/assets/phase4b/direct_art/player_avatar_v1.png`
  - `game/assets/phase4b/direct_art/ground_platform_tile_v1.png`
  - `game/assets/phase4b/direct_art/collectible_progression_item_v1.png`
  - `game/assets/phase4b/direct_art/hazard_warning_marker_v1.png`
  - `game/assets/phase4b/direct_art/goal_marker_v1.png`
  - `game/assets/phase4b/direct_art/ui_status_panel_v1.png`

## 생성 방식 요약

- 기본 생성 도구: Codex `imagegen` skill의 built-in `image_gen`
- ChatGPT Pro 접근을 우선 사용
- Adobe/기타 유료 도구는 사용하지 않음
- sprite/UI asset은 chroma-key 배경으로 생성 후 로컬에서 alpha PNG로 변환
- `.png.import`는 Godot import로 생성됨
- `game/.godot/**` 캐시는 증거로 사용하지 않음

## 지금 승인하지 않는 것

이번 gate에서 아래는 승인하지 않는다.

- 최종 게임 컨셉
- final art direction
- production asset 승인
- launch/public release usage
- Adobe 등 별도 유료 툴 도입
- Godot 구현 반영
- collision, layout, movement, UI system 변경
- web export 또는 external testing
- Learning Card promotion

## 승인 기준

다음이 맞으면 approve할 수 있다.

1. 전체 asset set이 한 게임에서 나온 것처럼 보인다.
2. Section 1 background와 Section 2 background가 구분되며, gameplay를 가리지
   않을 가능성이 있다.
3. player asset이 조작 캐릭터로 읽히고, 새 combat/무기/스토리 scope를 강하게
   만들지 않는다.
4. ground/platform tile이 안전한 발판으로 읽히며 slope, moving platform,
   destructible terrain 같은 scope를 유도하지 않는다.
5. collectible/progression item이 goal, hazard, currency와 구분된다.
6. hazard marker가 위험물로 읽히며 enemy AI나 combat처럼 보이지 않는다.
7. goal marker가 목적지로 읽히며 collectible과 헷갈리지 않는다.
8. UI panel은 status/result/retry 표시를 도와주지만 full menu/settings/save
   방향으로 번지지 않는다.
9. 모든 asset이 prototype-only / production-candidate 상태로 기록되어 있고,
   production asset 승인으로 오해되지 않는다.

## Redirect 기준

다음 중 하나라도 있으면 redirect한다.

- asset style이 서로 맞지 않는다.
- background가 너무 강해서 gameplay readability를 해친다.
- player asset이 현재 prototype 방향을 과하게 바꾼다.
- collectible과 goal이 헷갈린다.
- hazard가 위험물보다 장식품처럼 보인다.
- UI panel이 게임 HUD보다 메뉴/브랜드 방향으로 보인다.
- imagegen 결과를 그대로 launch-quality로 쓰기 어렵고 human final pass가 먼저
  필요하다.
- prompt/tool/license 기록이 부족하다.

## Reject 기준

다음 중 하나라도 있으면 reject한다.

- Direct art production test로 의미 있는 PNG asset이 나오지 않았다.
- generated asset이 외부 IP, 특정 작가/프랜차이즈 모방, 권리 리스크를 크게
  만든다.
- Phase 4B prototype gameplay role과 맞지 않는다.
- Art Agent가 실제 생산 파이프라인을 증명하지 못했다.

## 승인하면 다음 agent가 할 수 있는 일

BK가 approve하면 다음 단계는 별도 Implementation WP로 진행한다.

- Implementation Agent가 승인된 asset을 Godot scene에 반영할 수 있다.
- QA가 art 반영 후 readability, import stability, play/feel regression을 확인할
  수 있다.
- Learning Librarian은 필요한 경우 Candidate Learning Card만 검토할 수 있다.

approve만으로 직접 Godot 구현을 시작하지 않는다.

## BK 결정 기록란

```text
Decision: approve for Phase 4B prototype testing
Deciding authority: BK / Human Creative Owner
Decision date: 2026-06-19
Review status: prototype-only / production-candidate review only
Production approval: not approved; production_approved remains false for all assets

Reviewed artifacts:
- art_candidates/phase4b/direct_art/contact_sheet.md
- art_candidates/phase4b/direct_art/manifest.json
- art_notes/AN-2026W22-007-phase4b-direct-art-production-report.md
- game/assets/phase4b/direct_art/background_section_one_v1.png
- game/assets/phase4b/direct_art/background_section_two_v1.png
- game/assets/phase4b/direct_art/player_avatar_v1.png
- game/assets/phase4b/direct_art/ground_platform_tile_v1.png
- game/assets/phase4b/direct_art/collectible_progression_item_v1.png
- game/assets/phase4b/direct_art/hazard_warning_marker_v1.png
- game/assets/phase4b/direct_art/goal_marker_v1.png
- game/assets/phase4b/direct_art/ui_status_panel_v1.png

Asset role decisions:
- background_section_one_v1: approve for Phase 4B prototype-candidate use. It
  has a clear lower gameplay band, calm Section 1 contrast, and does not add a
  new game concept by itself. Implementation must still check scale/crop so it
  stays behind gameplay objects.
- background_section_two_v1: approve for Phase 4B prototype testing. The mood
  and palette fit the Section 2 hazard/item area well enough to test with the
  full direct-art set. Constraint: because the image includes strong foreground
  platforms, lamps, spike-like shapes, and destination-like props, implementation
  and QA must verify that real hazard, item, platform, and goal objects remain
  readable over it.
- player_avatar_v1: approve for Phase 4B prototype-candidate use. It reads as a
  controllable character, has no weapon/combat pose, and is visually distinct
  from hazard, collectible, and goal. Constraint: do not treat this as final
  character/story direction; check small-scale readability after import.
- ground_platform_tile_v1: approve for Phase 4B prototype-candidate use as
  visual terrain support only. It reads as safe walkable stone. Constraint:
  collision remains simple and explicit; no slope, moving-platform,
  destructible-terrain, or full tileset scope is approved.
- collectible_progression_item_v1: approve for Phase 4B prototype-candidate
  use. It reads as a key/star pickup rather than a hazard, goal, enemy, or
  currency economy item. Constraint: keep it smaller than the goal and verify
  it stays readable against the selected Section 2 background.
- hazard_warning_marker_v1: approve for Phase 4B prototype-candidate use. The
  red-orange spike/crystal silhouette reads as danger and does not imply enemy
  AI or combat. Constraint: implementation still needs explicit trigger/framing
  so the hazard is readable before contact.
- goal_marker_v1: approve for Phase 4B prototype-candidate use. The tall
  gate/portal silhouette reads as a destination and is distinct from the
  collectible by shape and scale. Constraint: goal trigger and progression
  logic remain separate from the image.
- ui_status_panel_v1: approve for Phase 4B prototype-candidate use. It has no
  baked text and can support status/result/retry copy without becoming a full
  menu. Constraint: place/scale it so it does not cover player, hazard,
  collectible, landing path, or goal.

Decision summary:
- The direct Art Agent production test produced a meaningful full PNG asset
  set and can proceed as prototype-candidate material.
- BK reviewed the asset paths and approves the full direct-art set as sufficient
  for Phase 4B prototype testing.
- All eight assets are approved for possible use in a later, separate
  Implementation WP.
- `background_section_two_v1` carries a readability caution, not a redirect:
  QA must check whether foreground detail interferes with hazard/item/goal
  readability after implementation.
- No asset is production-approved. Final art direction, rights review, launch
  use, and any human final pass remain separate gates.

Approved for next step:
- A later Implementation WP may propose importing the approved direct-art asset
  set, with scale/crop/placement constraints and QA readability checks.
- QA must re-check gameplay readability after any approved art is implemented.

Not approved:
- final game concept
- final art direction
- production asset approval
- launch/public release usage
- paid tool subscription
- implementation without separate WP
```
