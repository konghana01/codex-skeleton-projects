# Context Map

이 문서는 Codex가 어떤 상황에서 어떤 파일을 읽어야 하는지 정의합니다. 목적은 매번 모든 문서를 읽는 것이 아니라, 필요한 계층을 안정적으로 찾는 것입니다.

## 기본 진입 순서

하네스 root에서 작업할 때:

1. `AGENTS.md`
2. `README.md`
3. `projects/registry.md`
4. `docs/README.md`
5. 관련 `docs/**/*.md`
6. 관련 `prompts/*.md`, task prompt가 있을 때

생성 프로젝트에서 작업할 때:

1. root `AGENTS.md`, 하네스 안에서 작업 중일 때
2. project `AGENTS.md`
3. project `README.md`
4. project `notes/decisions.md`
5. project `notes/todos.md`
6. task와 관련된 root `docs/**/*.md`

## 상황별 Context

### 하네스 구조 변경

읽을 파일:

- `AGENTS.md`
- `README.md`
- `docs/README.md`
- `docs/governance/governance.md`
- `docs/governance/context-map.md`
- `docs/governance/documentation.md`
- `docs/governance/conventions.md`
- `scripts/doctor`

검증:

```bash
./scripts/doctor
```

### 새 프로젝트 생성

읽을 파일:

- `AGENTS.md`
- `README.md`
- `docs/workflows/project-start.md`
- `templates/<template>/README.md`
- `templates/<template>/AGENTS.md`
- `scripts/new-project`

사용 prompt:

- `prompts/start-project.md`

### 비동기 작업 설계 또는 운영

읽을 파일:

- `AGENTS.md`
- `docs/governance/governance.md`
- `docs/workflows/async-workflow.md`
- `docs/operations/github.md`

사용 prompt:

- `prompts/async-task.md`

### 하네스 정량 평가

읽을 파일:

- `AGENTS.md`
- `README.md`
- `projects/registry.md`
- `docs/README.md`
- `docs/governance/governance.md`
- `docs/governance/context-map.md`
- `docs/governance/documentation.md`
- `docs/governance/improvement-loop.md`
- `docs/governance/improvement-history.md`
- `docs/evaluation/rubric.md`
- `docs/governance/rules-and-skills.md`
- `docs/skills/skill-guide.md`
- `docs/operations/environment.md`
- 관련 `prompts/*.md`

사용 prompt:

- `prompts/evaluate-harness.md`

검증:

```bash
./scripts/doctor
```

### Skill 생성 또는 수정

읽을 파일:

- `AGENTS.md`
- `docs/governance/governance.md`
- `docs/governance/rules-and-skills.md`
- `docs/skills/skill-guide.md`
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
- `docs/governance/governance.md`
- `docs/governance/context-map.md`
- `docs/governance/documentation.md`
- 관련 기존 `prompts/*.md`

판단 기준:

- 반복 작업 요청이면 `prompts/`에 둡니다.
- 항상 적용되는 규칙이면 `AGENTS.md`에 둡니다.
- 오래 유지되는 설명이면 `docs/`에 둡니다.
- 전문 workflow package이면 `skills/`에 둡니다.
- 반복 작업에서 얻은 학습이면 `docs/governance/improvement-loop.md` 기준으로 `docs/governance/improvement-history.md`에 기록할지 판단합니다.

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

- task와 무관한 모든 `docs/**/*.md`
- task와 무관한 모든 `prompts/*.md`
- 다른 프로젝트의 `notes/`
- installed skill 내부 파일, 해당 skill을 사용하지 않는 경우

필요한 문서를 좁혀 읽고, source of truth가 불명확하면 `docs/governance/governance.md`로 돌아갑니다.
