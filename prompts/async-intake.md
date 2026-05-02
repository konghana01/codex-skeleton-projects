# 비동기 Intake 프롬프트

메신저, GitHub issue, email, note 등에서 들어온 자연어 요청을 작업 가능한 task로 정리할 때 사용합니다.

```text
다음 비동기 작업 요청을 구현 가능한 task로 정리해줘.

Raw request:
- ...

Context to read first:
- README.md
- AGENTS.md
- notes/decisions.md
- notes/todos.md
- docs/workflows/async-workflow.md, if available

Output:
- Project:
- Goal:
- User-facing behavior:
- Acceptance criteria:
- Constraints:
- Non-goals:
- Verification plan:
- Suggested branch name:
- Required clarification, if any:
- Suggested next prompt:

Constraints:
- 모호하지만 안전한 기본값이 있으면 선택하고 기록해줘.
- 구현 방향이 크게 갈릴 정도로 모호하면 질문으로 멈춰줘.
- secret, billing, production data, destructive action이 관련되면 승인 필요로 표시해줘.
```
