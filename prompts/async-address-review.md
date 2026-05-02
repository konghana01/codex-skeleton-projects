# 리뷰 반영 프롬프트

리뷰 에이전트가 남긴 finding을 구현 branch에 반영할 때 사용합니다.

```text
다음 review finding을 반영해줘.

Review findings:
- ...

Context to read first:
- README.md
- AGENTS.md
- notes/decisions.md
- docs/async-workflow.md, if available

Constraints:
- finding과 직접 관련된 변경만 해줘.
- review를 우회하기 위해 test를 약화하지 마.
- 관련 없는 formatting churn을 피해야 해.
- 반영할 수 없는 finding은 이유를 설명해줘.

Verification:
- finding을 검증하는 가장 좁은 check
- make check

Output:
- Addressed findings
- Changed files
- Checks run
- Remaining findings
- PR update summary
```
