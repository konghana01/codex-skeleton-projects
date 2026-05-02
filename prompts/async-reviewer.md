# 비동기 리뷰 프롬프트

구현 에이전트가 만든 branch 또는 PR을 독립적으로 review할 때 사용합니다.

```text
이 PR 또는 branch를 code review 관점으로 검토해줘.

Target:
- PR URL or branch:

Context to read first:
- README.md
- AGENTS.md
- notes/decisions.md
- docs/async-workflow.md, if available

Focus:
- correctness bugs
- regressions
- missing tests
- security or data-loss risks
- confusing behavior
- acceptance criteria mismatch

Constraints:
- 요청하지 않았다면 code를 rewrite하지 마.
- finding은 file/line reference를 포함해줘.
- nit보다 실제 risk를 우선해줘.
- 문제가 없으면 그렇게 말하고 residual risk만 남겨줘.

Verification context:
- Tests run by implementer:
- Tests not run:

Output:
- Review decision: approve / request changes / blocked
- Findings:
- Required changes:
- Residual risks:
- Suggested verification:
```
