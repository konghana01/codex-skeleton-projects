# 프로젝트 시작

새 사이드 프로젝트를 생성하거나 이 하네스에서 clone해서 시작할 때 이 계약을 사용합니다.

## 목표

짧은 프로젝트 목적을 받아, 바로 작업 가능한 프로젝트 디렉토리로 정리합니다. 컨텍스트, 검사 명령, 다음 작업이 일관되게 드러나야 합니다.

## 입력

- 프로젝트 이름
- 프로젝트 목적
- 의도한 사용자나 audience, 알고 있다면
- 예상 project type 또는 stack, 알고 있다면
- 첫 번째로 유용해야 하는 결과
- 제약, non-goals, deadlines, 있다면

## 필수 Pass

`scripts/new-project`를 실행한 뒤, 생성된 프로젝트 안에서 Codex에게 `prompts/start-project.md`를 사용하게 합니다.

Codex는 다음 파일을 갱신해야 합니다.

- `README.md`
- `AGENTS.md`
- `notes/decisions.md`
- `notes/todos.md`
- `notes/bugs.md`, 알려진 문제가 있을 때만
- `.env.example`, 필요한 환경 변수를 알고 있을 때
- `Makefile`, 실제 검사 명령을 알고 있을 때
- `projects/registry.md`, 하네스 root 기준. GitHub repo가 있으면 URL도 기록합니다.

## README 기준

프로젝트 `README.md`는 다음을 설명해야 합니다.

- 한두 문장의 목표
- 명시적인 non-goals
- 첫 번째 milestone
- setup 및 실행 명령
- 검사 명령
- 환경 변수
- open questions

나중에 돌아온 사람과 처음 진입한 AI agent가 모두 이해할 수 있게 씁니다.

## AGENTS 기준

프로젝트 `AGENTS.md`는 다음을 정의해야 합니다.

- 편집 전 읽을 파일
- 프로젝트별 제약
- 구현 선호
- dependency 정책
- 검증 명령
- `notes/`에 기록할 내용

안정적으로 반복될 규칙만 여기에 둡니다. 일회성 task detail은 prompt나 issue에 둡니다.

## Notes 기준

`notes/decisions.md`에는 오래 남아야 하는 판단을 기록합니다. 특히 stack 선택, product scope, tradeoff를 남깁니다.

`notes/todos.md`에는 구체적인 다음 행동을 기록합니다. "앱 개선" 같은 모호한 작업 대신, 가장 작은 유용한 다음 단계를 씁니다.

`notes/bugs.md`에는 알려진 incorrect behavior만 기록합니다.

## 완료 기준

startup pass는 다음 조건을 만족하면 완료입니다.

- 프로젝트 목적이 `README.md`에 드러납니다.
- 첫 milestone과 다음 task가 구체적입니다.
- local Codex rule이 프로젝트에 맞습니다.
- `make check`가 존재하고, 실제 검사를 실행하거나 아직 검사가 없음을 명확히 말합니다.
- 건너뛴 검사나 모르는 점이 기록되어 있습니다.
