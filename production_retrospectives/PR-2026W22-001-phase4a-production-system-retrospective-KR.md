# Phase 4A Production System Retrospective

## Status

Phase 4A는 Phase 0-3 evidence를 바탕으로 Halucy production system을 회고하고, Phase 4B Complex Prototype Production Validation으로 넘기기 위한 decision surface를 만든다.

이 문서는 회고로 Phase 4를 닫지 않는다. Phase 4A의 성공 조건은 Phase 4B에서 첫 prototype보다 더 복잡한 게임 slice를 실제 제작할 수 있을 만큼 role contract, QA gate, learning rule, automation candidate, repo hygiene decision을 좁히는 것이다.

## Evidence Base

Phase 0 evidence:

- `PHASE0_CLOSEOUT.md`는 Halucy를 AI-native indie game production project로 정의했고, Work Package, Run, Review, Learning Card, Human Creative Owner authority를 기본 운영 계약으로 고정했다.
- Phase 0은 Godot 4.x desktop-first, web-capable target과 Research, Art, Implementation, QA, Learning Librarian 역할을 정했다.
- Phase 0의 핵심 미해결점은 GitHub sync와 실제 Godot 제작 검증 전 상태였고, 이후 Phase 1-3에서 대부분 실제 제작 evidence로 보완됐다.

Phase 1 evidence:

- `PHASE1_CLOSEOUT.md`는 Research -> Art -> BK/Human Creative Owner -> Implementation -> QA -> Learning Librarian handoff가 tiny Godot readability loop에서 동작했음을 닫았다.
- Korean owner-facing review context와 BK direct approval이 implementation 전에 필요하다는 운영 패턴이 확인됐다.
- smoke-test는 exit code만으로 충분하지 않고 output cleanliness까지 봐야 한다는 Candidate Learning Card가 생겼다.
- `game/.godot/` cache ignore는 필요하다고 확인됐지만, `game/scripts/*.gd.uid` sidecar policy는 보류됐다.

Phase 2 evidence:

- `PHASE2_CLOSEOUT.md`는 role-separated production harness가 platformer greybox vertical slice를 만들 수 있음을 닫았다.
- Phase 2는 game brief, research, art readability, owner approval, implementation, QA, BK feel review, learning, final verification으로 이어졌다.
- QA는 technical correctness와 scope preservation을 확인했고, playable feel은 BK/Human Creative Owner judgment로 남겼다.
- inertia-bearing greybox는 production harness와 early feel handoff의 evidence지만, game fun이나 launch readiness의 evidence는 아니라고 제한됐다.

Phase 3 evidence:

- `PHASE3_CLOSEOUT.md`는 Art Agent가 tool workflow를 통해 prototype-grade asset candidates를 만들고, owner redirect/rework, implementation handoff, transparent prep, Godot import, QA, BK direct test까지 통과했음을 닫았다.
- 초기 art package는 reviewable하지 않았고, BK redirect 후 asset requirements, CSV review surfaces, individual files, durable mapping이 추가되면서 owner review가 가능해졌다.
- Godot import는 raw PNG만으로 충분하지 않고 `.png.import` metadata, clean smoke output, headless runtime load evidence가 필요했다.
- Phase 3은 final art, production asset approval, gameplay expansion, external tester workflow, platform launch feedback을 승인하지 않았다.

## Retrospective Verdict

Halucy production system은 Phase 4B로 넘어갈 만큼 작동했다. 다만 현재 evidence는 "작은 loop와 단일 greybox, art import capability" 수준이다. 따라서 Phase 4B는 회고를 넘어서 더 복잡한 playable prototype slice를 실제로 제작해야 한다.

Phase 4B의 검증 질문:

```text
Phase 0-3에서 검증한 role-separated production system이 더 복잡한 게임 제작 상황에서도 범위, handoff, QA, learning, owner authority를 유지하면서 playable prototype을 만들 수 있는가?
```

## Role Handoff Decision Matrix

| Area | Decision | Evidence | Phase 4B Rule |
|---|---|---|---|
| Work Package as execution unit | keep | Phase 0-3 모두 WP 기반으로 실행 및 closeout evidence를 남겼다. | 모든 Phase 4B 실행은 WP에서 시작한다. |
| Research -> Art | revise | Phase 1/2에서는 reference/readability handoff가 작동했지만 Phase 3 art package는 reviewability rework가 필요했다. | Research output은 gameplay reference와 complexity constraints를 Art input으로 명시해야 한다. |
| Art -> Owner | revise | Phase 3에서 single sheet만으로는 owner review가 어려웠고 CSV/individual mapping이 필요했다. | Art handoff는 asset requirement table, manifest, individual preview/review surface를 포함해야 한다. |
| Owner -> Implementation | keep | Phase 1/2/3 모두 owner approval 또는 redirect 후 implementation으로 넘어갔다. | Implementation 전 BK/Human Creative Owner approval boundary를 기록한다. |
| Implementation -> QA | keep | Phase 1/2/3에서 Implementation과 QA 분리가 효과적이었다. | Implementation Agent는 자기 결과의 final pass를 소유하지 않는다. |
| QA -> Owner feel review | revise | Phase 2에서 technical QA와 human feel judgment가 분리됐다. Phase 4B는 더 복잡하므로 feel gate를 명시해야 한다. | QA는 technical pass와 owner-play gate 필요 여부를 분리해 기록한다. |
| QA -> Learning Librarian | keep | Phase 1-3 모두 Candidate learning capture가 생겼다. | Learning capture는 final approval이 아니라 reusable lesson 후보 생성으로 제한한다. |
| Human Creative Owner authority | keep | Phase 0의 권한 계약이 Phase 1-3에서 반복 검증됐다. | Creative/product, Phase 4B scope approval, Canonical/Policy 판단은 사람 권한으로 유지한다. |

