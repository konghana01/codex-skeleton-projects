# Feature 프롬프트

AI agent에게 feature 구현을 요청할 때 사용합니다.

```text
다음 feature를 구현해줘.

Goal:
- ...

Context to read first:
- README.md
- AGENTS.md
- ...

Constraints:
- ...
- Codex App을 기본 실행 표면으로 사용해줘.
- oh-my-codex가 설치되어 있으면 `$plan`으로 scope와 verification을 먼저 정리할 수 있지만, `omx exec`/`omx team` 같은 CLI runtime은 내가 명시했거나 꼭 필요할 때만 사용해줘.

Expected behavior:
- ...

Verification:
- Run ...
- 실행할 수 없는 check가 있으면 보고해줘.
```
