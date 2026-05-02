# 작업 흐름

## 1. 시작

먼저 registry를 사용합니다. 프로젝트가 커지기 전에 짧은 목적, 상태, 다음 행동을 갖고 있어야 합니다.

```bash
./scripts/new-project my-idea scratch
```

## 2. 형태 잡기

생성된 `README.md`를 채웁니다.

- Goal
- Non-goals
- First milestone
- Commands
- Open questions

그다음 생성된 `AGENTS.md`를 프로젝트별 규칙에 맞게 조정합니다.

목적 기반 setup에는 `prompts/start-project.md`를 사용합니다. startup pass는 프로젝트 목적을 구체적인 README 내용, local agent rules, durable notes, first tasks, checks로 바꿔야 합니다.

## 3. 구현

작고 검증 가능한 단계로 작업합니다. 넓지만 끝나지 않은 설계보다 좁아도 동작하는 경로를 선호합니다.

외부에서 비동기로 진행하는 작업은 `docs/workflows/async-workflow.md`를 따릅니다. 기본 종료점은 PR 생성이고, 전체 기능 생명주기는 review finding 반영 후 PR ready 상태까지를 목표로 합니다.

## 4. 검증

task를 완료로 보기 전에 local project checks를 실행합니다.

```bash
make check
```

아직 실제 검사가 없다면, 프로젝트가 중요해지기 전에 가장 작은 유용한 검사를 추가합니다.

## 5. 기록

나중에 다시 추적하기 비싼 결정은 `notes/decisions.md`에 기록합니다.
