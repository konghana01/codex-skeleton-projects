# Review 프롬프트

code review를 요청할 때 사용합니다.

```text
현재 변경사항을 review해줘.

Focus on:
- correctness bugs
- regressions
- missing tests
- security 또는 data-loss risks
- confusing behavior

요청하지 않았다면 code를 rewrite하지 마. Finding에는 file과 line reference를 포함해줘.

Verification context:
- Tests run:
- Tests not run:
```
