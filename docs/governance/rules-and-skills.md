# Rules와 Skills

이 문서는 side project의 품질을 일관되게 유지하면서도 동작을 숨기지 않기 위한 기준입니다.

## 계층

1. Harness rules: root `AGENTS.md`
2. Project rules: `projects/<name>/AGENTS.md`
3. Governance and shared conventions: `docs/`
4. Task prompts: `prompts/`
5. Managed Codex skill sources: `skills/`
6. Repo-local exposed Codex skills: `.agents/skills`
7. Claude Code project skill exposure: `.claude/skills`
8. Installed Codex skills: `$CODEX_HOME/skills` 또는 `~/.codex/skills`

문제를 명확히 해결하는 가장 낮은 계층을 선호합니다.

계층 충돌이 있으면 `docs/governance/governance.md`의 우선순위를 따릅니다.

## Rules

Rules는 항상 적용되는 constraint입니다. Codex가 해당 directory의 모든 task에서 따라야 한다면 `AGENTS.md`에 둡니다.

좋은 rule 예시:

- 편집 전에 읽을 파일
- 완료 전에 실행할 명령
- dependency policy
- security 또는 data handling constraints
- project-specific architecture boundaries

긴 task instruction을 rule에 넣지 않습니다. rule은 여러 task에 걸쳐 계속 참이어야 합니다.

## Prompts

Prompts는 반복 가능한 task request입니다. 여러 프로젝트에서 같은 종류의 작업이 반복된다면 `prompts/`에 둡니다.

좋은 prompt 예시:

- 목적에서 프로젝트 시작하기
- feature 구현하기
- bug 수정하기
- 변경사항 review하기
- release 준비하기

좋은 prompt는 Codex에게 다음을 알려줍니다.

- 필요한 결과
- 먼저 읽을 context
- constraints
- 갱신될 수 있는 파일
- 실행할 verification
- 보고해야 할 내용

## Skills

Skills는 multiple projects에 걸쳐 반복되는 workflow를 위한 재사용 가능한 capability입니다. prompt만으로 품질이 흔들릴 때만 skill로 승격하고, 상세 기준은 `docs/skills/skill-guide.md` 하나만 봅니다.

하네스의 rules, skills, environment가 실제로 잘 구성되었는지는 `docs/evaluation/rubric.md` 기준으로 정량 평가합니다.
