# Docs Index

Side Harness의 `docs/`는 역할별로 나눕니다. 새 문서를 추가할 때는 먼저 어떤 역할인지 정하고, 같은 내용이 여러 곳에 중복되지 않게 source of truth를 하나만 둡니다.

## Roles

### `governance/`

하네스 전체에서 오래 유지될 계층, rule, convention, context routing 기준을 둡니다.

- `governance.md`: 최상위 운영 원칙과 계층 우선순위
- `context-map.md`: 작업 상황별로 읽을 문서와 prompt
- `documentation.md`: 문서 하나가 한 역할만 갖도록 하는 배치 기준
- `improvement-loop.md`: 반복 학습을 하네스 개선으로 승격하는 기준
- `improvement-history.md`: 반복 학습 entry 기록
- `rules-and-skills.md`: rule, prompt, script, skill 배치 기준
- `conventions.md`: 공유 convention

### `workflows/`

반복 작업의 생명주기와 task flow를 둡니다.

- `project-start.md`: 새 프로젝트 목적 정리 contract
- `async-workflow.md`: 비동기 issue/PR 작업 흐름

### `skills/`

Codex skill package의 작성, 생명주기, 노출 위치, cross-agent 호환 기준을 둡니다.

- `package-contract.md`: skill package 공통 계약과 Codex/Claude 위치 기준
- `skill-authoring.md`: `SKILL.md`와 resource 작성 기준
- `skill-lifecycle.md`: 생성, 변경, review, 폐기 기준

### `operations/`

하네스를 실제로 운영할 때 필요한 environment, GitHub, remote/asynchronous 운영 기준을 둡니다.

- `environment.md`: local tool, secret, check 기준
- `github.md`: harness repo와 generated project repo 운영 기준

### `evaluation/`

하네스 품질을 정량 평가하는 기준을 둡니다.

- `rubric.md`: rules, skills, prompts, environment 100점 평가 모델

문서 배치 기준은 `docs/governance/documentation.md`를 따릅니다. 반복 작업에서 얻은 학습은 `docs/governance/improvement-loop.md` 기준으로 선별하고 `docs/governance/improvement-history.md`에 남깁니다.
