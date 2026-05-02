# Context Map

이 문서는 Codex가 어떤 상황에서 어떤 파일을 읽어야 하는지 정의합니다. 목적은 매번 모든 문서를 읽는 것이 아니라, 필요한 계층을 안정적으로 찾는 것입니다.

## 기본 진입 순서

하네스 root에서 작업할 때:

1. `AGENTS.md`
2. `README.md`
3. `projects/registry.md`
4. 관련 `docs/*.md`
5. 관련 `prompts/*.md`, task prompt가 있을 때

생성 프로젝트에서 작업할 때:

1. root `AGENTS.md`, 하네스 안에서 작업 중일 때
2. project `AGENTS.md`
3. project `README.md`
4. project `notes/decisions.md`
5. project `notes/todos.md`
6. task와 관련된 root `docs/*.md`

## 상황별 Context

### 하네스 구조 변경

읽을 파일:

- `AGENTS.md`
- `README.md`
- `docs/governance.md`
- `docs/context-map.md`
- `docs/conventions.md`
- `scripts/doctor`

검증:

```bash
./scripts/doctor
```

### 새 프로젝트 생성

읽을 파일:

- `AGENTS.md`
- `README.md`
- `docs/project-start.md`
- `templates/<template>/README.md`
- `templates/<template>/AGENTS.md`
- `scripts/new-project`

사용 prompt:

- `prompts/start-project.md`

### 비동기 작업 설계 또는 운영

읽을 파일:

- `AGENTS.md`
- `docs/governance.md`
- `docs/async-workflow.md`
- `docs/github.md`

사용 prompt:

- `prompts/async-intake.md`
- `prompts/async-implementer.md`
- `prompts/async-reviewer.md`
- `prompts/async-address-review.md`
- `prompts/async-final-report.md`

### Skill 생성 또는 수정

읽을 파일:

- `AGENTS.md`
- `docs/governance.md`
- `docs/rules-and-skills.md`
- `docs/skill-authoring.md`
- `docs/skill-lifecycle.md`
- 관련 `skills/<skill-name>/SKILL.md`, 존재한다면

사용 prompt:

- `prompts/create-skill.md`
- `prompts/skill-review.md`, review가 필요할 때

검증:

```bash
python3 "${CODEX_HOME:-$HOME/.codex}/skills/.system/skill-creator/scripts/quick_validate.py" <path-to-skill-folder>
```

### Prompt 추가 또는 수정

읽을 파일:

- `AGENTS.md`
- `docs/governance.md`
- `docs/context-map.md`
- 관련 기존 `prompts/*.md`

판단 기준:

- 반복 작업 요청이면 `prompts/`에 둡니다.
- 항상 적용되는 규칙이면 `AGENTS.md`에 둡니다.
- 오래 유지되는 설명이면 `docs/`에 둡니다.
- 전문 workflow package이면 `skills/`에 둡니다.

사용 prompt:

- `prompts/governance-change.md`, 하네스 계층이나 source of truth가 바뀔 때

### Generated Project 작업

읽을 파일:

- root `AGENTS.md`, 하네스 안에서 작업 중일 때
- project `AGENTS.md`
- project `README.md`
- project `notes/decisions.md`
- project `notes/todos.md`

검증:

```bash
make check
```

## 읽지 않아도 되는 것

- task와 무관한 모든 `docs/*.md`
- task와 무관한 모든 `prompts/*.md`
- 다른 프로젝트의 `notes/`
- installed skill 내부 파일, 해당 skill을 사용하지 않는 경우

필요한 문서를 좁혀 읽고, source of truth가 불명확하면 `docs/governance.md`로 돌아갑니다.
