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

프로젝트 생성 후에는 아래 프롬프트를 그대로 넣고 목적만 채우면 됩니다.

```text
Use prompts/start-project.md.

Project purpose:
- ...

Known constraints:
- ...

Expected first useful outcome:
- ...
```

Codex는 생성된 `README.md`, `AGENTS.md`, `notes/`, 검사 명령, registry 항목을 프로젝트 목적에 맞게 정리합니다. 이렇게 하면 이후 프로젝트를 clone해서 작업할 때도 일정한 품질의 시작점을 유지할 수 있습니다.

## 구조

```text
side-harness/
  AGENTS.md
  docs/
    governance/
    workflows/
    skills/
    operations/
    evaluation/
  projects/
  prompts/
  scripts/
  skills/
  templates/
```

## 핵심 생각

- `AGENTS.md`는 Codex와 다른 AI coding agent가 따라야 할 작업 규칙을 정의합니다.
- `docs/README.md`는 docs 전체의 index입니다.
- `docs/governance/context-map.md`는 상황별로 읽을 문서를 정해 주는 실행 인덱스입니다.
- `templates/`는 `projects/`로 복사될 프로젝트 시작 템플릿을 담습니다.
- `prompts/`는 구현, 리뷰, 디버깅, 리팩터링, 릴리스 점검에 쓰는 반복 가능한 작업 프롬프트를 담습니다.
- `prompts/governance-change.md`와 `prompts/skill-review.md`는 하네스 계층과 skill package를 검토하는 반복 작업 기준입니다.
- `docs/governance/governance.md`는 하네스의 최상위 문서/rule/skill 관리 원칙입니다.
- `docs/governance/context-map.md`는 Codex가 상황별로 어떤 문서를 읽어야 하는지 정의합니다.
- `docs/governance/documentation.md`는 문서 하나가 한 가지 역할만 갖도록 하는 문서 배치 기준입니다.
- `docs/governance/improvement-loop.md`는 반복 작업에서 얻은 재사용 가능한 학습을 하네스 개선으로 연결하는 기준입니다.
- `docs/governance/improvement-history.md`는 반복 학습 entry만 기록하는 히스토리입니다.
- `docs/workflows/project-start.md`는 프로젝트 목적을 받아 생성 프로젝트를 정리하는 startup contract를 정의합니다.
- `docs/workflows/async-workflow.md`는 메신저형 입력, 구현 에이전트, 리뷰 에이전트, PR 중심의 비동기 작업 흐름을 정의합니다.
- `docs/evaluation/rubric.md`는 공식 Codex 기준을 참고해 rules, skills, prompts, environment를 100점 만점으로 평가하는 기준입니다.
- `docs/governance/rules-and-skills.md`는 규칙, 프롬프트, Codex skill을 어디에 둘지 판단하는 기준입니다.
- `docs/skills/skill-guide.md`는 Codex skill의 source, `SKILL.md`, resource, lifecycle을 한 곳에서 정의합니다.
- `docs/operations/github.md`는 하네스 repo와 생성 프로젝트 repo를 분리해서 운영하는 기준입니다.
- `skills/`는 하네스가 source로 관리하는 엄격한 Codex skill package를 담습니다.
- `.agents/skills/`와 `.claude/skills/`는 실제 skill을 노출해야 할 때만 생성합니다.
- `scripts/new-project`는 템플릿에서 새 프로젝트를 생성합니다.
- `scripts/doctor`는 하네스 구조와 기본 로컬 도구가 있는지 확인합니다.

## 하네스 평가

하네스 품질을 점검할 때는 `docs/evaluation/rubric.md`와 `prompts/evaluate-harness.md`를 사용합니다. 평가 결과는 PR, issue, 또는 필요할 때 별도 기록으로 남깁니다.

## 문서와 프롬프트

- `docs/README.md`는 `docs/`의 역할별 인덱스입니다.
- `docs/governance/context-map.md`는 상황별로 어떤 문서와 프롬프트를 읽을지 정하는 실행 인덱스입니다.
- `prompts/`는 반복 작업을 시작할 때 넣는 task template입니다.
- `skills/`는 반복되는 전문 workflow를 담는 managed package source입니다.
- `docs/skills/skill-guide.md`는 skill 구조와 lifecycle의 단일 기준입니다.

## 프로젝트 흐름

1. `projects/registry.md`에 아이디어를 기록합니다.
2. `scripts/new-project`로 프로젝트를 생성합니다.
3. `prompts/start-project.md`로 목적 기반 startup pass를 실행합니다.
4. 생성된 `AGENTS.md`에 프로젝트별 규칙을 정리합니다.
5. 작고 검증 가능한 단위로 구현합니다.
6. 작업 완료 전 프로젝트 검사 명령을 실행합니다.
7. 결정과 다음 작업을 프로젝트의 `notes/` 폴더에 기록합니다.

## 비동기 작업

외부에서 작업을 요청하고 나중에 결과를 확인하는 흐름은 `docs/workflows/async-workflow.md`를 기준으로 합니다.

기본 lifecycle은 다음과 같습니다.

```text
intake -> triage -> implement -> self-heal -> open-pr -> review -> address-review -> final-report
```

초기 운영은 GitHub issue와 PR을 기준으로 시작하고, Slack/KakaoTalk/Discord 같은 메신저는 나중에 입력 UI로 붙입니다.
