# 규칙과 관례

## Naming

- Project directory는 기본적으로 `kebab-case`를 사용합니다.
- Template directory는 `scratch`, `web-app`, `cli-tool`처럼 짧은 lowercase 이름을 사용합니다.
- Script는 file extension 없이 lowercase 이름을 사용합니다.

## Project Status

`projects/registry.md`의 status는 다음 값 중 하나를 사용합니다.

- `idea`
- `active`
- `paused`
- `shipped`
- `archived`

## 완료 기준

task는 다음 조건을 만족하면 완료입니다.

- 의도한 동작이 구현되어 있습니다.
- 관련 검사를 실행했습니다.
- 건너뛴 검사가 문서화되어 있습니다.
- 후속 작업이 암묵적으로 남지 않고 기록되어 있습니다.

비동기 feature task는 PR 생성이 기본 종료점입니다. 리뷰 에이전트가 finding을 남겼다면, 해당 finding을 반영하고 다시 검증한 뒤 PR ready 상태를 전체 종료점으로 봅니다.

## Context 기준

각 관리 프로젝트는 기억이 아니라 파일만으로 작업 컨텍스트가 드러나야 합니다.

- `README.md`는 목적, 범위, setup, commands, open questions를 설명합니다.
- `AGENTS.md`는 프로젝트에서 일하는 AI agent가 따라야 할 durable rules를 정의합니다.
- `notes/decisions.md`는 오래 남아야 하는 reasoning과 tradeoff를 기록합니다.
- `notes/todos.md`는 구체적인 next tasks를 기록합니다.
- `Makefile`은 `make check`를 제공합니다.

## Template 기준

각 template은 다음을 포함해야 합니다.

- `README.md`
- `AGENTS.md`
- `.env.example`
- `.gitignore`
- `Makefile`
- `notes/`
- placeholder source directory
- placeholder test directory

## Reuse 기준

- 항상 적용되는 behavior는 `AGENTS.md`에 둡니다.
- 반복 가능한 task request는 `prompts/`에 둡니다.
- 여러 프로젝트에 걸친 specialized workflow는 Codex skill에 둡니다.
- 같은 behavior가 최소 두 개 프로젝트에서 반복된 뒤에 reusable script로 만듭니다.

## Async 기준

- 메신저는 입력과 알림 UI로만 사용합니다.
- durable state는 GitHub issue, PR, commit, repo 문서에 둡니다.
- 구현과 리뷰는 역할을 분리합니다.
- main에는 직접 commit하지 않고 PR 중심으로 작업합니다.
