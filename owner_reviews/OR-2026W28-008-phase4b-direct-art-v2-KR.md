# OR-2026W28-008: Phase 4B Direct Art v2 Owner Review

## 이번에 BK가 결정할 것

이번 검수는 v1 playable-art 통합의 **Visual Readability Fail** 이후 생성한 v2
asset set이, Phase 4B prototype에서 다시 통합 검토할 가치가 있는지 판단하는
gate다. 최종 출시용 art, production asset, 또는 게임 컨셉을 승인하는 절차가
아니다.

검수 질문은 다음 하나다.

```text
이 v2 asset set은 Player > Goal > Hazard = Item > Safe platform > HUD >
Background의 우선순위와 silhouette-first 분리를 실제 playable prototype에서
검증할 수 있을 만큼 명확한 prototype 후보인가?
```

## 검수 대상

- Contact sheet: `art_candidates/phase4b/direct_art_v2/contact_sheet.md`
- Prompt/source 기록: `art_candidates/phase4b/direct_art_v2/prompts.json`
- Manifest: `art_candidates/phase4b/direct_art_v2/manifest.json`,
  `art_candidates/phase4b/direct_art_v2/manifest.csv`
- Readability report:
  `art_notes/AN-2026W28-008-phase4b-direct-art-v2-readability-report.md`
- PNG: `game/assets/phase4b/direct_art_v2/` 아래의
  `background_world_layer_v2`, `player_avatar_v2`, `goal_marker_v2`,
  `hazard_marker_v2`, `collectible_item_v2`, `safe_platform_tile_v2`,
  `ui_status_panel_v2`

## 제안된 역할 분리

| 역할 | v2 read | BK가 확인할 점 |
|---|---|---|
| Player | teal hood, compact full body | 가장 먼저 조작 대상으로 보이는가? 무기/전투 scope를 암시하지 않는가? |
| Goal | tall gold halo + indigo monolith | item이 아니라 도착지로 읽히는가? |
| Hazard | jagged red-orange spike cluster | item과 형태부터 다르고, enemy AI/전투로 보이지 않는가? |
| Item | rounded lime seed relic with leaf fins | hazard/goal/currency와 구분되는가? |
| Platform | broad flat slate slab | 안전한 발판으로 읽히고 새 terrain scope를 만들지 않는가? |
| HUD | empty indigo/brass plaque | game object보다 조용하며 menu/settings/save로 확장되지 않는가? |
| Background | distant muted twilight ruins | 하나의 하위 Background World Layer로 남고, platform/hazard/item/goal처럼 읽히지 않는가? |

## 승인 기준

다음이 모두 맞으면 `approve for prototype integration planning` 또는
조건부 승인할 수 있다.

1. gameplay object가 label 없이도 silhouette부터 서로 구분된다.
2. player가 가장 먼저 보이고, goal이 item보다 명확한 destination으로 읽힌다.
3. hazard와 item의 우선순위는 비슷하지만 sharp spike와 rounded seed라는 형태가
   명확히 다르다.
4. background가 낮은 contrast의 한 world layer로 남으며 foreground gameplay
   object와 경쟁하지 않는다.
5. platform/HUD가 안전한 지원 역할에 머물고 mechanic/system scope를 추가하지
   않는다.
6. 모든 파일이 `prototype_only_pending_owner_review`,
   `production_candidate_not_approved`, `production_approved: false`로
   기록되어 있다.

## Redirect 기준

- background의 ruin arch나 cliff가 실제 goal/platform처럼 보인다.
- player의 작은-scale read가 약하거나 hierarchy가 goal보다 약하다.
- goal과 item 또는 hazard와 item을 움직이는 화면에서 혼동할 가능성이 크다.
- sprite/UI chroma-key edge가 보이거나 구현 시 crop/scale로 silhouette이 무너질
  가능성이 높다.
- UI panel이 gameplay 화면을 과도하게 덮거나 full-menu 방향으로 보인다.
- human final pass가 prototype test 전부터 필수일 정도로 결과가 부적절하다.

## 지금 승인하지 않는 것

- final game concept / final art direction
- production asset, launch/public release usage, rights clearance
- Godot scene/script/project 설정, collision, level layout, movement, timer,
  retry, hazard/item/goal logic 변경
- QA pass, Learning Card promotion, commit, push, merge, deployment

## BK 결정 기록란

```text
Decision: approve for prototype integration planning
Deciding authority: BK / Human Creative Owner
Decision date: 2026-07-10
Review status: prototype-only / production-candidate review only
Production approval: not approved; production_approved remains false for all assets

Conditions or redirect notes:
- None recorded with the approval.

Approved asset roles (if any):
- background_world_layer_v2
- player_avatar_v2
- goal_marker_v2
- hazard_marker_v2
- collectible_item_v2
- safe_platform_tile_v2
- ui_status_panel_v2

Not approved / rework required:
- None recorded with the approval.

Next authorized action:
- A separate Implementation Work Package may be proposed only for the assets
  explicitly approved here; it must preserve gameplay logic and receive a later
  independent QA pass.
```
