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

Codex App을 기본 실행 표면으로 사용해줘. oh-my-codex가 설치되어 있으면 `$code-review` 같은 App 안 workflow discovery를 보조로 사용할 수 있지만, 요청하지 않았다면 CLI runtime을 새로 시작하지 마.

요청하지 않았다면 code를 rewrite하지 마. Finding에는 file과 line reference를 포함해줘.

Verification context:
- Tests run:
- Tests not run:
```
