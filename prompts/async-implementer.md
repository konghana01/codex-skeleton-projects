# 비동기 구현 프롬프트

PR 생성을 목표로 feature 또는 bugfix를 비동기로 구현할 때 사용합니다.

```text
이 task를 구현하고 PR 생성 가능한 상태로 만들어줘.

Task:
- ...

Acceptance criteria:
- ...

Context to read first:
- README.md
- AGENTS.md
- notes/decisions.md
- notes/todos.md
- docs/workflows/async-workflow.md, if available

Branch:
- create or use: ...

Constraints:
- main에 직접 commit하지 마.
- 관련 없는 사용자 변경사항은 보존해줘.
- dependency는 실제 복잡도를 줄일 때만 추가해줘.
- 실패한 check를 숨기지 말고 원인을 읽고 수정해줘.
- blocker가 있으면 PR 대신 blocker report를 남겨줘.

Implementation loop:
- scope 확인
- branch 상태 확인
- 구현
- 가장 좁은 check 실행
- 실패 시 self-heal
- 관련 broader check 실행
- diff review
- PR body 작성

Verification:
- make check
- task-specific tests:
- skipped checks:

Output:
- Changed files
- Checks run
- PR title
- PR body
- PR URL, if created
- Blocker, if any
```
