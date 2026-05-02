# Improvement Loop

이 문서는 반복 작업에서 얻은 학습을 더 나은 AI 작업 환경으로 승격하는 기준만 정의합니다. 실제 기록은 `docs/governance/improvement-history.md`에 둡니다.

## 목적

- 반복 작업에서 드러난 failure pattern을 다음 하네스 개선으로 연결합니다.
- 좋은 prompt, rule, skill, script 후보를 evidence와 함께 남깁니다.
- AI가 다음 작업에서 이전 시행착오를 재사용할 수 있게 합니다.
- 히스토리를 쌓되, 현재 실행 규칙과 섞지 않습니다.

## 기록할 것

다음 조건 중 하나를 만족하면 history entry 후보입니다.

- 같은 문제가 두 번 이상 반복되었습니다.
- 특정 prompt, rule, skill, script 개선으로 품질이 올라갔습니다.
- 검증 실패나 리뷰 finding이 반복적인 구조 문제를 드러냈습니다.
- 외부 도구, GitHub workflow, remote environment 운영에서 재사용 가능한 교훈이 생겼습니다.
- 하네스 평가 점수를 올릴 수 있는 구체 action이 생겼습니다.

## 기록하지 않을 것

- 한 번만 발생한 일시적 task detail
- 특정 project의 제품 의사결정
- 실행 로그 전문
- secret, token, credential
- 아직 검증되지 않은 감상이나 선호

이런 내용은 project `notes/`, GitHub issue, PR comment에 둡니다.

## Entry Format

```text
Date:
Area:
Signal:
Evidence:
Decision:
Changed:
Follow-up:
```

필드 의미:

- `Date`: 기록 날짜
- `Area`: docs / prompts / skills / scripts / templates / operations / evaluation
- `Signal`: 반복된 문제 또는 개선 기회
- `Evidence`: issue, PR, check, review, user request 등 근거
- `Decision`: 하네스에 반영할 판단
- `Changed`: 실제 변경된 파일 또는 아직 없음
- `Follow-up`: 다음 개선 후보

## Promotion Path

히스토리는 실행 규칙이 아닙니다. 다음 기준을 만족할 때만 높은 계층으로 승격합니다.

- 항상 지켜야 할 제약이 되면 `AGENTS.md`
- 오래 유지될 판단 기준이 되면 `docs/governance/`
- 반복 실행 절차가 되면 `docs/workflows/`
- 반복 task request가 되면 `prompts/`
- deterministic repeated operation이 되면 `scripts/`
- package화된 전문 workflow가 되면 `skills/<skill-name>/`
