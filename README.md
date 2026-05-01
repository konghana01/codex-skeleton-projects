# Side Harness

Side Harness는 사이드 프로젝트를 반복 가능한 구조로 시작하고 관리하기 위한 작은 메타 프로젝트입니다. 목표는 AI가 읽기 쉬운 컨텍스트, 가벼운 품질 검사, 명시적인 작업 규칙을 유지하는 것입니다.

## 빠른 시작

하네스 상태를 확인합니다.

```bash
./scripts/doctor
```

기본 템플릿으로 새 프로젝트를 만듭니다.

```bash
./scripts/new-project my-idea
```

특정 템플릿으로 새 프로젝트를 만듭니다.

```bash
./scripts/new-project my-idea scratch
```

새 프로젝트는 `projects/` 아래에 생성되고 `projects/registry.md`에 등록됩니다.

프로젝트 생성 후에는 startup prompt와 함께 Codex에게 프로젝트 목적을 전달합니다.

```text
Use prompts/start-project.md.

Project purpose:
- ...
```

Codex는 생성된 `README.md`, `AGENTS.md`, `notes/`, 검사 명령, registry 항목을 프로젝트 목적에 맞게 정리합니다. 이렇게 하면 이후 프로젝트를 clone해서 작업할 때도 일정한 품질의 시작점을 유지할 수 있습니다.

## 구조

```text
side-harness/
  AGENTS.md
  docs/
  projects/
  prompts/
  scripts/
  templates/
```

## 핵심 생각

- `AGENTS.md`는 Codex와 다른 AI coding agent가 따라야 할 작업 규칙을 정의합니다.
- `templates/`는 `projects/`로 복사될 프로젝트 시작 템플릿을 담습니다.
- `prompts/`는 구현, 리뷰, 디버깅, 리팩터링, 릴리스 점검에 쓰는 반복 가능한 작업 프롬프트를 담습니다.
- `docs/project-start.md`는 프로젝트 목적을 받아 생성 프로젝트를 정리하는 startup contract를 정의합니다.
- `docs/rules-and-skills.md`는 규칙, 프롬프트, Codex skill을 어디에 둘지 판단하는 기준입니다.
- `docs/skill-authoring.md`는 Codex skill을 만들 때의 `SKILL.md` 구조와 resource 설계 기준입니다.
- `docs/github.md`는 하네스 repo와 생성 프로젝트 repo를 분리해서 운영하는 기준입니다.
- `scripts/new-project`는 템플릿에서 새 프로젝트를 생성합니다.
- `scripts/doctor`는 하네스 구조와 기본 로컬 도구가 있는지 확인합니다.

## 프로젝트 흐름

1. `projects/registry.md`에 아이디어를 기록합니다.
2. `scripts/new-project`로 프로젝트를 생성합니다.
3. `prompts/start-project.md`로 목적 기반 startup pass를 실행합니다.
4. 생성된 `AGENTS.md`에 프로젝트별 규칙을 정리합니다.
5. 작고 검증 가능한 단위로 구현합니다.
6. 작업 완료 전 프로젝트 검사 명령을 실행합니다.
7. 결정과 다음 작업을 프로젝트의 `notes/` 폴더에 기록합니다.
