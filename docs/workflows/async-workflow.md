# 비동기 작업 운영

이 문서는 메신저, GitHub, Codex를 연결해 외부에서도 기능 개발과 리뷰를 비동기로 진행하기 위한 운영 설계입니다. Slack은 한 가지 예시일 뿐이며, KakaoTalk, Discord, Telegram, email, GitHub issue comment처럼 사용자가 편하게 입력할 수 있는 도구를 같은 개념으로 취급합니다.

## 목표

- 사용자는 익숙한 도구에서 자연어로 작업을 요청합니다.
- 구현 에이전트는 별도 branch에서 기능을 만들고 검증합니다.
- 리뷰 에이전트는 변경사항을 독립적으로 검토합니다.
- 작업의 기본 종료점은 PR 생성입니다.
- 전체 생명주기의 종료점은 리뷰 반영 후 최종 PR 상태를 정리하는 것입니다.

## 원칙

- 메신저는 입력과 알림 UI입니다. durable state는 GitHub issue, PR, commit, repo 문서에 둡니다.
- 모든 작업은 project repo 기준 branch 또는 worktree에서 수행합니다.
- 작업 단위는 PR로 닫힙니다. 직접 `main`에 push하지 않습니다.
- 구현과 리뷰는 역할을 분리합니다. 같은 에이전트가 구현과 최종 리뷰를 모두 신뢰하지 않습니다.
- 자동화는 검증을 통과한 결과만 제안합니다. 실패를 숨기지 않고 blocker로 기록합니다.
- 사람이 승인해야 하는 지점은 명확히 둡니다.

## 구성 요소

### Intake

사용자가 쓰는 입력 도구입니다.

예시:

- Slack channel
- KakaoTalk bot
- Discord channel
- Telegram bot
- GitHub issue
- email-to-issue
- 간단한 web form

Intake는 요청을 받아 normalized task로 바꿉니다.

### Queue

작업의 durable queue입니다.

권장 기본값은 GitHub issue입니다. 초기 하네스 단계에서는 `projects/registry.md`와 project `notes/todos.md`를 보조 queue로 사용할 수 있습니다.

### Implementer

기능 구현 에이전트입니다.

책임:

- 작업 목적과 scope를 정리합니다.
- branch를 만듭니다.
- 기능을 구현합니다.
- `make check`와 관련 검사를 반복 실행합니다.
- 실패하면 원인을 읽고 수정합니다.
- PR을 생성합니다.

### Reviewer

리뷰 에이전트입니다.

책임:

- PR diff를 읽습니다.
- correctness, regression, missing tests, security/data-loss risk를 찾습니다.
- file/line 기반 finding을 남깁니다.
- 필요한 수정 요청을 정리합니다.
- 수정 후 다시 검토합니다.

### Reporter

사용자에게 짧게 보고하는 역할입니다. 구현이나 리뷰를 대신하지 않고 상태를 요약합니다.

보고 위치는 intake thread, channel, GitHub issue comment 중 하나입니다.

## 작업 생명주기

1. `intake`

사용자가 자연어로 요청합니다.

필수 정보:

- project
- goal
- expected behavior
- constraints
- priority, optional

2. `triage`

요청을 작업 가능한 단위로 바꿉니다.

결과:

- GitHub issue 또는 task note
- acceptance criteria
- verification plan
- branch name 후보

3. `implement`

구현 에이전트가 branch에서 작업합니다.

결과:

- code changes
- tests or checks
- updated notes, 필요할 때만
- PR draft 또는 ready PR

4. `self-heal`

검사가 실패하면 구현 에이전트가 실패 로그를 읽고 수정합니다.

중단 조건:

- 필요한 credential이 없음
- 외부 서비스 접근이 불가능함
- destructive action 승인이 필요함
- 요구사항이 재작업 위험을 만들 만큼 모호함

5. `open-pr`

검증 가능한 상태가 되면 PR을 만듭니다.

PR에는 다음이 있어야 합니다.

- summary
- acceptance criteria
- checks run
- screenshots or logs, 필요할 때
- known limitations
- review focus

6. `review`

리뷰 에이전트가 PR을 검토합니다.

결과:

- approve
- request changes
- blocked

7. `address-review`

구현 에이전트가 review finding을 반영합니다.

반영 후 다시 검사를 실행하고 PR에 update comment를 남깁니다.

8. `final-report`

사용자에게 결과를 요약합니다.

포함할 내용:

- PR URL
- 구현 요약
- 리뷰 결과
- 반영된 수정
- 남은 risk
- 다음 행동

## 종료 기준

작업 단위의 기본 종료 기준은 PR 생성입니다.

전체 기능 생명주기의 종료 기준은 다음 중 하나입니다.

- 리뷰 완료 후 PR ready 상태
- 리뷰 finding 반영 완료
- 사람이 merge 승인
- blocker가 명확히 기록됨

초기 운영에서는 `리뷰 finding 반영 완료 후 PR ready`를 기본 완료 기준으로 둡니다.

## 승인 지점

사람 승인이 필요한 지점:

- scope가 불명확해서 구현 방향이 갈릴 때
- secret, billing, production data, destructive operation이 관련될 때
- dependency 추가가 큰 영향을 줄 때
- PR merge 전

사람 승인이 없어도 되는 지점:

- branch 생성
- local check 실행
- test 추가
- PR 생성
- PR에 review comment 작성

## 메시지 포맷

Intake message는 짧아도 됩니다.

```text
project: my-app
goal: 로그인 후 대시보드로 이동하게 해줘
constraints: 새 dependency는 피하고, 기존 auth 구조를 사용
done: make check 통과하고 PR 만들어줘
```

Reporter summary는 짧게 유지합니다.

```text
my-app 작업 PR을 만들었습니다.
PR: <url>
Checks: make check pass
Review: 2개 finding 반영 완료
남은 risk: OAuth provider 실제 계정 테스트는 미실행
```

## 도구 선택 기준

초기에는 GitHub issue와 PR만으로 시작합니다. 메신저 bot은 입력 편의가 충분히 필요해졌을 때 붙입니다.

도구 후보:

- GitHub issue/comment: durable state가 강하고 구현이 단순합니다.
- Slack: team workflow와 slash command가 좋습니다.
- Discord/Telegram: 개인 bot 운영이 가볍습니다.
- KakaoTalk: 한국 사용자 경험은 좋지만 bot/API 운영 제약을 먼저 확인해야 합니다.
- Email-to-issue: 가장 낮은 friction이지만 interactive approval은 약합니다.

## 1차 구현 범위

처음부터 bot을 만들지 않습니다. 먼저 GitHub issue 기반 async loop를 문서와 프롬프트로 운영합니다.

1차 범위:

- issue/task intake 포맷
- `prompts/async-task.md`의 mode별 intake, implement, review, address-review, final-report

2차 범위:

- Slack 또는 다른 메신저 bridge
- 상태 알림
- 승인 reaction 또는 command
- 작업 queue dashboard
