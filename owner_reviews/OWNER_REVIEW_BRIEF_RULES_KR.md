# Owner Review Brief Rules

## 목적

BK/Human Creative Owner가 검수해야 하는 모든 판단 지점은 Samantha workflow나 agent handoff를 위한 영어 문서만으로 전달하지 않는다.

Owner 검수가 필요한 경우, agent-facing artifact와 별도로 한국어 owner review brief를 작성한다.

## 적용 범위

이 규칙은 Art note에만 적용하지 않는다. Halucy 작업 과정에서 BK/Human Creative Owner가 승인, 거절, 보류, 방향 전환, 품질 판단, scope 판단, promotion 판단을 해야 하는 모든 영역에 적용한다.

예시는 다음과 같다.

- creative/product 방향 판단
- final concept 또는 opportunity-space 판단
- placeholder 또는 art quality gate
- playable feel 판단
- asset usage 또는 license risk 판단
- scope expansion 승인
- Working -> Canonical 또는 Canonical -> Policy promotion
- Phase gate 통과 여부
- agent가 판단 권한을 넘겨야 하는 모호한 제품 결정

## 작성 원칙

Owner review brief는 한국어로 작성한다.

한국어 wrapper만 만드는 것은 충분하지 않다. BK가 판단에 반드시 사용해야 하는 맥락, 근거, 기준은 한국어 owner review brief 안에서 완결되어야 한다.

Agent-facing Markdown artifact가 영어일 수는 있지만, 그 문서가 BK의 필수 검수 근거가 되는 순간 owner-facing surface로 취급한다. 이 경우 다음 중 하나를 해야 한다.

- 해당 Markdown artifact를 한국어로 다시 제공한다.
- 또는 owner review brief 안에 판단에 필요한 내용을 한국어로 완전히 요약하고, 영어 원문은 참고 원문으로만 둔다.

JSON, schema, Run record처럼 구조화 형식을 유지해야 하는 artifact는 원문을 유지할 수 있다. 다만 BK 판단에 필요한 JSON 내용은 owner review brief 안에 한국어로 요약해야 한다.

필수 내용:

- BK가 지금 무엇을 검수해야 하는지
- 검수 대상 artifact 경로
- 지금 판단하면 안 되는 것
- 승인 기준
- 거절 또는 수정 요청 기준
- 승인했을 때 다음 agent가 할 수 있는 일
- 승인하지 않았을 때 멈춰야 하는 일

금지:

- 영어 workflow 문서만 던지고 owner 판단을 요구하기
- 영어 Markdown artifact를 필수 검수 대상으로 남겨두기
- agent 내부 handoff 용어만으로 검수 기준을 설명하기
- 검수해야 할 판단과 참고용 맥락을 섞기
- BK의 승인을 이미 받은 것처럼 기록하기
- owner 판단이 필요한데 `human_decision_required: false`로 우회하기

## 파일 위치

Owner review brief는 `owner_reviews/` 아래에 둔다.

권장 이름:

```text
owner_reviews/OR-<date-or-week>-<topic>-KR.md
```

## 현재 Phase 1 적용

`art_notes/AN-2026W22-001-placeholder-readability.md`는 Art Agent handoff artifact다. BK가 검수할 표면은 별도 한국어 문서인 `owner_reviews/OR-2026W22-001-placeholder-readability-KR.md`로 전달한다.

Implementation Agent는 BK가 해당 owner review brief에서 승인 또는 redirect를 기록하기 전까지 Godot 파일을 수정하지 않는다.