## QA Gate Decision Matrix

| Gate | Decision | Evidence | Phase 4B Rule |
|---|---|---|---|
| Schema validation | keep | Phase 1-3 closeout에서 WP/Run/Review/LC schema validation을 반복 사용했다. | 모든 WP/Run/Review/LC 산출물은 schema validation 대상이다. |
| Smoke output cleanliness | revise | Phase 1/2/3에서 clean-output command가 반복됐다. | `scripts/smoke_test.sh` 자체 hardening 후보로 올리고, Phase 4B에서는 explicit clean-output check를 유지한다. |
| Headless scene runtime | keep | Phase 2/3에서 `godot --headless --path game --scene res://scenes/main.tscn --quit-after 3`가 유효했다. | Phase 4B implementation QA는 headless scene load를 요구한다. |
| Godot import metadata | keep | Phase 3에서 `.png.import` metadata 없이는 import 검증이 불충분했다. | Imported gameplay-readable art를 쓰면 source PNG와 `.png.import` 둘 다 검증한다. |
| Static geometry/reachability inspection | revise | Phase 2에서는 static reachability가 가능했지만 Phase 4B는 enemy/hazard/progression으로 복잡해진다. | QA는 static inspection과 runtime/manual play evidence를 분리한다. |
| Owner direct play/feel review | keep | Phase 2 조작감, Phase 3 import result 모두 BK direct test가 gate를 닫았다. | Phase 4B playable slice는 owner direct play approval 없이는 pass 처리하지 않는다. |
| External tester feedback | defer | Phase 3에서 external/semi-external feedback은 release/platform-dependent loop로 deferred됐다. | Phase 4B 범위에 넣지 않는다. |
| Launch/platform readiness | defer | Phase 0-3 어느 것도 launch readiness evidence가 아니다. | Phase 4B는 local playable production validation이다. |

## Learning Card Triage

| Learning | Source | Triage | Reason | Next Action |
|---|---|---|---|---|
| Godot smoke-test success requires output cleanliness, not exit code alone. | `LC-20260528-002` | canonical_candidate | Phase 1-3에서 반복 검증 경로로 사용됐다. | Phase 4B QA plan에 필수 gate로 포함한다. Promotion 실행은 별도 owner-approved WP에서만 한다. |
| BK owner approval requires Korean owner-facing review context complete enough for judgment. | `LC-20260528-003` | canonical_candidate | Phase 1-3 owner gate가 모두 BK-facing Korean review/approval에 의존했다. | Phase 4B owner review artifact 요구사항에 반영한다. |
| Inertia-bearing greybox can validate harness and early feel handoff but not game fun or launch readiness. | `LC-20260529-001` | working_candidate | Phase 2 evidence는 유효하지만 Phase 4B에서 더 복잡한 slice로 재검증해야 한다. | Phase 4B scope에 "not final fun/launch evidence" boundary를 유지한다. |
| Generated art package needs asset requirements, individual files, and human-editable CSV mapping. | `LC-20260531-001` | canonical_candidate | Phase 3에서 owner redirect를 통해 직접 확인된 반복 가능 lesson이다. | Phase 4B Art handoff contract에 요구한다. |
| Godot art-import validation requires source files, `.import` metadata, clean smoke output, and headless runtime evidence. | `LC-20260531-002` | canonical_candidate | Phase 3 QA와 closeout에서 직접 검증됐다. | Phase 4B imported art QA gate에 요구한다. |

No Learning Card promotion is executed by Phase 4A. The triage above is candidate classification only.

## Automation Candidate List

