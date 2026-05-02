# Documentation Architecture

이 문서는 Side Harness에서 문서를 만들고 배치하는 기준만 정의합니다. 문서의 내용 자체가 아니라, 문서가 어떤 역할을 가져야 하는지와 어디에 놓여야 하는지를 다룹니다.

## 원칙

- 문서 하나는 한 가지 역할만 가집니다.
- 문서 제목과 위치만 보고 역할을 추론할 수 있어야 합니다.
- 한 문서가 여러 역할을 갖기 시작하면 분리합니다.
- source of truth는 하나만 둡니다.
- 다른 문서는 같은 내용을 복사하지 않고 링크하거나 참조합니다.

## 문서 역할

### Index

어떤 문서가 어디에 있는지 안내합니다.

위치:

- `docs/README.md`

Index는 판단 기준을 길게 설명하지 않습니다. 판단 기준은 governance 문서로 분리합니다.

### Governance

오래 유지될 계층, 원칙, 배치 기준을 정의합니다.

위치:

- `docs/governance/`

### Workflow

반복 작업의 생명주기와 실행 순서를 정의합니다.

위치:

- `docs/workflows/`

### Skill Package

skill package의 구조, lifecycle, 검증, agent별 노출 기준을 정의합니다.

위치:

- `docs/skills/`

### Operations

환경, GitHub, secret, remote/asynchronous 운영 기준을 정의합니다.

위치:

- `docs/operations/`

### Evaluation

하네스 품질을 점수화하고 개선 우선순위를 정하는 기준을 정의합니다.

위치:

- `docs/evaluation/`

### History

반복 작업에서 얻은 학습, 결정, failure pattern, 개선 후보를 다음 하네스 개선으로 연결합니다.

위치:

- `docs/governance/improvement-loop.md`, 학습 승격 기준
- `docs/governance/improvement-history.md`, 하네스 전체 학습 entry
- generated project `notes/`, 프로젝트별 학습
- GitHub issue/PR, 작업 단위 실행 기록

## Placement Rule

- 항상 적용되는 제약은 `AGENTS.md`에 둡니다.
- 오래 유지되는 판단 기준은 `docs/governance/`에 둡니다.
- 반복 task flow는 `docs/workflows/`에 둡니다.
- skill package 기준은 `docs/skills/`에 둡니다.
- 실행 환경과 외부 연동은 `docs/operations/`에 둡니다.
- 점수화와 개선 우선순위는 `docs/evaluation/`에 둡니다.
- 반복 사용될 task request는 `prompts/`에 둡니다.
- 실행 가능한 반복 동작은 `scripts/`에 둡니다.
- 일시적 상태와 task log는 issue, PR, project `notes/`에 둡니다.

## Reuse Test

새 문서를 만들기 전에 다음 질문에 답합니다.

- 이 문서는 한 달 뒤에도 같은 의미로 쓰이는가?
- 여러 프로젝트나 여러 작업에 재사용되는가?
- prompt, issue, PR, notes보다 docs에 둘 이유가 있는가?
- 이미 같은 역할을 하는 문서가 있는가?
- 나중에 AI가 이 문서를 읽고 더 나은 결정을 할 수 있는가?

하나라도 명확하지 않으면 문서가 아니라 prompt, issue, PR, notes에 둡니다.

## Split Triggers

다음 신호가 있으면 문서를 분리합니다.

- 한 문서가 rule과 workflow를 동시에 자세히 설명합니다.
- 한 문서가 current state와 stable principle을 함께 담습니다.
- 한 문서가 Codex-specific 기준과 Claude-specific 기준을 섞습니다.
- 한 문서가 평가 기준과 평가 결과를 지나치게 길게 함께 담습니다.
- 같은 문장을 여러 문서에 복사하고 있습니다.
