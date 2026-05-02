# 프로젝트 시작 프롬프트

Side Harness에서 프로젝트를 생성하거나 clone한 직후 사용합니다.

```text
이 프로젝트를 Codex와 함께 집중적으로 개발할 수 있는 상태로 정리해줘.

Project purpose:
- ...

Known constraints:
- ...

Expected first useful outcome:
- ...

Context to read first:
- README.md
- AGENTS.md
- notes/decisions.md
- notes/todos.md
- ../../AGENTS.md, if this project is under side-harness/projects/
- ../../docs/workflows/project-start.md, if available
- ../../docs/governance/rules-and-skills.md, if available

Update:
- README.md: goal, non-goals, first milestone, commands, environment variables, open questions를 정리해줘.
- AGENTS.md: project-specific rules, 읽어야 할 context, implementation constraints, verification commands를 정리해줘.
- notes/decisions.md: 오래 남아야 하는 초기 결정과 tradeoff를 기록해줘.
- notes/todos.md: 구체적인 next tasks를 기록해줘.
- notes/bugs.md: known bug가 있을 때만 갱신해줘.
- .env.example: 필요한 environment variable을 알고 있을 때만 갱신해줘.
- Makefile: 실제 check command를 알고 있을 때만 갱신해줘.
- ../../projects/registry.md: Side Harness 관리 프로젝트라면 status, path, GitHub URL, next action을 갱신해줘.

Constraints:
- 관련 없는 사용자 변경사항은 보존해줘.
- 프로젝트 방향이 검증되기 전까지 작게 유지해줘.
- 목적상 필요하지 않다면 stack을 임의로 정하지 마.
- dependency는 실제 복잡도를 줄일 때만 추가해줘.
- secret은 commit하지 마.
- 사람이 읽는 문서와 rule 본문은 한국어 우선으로 작성하고, 파일명/명령어/코드 식별자는 영어를 유지해줘.

Verification:
- 가능하면 make check를 실행해줘.
- check가 placeholder이거나 실행할 수 없다면 명확히 말하고, 다음에 추가할 check를 기록해줘.

Output:
- 변경한 파일 목록
- 정리된 프로젝트 형태 요약
- 실행한 check와 건너뛴 check
- 다음 concrete task
```