| Candidate | Priority | Evidence | Decision | Notes |
|---|---:|---|---|---|
| Harden `scripts/smoke_test.sh` to fail on `SCRIPT ERROR` or `ERROR:` output | P1 | Phase 1/2/3 all used explicit clean-output shell wrapper. | revise | Repeated manual wrapper is now real friction. |
| Add reusable schema validation command for WP/Run/Review/LC sets | P1 | Phase 1/2/3 closeouts repeatedly ran AJV with `--strict=false`. | revise | Should reduce closeout mistakes; also decide AJV format plugin separately. |
| Godot import metadata verifier for `game/assets/**/*.png` and `.png.import` | P1 | Phase 3 showed raw PNG presence is insufficient. | revise | Needed when Phase 4B uses imported gameplay-readable art. |
| Asset review surface generator/checker for requirements, manifest, CSV, individual files | P2 | Phase 3 owner redirect required this structure. | revise | Useful once Art Agent repeats asset production. |
| Work Package lifecycle helper for `active -> done` | P2 | Phase 1/2/3 all deferred active WP cleanup. | defer | Do not run before deciding commit/lifecycle policy. |
| Godot `.gd.uid` sidecar policy checker | P2 | Phase 1 excluded, Phase 2 removed, Phase 3 included sidecar evidence. | defer | Needs policy decision before automation. |
| External tester collection workflow | P3 | Explicitly deferred in Phase 3 and roadmap. | defer | Release/platform-dependent, not Phase 4B. |
| Model routing / cost automation | P3 | Foundation says automation follows evidence; no repeated production bottleneck yet. | defer | Premature for current prototype validation. |

## Repo Hygiene Decision Matrix

| Area | Decision | Evidence | Phase 4B Rule |
|---|---|---|---|
| `game/.godot/` cache | keep | Phase 1 excluded editor/cache files via `.gitignore`; Phase 3 notes ignored `.godot/imported/**`. | Keep ignored; never treat cache as evidence artifact. |
| `game/assets/**/*.png.import` | keep | Phase 3 import validation required `.png.import` metadata. | Track/import metadata when source asset is in implementation scope. |
| `game/scripts/*.gd.uid` | revise | Phase 1 excluded, Phase 2 removed before closeout, Phase 3 included `player.gd.uid` in implementation evidence. | Phase 4B must decide per WP whether script UID sidecars are authorized outputs; default is not to introduce new sidecars unless Godot recreates them and QA records rationale. |
| `work_packages/active -> done` | defer | Phase 1/2/3 all deferred lifecycle cleanup. | Do not move during Phase 4B implementation slices unless a dedicated lifecycle cleanup WP is approved. |
| Phase artifacts before commit | keep | Closeouts repeatedly call for dirty-list review and final verification before commit/push. | Commit/stage/push stay outside production WP unless explicitly requested. |
| Generated art candidates | revise | Phase 3 produced many review artifacts and prepared assets. | Future art WPs must distinguish source candidates, prepared assets, imported game assets, and review surfaces. |

## Phase 4B Prototype Complexity Criteria

Phase 4B prototype must include at least three of the following complexity features:

- multi-room or multi-section level flow
- enemy, hazard, or moving obstacle
- score, collectible, timer, or progression state
- camera behavior beyond static framing
- richer UI state such as start, result, retry, or status
- animation or multi-frame visual state
- imported art assets used in gameplay-readable roles
- player-facing feel gate that QA cannot fully resolve by static inspection

Recommended Phase 4B minimum slice:

```text
Two-section platformer challenge with one hazard or moving obstacle, collectible/progression state, simple result/retry UI, camera follow or section framing, and at least one imported gameplay-readable asset category.
```

This is intentionally not a final game concept. It is a production-system stress test.

## Phase 4B Readiness Criteria

Phase 4B may start after BK/Human Creative Owner accepts:

- the prototype is a local playable production-system validation, not a final game direction
- at least three complexity criteria are selected before Research/Art work starts
- Research must define reference constraints for the selected complexity
- Art must provide reviewable asset requirements, manifest, and individual review surface when imported assets are used
- Implementation must stay inside approved Godot target files
- QA must check schema, smoke cleanliness, headless runtime, scope preservation, imported asset metadata when applicable, and owner-play gate readiness
- Learning Librarian may classify candidates but cannot promote to Working/Canonical/Policy without separate authority
- repo hygiene policy for `.gd.uid`, `.png.import`, `.godot/`, and active WP lifecycle is explicit in each implementation WP

## Stop Conditions

- If Phase 4A ends with only this retrospective and no Phase 4B production validation plan, Phase 4A fails.
- If Phase 4B scope becomes final game concept selection, launch plan, monetization, external testing, or platform feedback, stop.
- If Phase 4B begins Godot implementation before owner approval of prototype complexity criteria, stop.
- If Learning Card promotion is executed from this retrospective, stop.
- If automation is added without repeated evidence from Phase 0-3, stop.

## Handoff

Handoff target: `plans/PHASE4B_COMPLEX_PROTOTYPE_VALIDATION_PLAN.md`

That plan should convert the decisions above into a concrete next Work Package sequence:

1. Phase 4B prototype scope / game brief WP
2. Research constraints WP
3. Art requirements and asset candidate WP
4. Owner review WP
5. Implementation WP
6. QA WP
7. Owner play/feel review WP
8. Learning capture WP
9. Closeout verification WP
