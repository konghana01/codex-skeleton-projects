# 거버넌스 변경 프롬프트

하네스의 문서, rule, prompt, skill 계층을 바꾸는 요청에 사용합니다.

```text
다음 하네스 거버넌스 변경을 처리해줘.

Change request:
- ...

Context to read first:
- AGENTS.md
- README.md
- docs/governance.md
- docs/context-map.md
- docs/conventions.md
- 관련 docs/prompts/skills 파일

Decide:
- 이 변경은 rule, docs, prompt, skill 중 어디에 속하는가?
- 기존 source of truth와 중복되는가?
- root AGENTS.md와 충돌하는가?
- 더 낮은 비용의 계층으로 충분한가?

Constraints:
- root AGENTS.md가 가장 강한 repo-local rule이다.
- 오래 변하지 않을 맥락만 docs에 둔다.
- 반복 작업 시작 템플릿만 prompts에 둔다.
- 꼭 필요한 구체 workflow만 skills에 둔다.
- 중복이 생기면 한 곳을 source of truth로 정하고 다른 곳은 링크한다.

Verification:
- ./scripts/doctor
- 변경한 script가 있다면 bash -n 또는 해당 syntax check

Output:
- Classification:
- Source of truth:
- Changed files:
- Conflicts avoided:
- Checks run:
- Follow-up:
```
