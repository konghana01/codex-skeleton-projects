# 하네스 거버넌스

이 문서는 Side Harness의 최상위 운영 원칙을 정의합니다. 목표는 문서, rule, prompt, skill이 늘어나도 Codex와 사람이 같은 기준으로 판단할 수 있게 만드는 것입니다.

## 핵심 원칙

- root `AGENTS.md`가 하네스 안에서 가장 강한 repo-local 규칙입니다.
- 프로젝트별 `AGENTS.md`는 root `AGENTS.md`를 구체화합니다. 충돌하면 root `AGENTS.md`가 우선합니다.
- `docs/`에는 오래 변하지 않을 맥락, 철학, convention, lifecycle 기준을 둡니다.
- `prompts/`에는 반복 작업을 시작하기 위한 요청 템플릿을 둡니다.
- `skills/`에는 꼭 필요한 경우에만 만드는 구체적이고 검증 가능한 Codex skill package source를 둡니다.
- `notes/`에는 프로젝트별 현재 상태, 결정, follow-up을 둡니다.

## 계층 우선순위

외부 시스템/개발자 지침은 항상 이 repo의 어떤 파일보다 우선합니다. repo 안에서는 다음 순서를 따릅니다.

1. root `AGENTS.md`
2. generated project `AGENTS.md`
3. `docs/governance.md`
4. 다른 `docs/*.md`
5. `prompts/*.md`
6. `skills/<skill-name>/`
7. project `notes/*.md`

낮은 계층은 높은 계층을 override하지 않습니다. 낮은 계층은 높은 계층을 더 구체적으로 실행하는 역할만 합니다.

## 문서가 담아야 할 것

문서는 큰 맥락에서 오래 유지될 내용을 담습니다.

좋은 문서 내용:

- 프로젝트나 하네스의 목적
- 변하지 않을 가능성이 큰 convention
- 작업 lifecycle
- 검증 철학
- skill 관리 기준
- GitHub/PR 운영 기준

문서에 두지 말아야 할 내용:

- 한 번만 수행할 task detail
- 특정 feature의 일시적 구현 지시
- 빠르게 바뀌는 TODO
- 특정 실행 로그
- credential, token, secret

일시적 내용은 issue, PR, `notes/todos.md`, task prompt에 둡니다.

## Rule 기준

Rule은 항상 적용되는 제약입니다. Codex가 해당 범위에서 매번 지켜야 한다면 `AGENTS.md`에 둡니다.

root `AGENTS.md`에는 하네스 전체에서 절대 흔들리면 안 되는 규칙만 둡니다.

프로젝트 `AGENTS.md`에는 해당 프로젝트의 구현 제약, 검증 명령, dependency 정책, architecture boundary를 둡니다.

## Prompt 기준

Prompt는 작업을 시작하기 위한 template입니다.

좋은 prompt는 다음을 포함합니다.

- task goal
- 먼저 읽을 context
- constraints
- expected output
- verification
- report format

Prompt는 rule이 아닙니다. prompt가 root `AGENTS.md`나 project `AGENTS.md`와 충돌하면 AGENTS가 우선합니다.

## Skill 기준

Skill은 prompt보다 더 구체적이고 재사용 가능한 workflow package입니다.

skill은 다음 조건을 만족할 때만 만듭니다.

- 여러 프로젝트에 걸쳐 반복됩니다.
- 일반 prompt로는 품질이 흔들립니다.
- workflow, reference, script, asset이 응집되어야 합니다.
- 별도 validation이 필요합니다.

skill은 하네스의 철학을 override하지 않습니다. skill은 하네스 철학을 구체적 workflow로 실행합니다.

## 변경 절차

하네스 governance를 바꿀 때는 다음 순서로 확인합니다.

1. root `AGENTS.md`를 읽습니다.
2. `docs/governance.md`와 `docs/context-map.md`를 읽습니다.
3. 변경이 rule, docs, prompt, skill 중 어디에 속하는지 판단합니다.
4. 중복 문서가 생기면 한 곳을 source of truth로 정하고 다른 곳은 링크합니다.
5. `./scripts/doctor`를 실행합니다.

반복 가능한 거버넌스 변경에는 `prompts/governance-change.md`를 사용합니다. skill package review에는 `prompts/skill-review.md`를 사용합니다.

## 완료 기준

거버넌스 변경은 다음을 만족해야 완료입니다.

- 어떤 계층에 속하는 변경인지 명확합니다.
- root `AGENTS.md`와 충돌하지 않습니다.
- 사람이 읽어도 Codex의 판단 기준을 이해할 수 있습니다.
- `./scripts/doctor`가 통과합니다.
