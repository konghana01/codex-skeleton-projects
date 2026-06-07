# Bugfix 프롬프트

AI agent에게 bug를 진단하고 수정해달라고 요청할 때 사용합니다.

```text
다음 bug를 수정해줘.

Observed behavior:
- ...

Expected behavior:
- ...

Reproduction:
- ...

Context to read first:
- README.md
- AGENTS.md
- ...

Constraints:
- 관련 없는 사용자 변경사항은 보존해줘.
- fix는 실패 동작 범위에 맞춰 작게 유지해줘.
- Codex App을 기본 실행 표면으로 사용해줘. oh-my-codex가 설치되어 있으면 App 안 workflow discovery를 보조로 사용할 수 있지만, CLI runtime은 내가 명시했거나 재현/검증 루프에 꼭 필요할 때만 사용해줘.

Verification:
- bug를 재현하는 가장 작은 test를 실행해줘.
- 그다음 관련 broader checks를 실행해줘.
```
