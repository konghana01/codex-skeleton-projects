# 비동기 작업 프롬프트

비동기 issue/PR 작업을 단계별로 처리할 때 사용합니다. `Mode`에 `intake`, `implement`, `review`, `address-review`, `final-report` 중 하나를 지정합니다.

```text
비동기 작업을 다음 mode로 처리해줘.

Mode:
- intake | implement | review | address-review | final-report

Task context:
- ...

Context to read first:
- README.md
- AGENTS.md
- notes/decisions.md, if available
- notes/todos.md, if available
- docs/workflows/async-workflow.md, if available

Shared constraints:
- main에 직접 commit하지 마.
- durable state는 GitHub issue, PR, commit, repo 문서에 둬.
- 관련 없는 사용자 변경사항은 보존해줘.
- secret, billing, production data, destructive action이 관련되면 승인 필요로 표시해줘.
- 실패한 check를 숨기지 말고 원인과 blocker를 기록해줘.

Mode details:

intake:
- Raw request를 구현 가능한 task로 정리해줘.
- Output: Project, Goal, User-facing behavior, Acceptance criteria, Constraints, Non-goals, Verification plan, Suggested branch name, Required clarification, Suggested next mode.

implement:
- Acceptance criteria 기준으로 branch 작업과 PR 생성 가능한 상태를 목표로 구현해줘.
- Loop: scope 확인, branch 상태 확인, 구현, 좁은 check, 실패 시 self-heal, broader check, diff review, PR body 작성.
- Output: Changed files, Checks run, PR title, PR body, PR URL if created, Blocker if any.

review:
- PR 또는 branch를 code review 관점으로 검토해줘.
- Focus: correctness bugs, regressions, missing tests, security/data-loss risks, confusing behavior, acceptance criteria mismatch.
- Output: Review decision, Findings with file/line, Required changes, Residual risks, Suggested verification.

address-review:
- Review finding과 직접 관련된 변경만 반영해줘.
- test를 약화하지 말고, 반영할 수 없는 finding은 이유를 설명해줘.
- Output: Addressed findings, Changed files, Checks run, Remaining findings, PR update summary.

final-report:
- 사용자에게 5-8줄 이내로 최종 상태를 보고해줘.
- Output: PR URL, 구현 요약, 리뷰 반영 여부, checks, 남은 risk, 사용자에게 필요한 next action.
```
