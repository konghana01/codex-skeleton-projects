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

Skills는 specialized workflow를 위한 재사용 가능한 Codex capability입니다. workflow가 충분히 반복되어 prompt만으로 부족할 때만 skill을 만듭니다.

다음 경우에 skill을 사용합니다.

- workflow가 여러 프로젝트에 걸쳐 적용됩니다.
- specialized domain 또는 tool knowledge가 필요합니다.
- deterministic scripts 또는 assets가 반복 실수를 줄입니다.
- 같은 instruction이 prompt로 감당하기 어려울 만큼 길어집니다.

일회성 project preference를 위해 skill을 만들지 않습니다. 그런 내용은 프로젝트의 `AGENTS.md`에 둡니다.

하네스에서 관리하는 skill source는 `skills/<skill-name>/`에 둡니다. `.agents/skills/<skill-name>/`은 필요할 때 repo-local Codex discovery를 위해 노출하는 위치이고, `.claude/skills/<skill-name>/`은 Claude Code project skill 노출 위치입니다. `$CODEX_HOME/skills` 또는 `~/.codex/skills`는 현재 사용자 환경의 Codex 설치 위치입니다.

## Skill 형태

skill은 작고 self-contained해야 합니다.

```text
skill-name/
  SKILL.md
  agents/openai.yaml
  scripts/
  references/
  assets/
```

필수 파일은 `SKILL.md`뿐입니다. `scripts/`, `references/`, `assets/`는 workflow를 직접 지원할 때만 추가합니다.

## Skill 생성 기준

새 Codex skill을 만들 때는 다음 기준을 따릅니다.

1. 어떤 경우에 trigger되어야 하는지 concrete examples를 정의합니다.
2. 재사용 가능한 부분이 rules, prompts, scripts, references, assets 중 어디에 속하는지 결정합니다.
3. `skills/<skill-name>/` 아래에 source package를 생성합니다.
4. `SKILL.md`는 concise하고 procedural하게 유지합니다.
5. skill을 신뢰하기 전에 validate합니다.

skill이 project-local convention에 불과하다면 global로 설치하거나 `.agents/skills/`, `.claude/skills/`에 노출하지 않습니다. `AGENTS.md`나 `docs/`에 기록합니다.

skill package 공통 계약과 Codex/Claude 노출 위치는 `docs/skills/package-contract.md`를 따릅니다.

공식 Codex skill 작성 팁과 `/skill-creator` 기준은 `docs/skills/codex-skill-guidelines.md`를 따릅니다.

구체적인 `SKILL.md` 틀, resource 설계, `agents/openai.yaml` 기준은 `docs/skills/skill-authoring.md`를 따릅니다.

skill의 생성, 변경, review, 폐기 기준은 `docs/skills/skill-lifecycle.md`를 따릅니다.

하네스의 rules, skills, environment가 실제로 잘 구성되었는지는 `docs/evaluation/rubric.md` 기준으로 정량 평가합니다.
