# Codex Skill 공식 작성 기준

이 문서는 Codex skill을 만들거나 검토할 때 참고할 Codex-specific 공식/시스템 기준만 정리합니다. 공통 package 계약은 `docs/skills/package-contract.md`, `SKILL.md` 작성 형식은 `docs/skills/skill-authoring.md`, 생명주기는 `docs/skills/skill-lifecycle.md`를 따릅니다.

## 언제 읽는가

다음 상황에서는 이 문서를 먼저 읽습니다.

- 새 Codex skill을 만들지 판단할 때
- 기존 `skills/<skill-name>/` package를 수정할 때
- skill trigger가 너무 넓거나 모호한지 검토할 때
- Codex에서 `description`이 skill trigger로 잘 작동하는지 검토할 때
- `agents/openai.yaml`이 필요한지 판단할 때
- Codex validator와 trigger test 기준이 필요한 때

## 기준 Source

우선순위는 다음과 같습니다.

1. 현재 Codex 세션의 외부 system/developer 지침
2. 이 repo의 root `AGENTS.md`
3. `/skill-creator` system skill
4. OpenAI Codex Skills 공식 문서: `https://developers.openai.com/codex/skills`
5. OpenAI Skills/Agents SDK blog: `https://developers.openai.com/blog/skills-agents-sdk`
6. 이 문서와 `docs/skills/package-contract.md`, `docs/skills/skill-authoring.md`, `docs/skills/skill-lifecycle.md`

공식 문서가 바뀌었을 가능성이 있거나 product behavior가 중요한 작업이면 공식 문서를 다시 확인합니다.

## 핵심 원칙

### `description`은 routing contract다

`SKILL.md` frontmatter의 `name`과 `description`은 skill body를 읽기 전에 노출되는 핵심 정보입니다. 특히 `description`은 Codex가 skill을 사용할지 판단하는 trigger contract입니다.

`description`에는 다음을 포함합니다.

- skill이 수행하는 일
- 사용해야 하는 구체적 상황
- 관련 workflow, 파일 형식, tool, domain
- 가까워 보이지만 사용하지 말아야 할 상황, 필요하다면

본문의 `When To Use`는 이미 skill이 trigger된 뒤 경계를 재확인하는 보조 정보입니다. trigger 정보를 본문에만 숨기지 않습니다.

### Progressive disclosure를 지킨다

항상 context에 들어가는 정보는 작아야 합니다.

1. metadata: `name`, `description`
2. `SKILL.md` body: skill이 trigger된 뒤 읽는 핵심 절차
3. bundled resources: 필요한 경우에만 읽거나 실행하는 자료

`SKILL.md`는 500 lines 아래를 목표로 하고, 길고 조건부인 정보는 `references/`로 분리합니다. reference는 가능하면 `SKILL.md`에서 직접 링크되는 1-depth 구조로 둡니다.

### 하나의 집중된 workflow만 담는다

skill은 broad policy나 막연한 선호가 아니라 반복 가능한 전문 workflow를 실행하기 위한 package입니다. 다음 중 하나라면 skill이 아닐 가능성이 큽니다.

- 한 프로젝트에서만 쓰이는 convention
- 항상 적용되어야 하는 rule
- 한 번만 수행할 task instruction
- 짧은 prompt로 충분한 반복 작업

이 경우 `AGENTS.md`, `docs/`, `prompts/` 중 더 낮은 비용의 계층에 둡니다.

### `agents/openai.yaml`은 Codex UI metadata다

`agents/openai.yaml`은 Codex/OpenAI product-specific metadata입니다. 필요할 때만 추가하고, 만들었다면 `/skill-creator/references/openai_yaml.md` 기준과 맞는지 확인합니다.

## `AGENTS.md`와 Skill 연결

항상 적용되는 제약은 `AGENTS.md`에 둡니다. 특정 상황에서 반드시 skill을 쓰게 하고 싶다면 `AGENTS.md`에 좁은 if/then rule로 연결합니다.

좋은 형태:

```md
- 반복 가능한 skill package를 생성하거나 수정할 때는 `/skill-creator`와 `docs/skills/codex-skill-guidelines.md`를 먼저 읽습니다.
- `skills/<skill-name>/`을 review할 때는 `prompts/skill-review.md`를 사용합니다.
```

나쁜 형태:

```md
- 모든 작업에서 skill을 먼저 찾습니다.
- 프로젝트 구현은 항상 특정 skill로 진행합니다.
```

skill trigger는 좁고 구체적이어야 합니다. root rule은 skill을 남용하게 만들면 안 됩니다.

## 검증 기준

새 skill 또는 큰 수정은 다음을 확인합니다.

- `quick_validate.py`가 통과하는가?
- `description`만 읽고 trigger/non-trigger가 판단되는가?
- 실제 trigger 예시와 non-trigger 예시가 각각 있는가?
- `SKILL.md`가 절차 중심이고 과하게 길지 않은가?
- 긴 정보가 `references/`로 분리되어 있는가?
- script가 있다면 대표 경로를 실행했는가?
- asset이 있다면 output에 실제로 쓰이는가?
- `agents/openai.yaml`이 `SKILL.md`와 일치하는가?
- 복잡한 skill이면 실제 요청 예시로 forward-test할 필요가 있는가?

## Trigger Test Template

skill 생성이나 review 때 최소한 다음 표를 채웁니다.

```text
Prompt | Should trigger? | Reason | Expected first action
...    | yes/no          | ...    | ...
```

`yes` 예시만 있으면 trigger가 넓어지기 쉽습니다. 가까운 `no` 예시를 반드시 포함해 skill이 사용되지 않아야 할 경계도 확인합니다.
