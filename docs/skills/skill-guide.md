# Skill Guide

이 문서는 Side Harness에서 Codex skill을 어떻게 만들고, 어디에 두고, 언제 검토하고, 언제 폐기할지에 대한 단일 기준입니다. package 계약, 작성 형식, lifecycle을 한 곳에 모읍니다.

## Source and Exposure

- canonical source는 `skills/<skill-name>/`입니다.
- repo-local exposure는 `.agents/skills/<skill-name>/`입니다. 실제 노출이 필요할 때만 만듭니다.
- Claude Code project exposure는 `.claude/skills/<skill-name>/`입니다. 실제 노출이 필요할 때만 만듭니다.
- local install은 `${CODEX_HOME:-$HOME/.codex}/skills` 또는 `~/.codex/skills`를 사용합니다.
- source를 먼저 수정하고 exposure/install 위치는 필요할 때만 동기화합니다.
- `skills/` 아래에는 실제 managed skill source만 둡니다. template, example, placeholder package는 두지 않습니다.

## Package Shape

```text
skills/<skill-name>/
  SKILL.md
  references/
  scripts/
  assets/
  agents/
    openai.yaml
```

필수 파일은 `SKILL.md`입니다. 나머지 directory는 실제로 필요할 때만 둡니다.

공통 규칙:

- directory name과 `SKILL.md`의 `name`은 일치해야 합니다.
- `name`은 lowercase hyphen-case를 사용합니다.
- `description`에는 무엇을 하는지와 언제 사용해야 하는지를 모두 적습니다.
- `SKILL.md`는 500 lines 아래를 목표로 합니다.
- 하나의 skill은 하나의 집중된 workflow를 다룹니다.
- 긴 설명은 `references/`로 분리합니다.
- 반복적이고 deterministic한 작업은 `scripts/`로 둡니다.
- output에 쓰는 template, boilerplate, image, sample data는 `assets/`로 둡니다.

## SKILL.md

`SKILL.md`는 YAML frontmatter와 절차 중심 본문으로 구성합니다.

```yaml
---
name: skill-name
description: "무엇을 하는 skill인지와 언제 trigger되어야 하는지를 구체적으로 적습니다."
---
```

`description`은 trigger contract입니다. 본문을 읽기 전에 이 값만 보고 skill 사용 여부가 결정될 수 있으므로 다음을 포함합니다.

- skill이 해결하는 일
- 사용할 상황
- 관련 파일 형식, tool, workflow, task
- 필요하다면 사용하지 말아야 할 가까운 상황

본문은 필요한 섹션만 둡니다.

```md
# Skill Title

## Overview

## When To Use

## When Not To Use

## Workflow

## Resources

## Validation
```

단순 skill은 불필요한 섹션을 제거합니다. 복잡한 skill은 `Decision Tree`, `Modes`, `Quality Rules`, `Examples`를 추가할 수 있습니다. trigger 정보는 본문에만 숨기지 않습니다.

## Resources

### `scripts/`

반복해서 다시 작성하면 위험하거나 낭비인 deterministic operation을 둡니다.

- file conversion
- API 호출 wrapper
- validation script
- data processing
- scaffold generator

### `references/`

본문에 넣기에는 길지만 작업 중 필요할 수 있는 문서를 둡니다.

- API reference
- schema
- domain policy
- 상세 workflow guide
- 긴 예시 모음

`SKILL.md`에는 어떤 상황에서 어떤 reference를 읽을지만 적습니다. 긴 내용을 본문에 중복하지 않습니다.

### `assets/`

Codex가 output을 만들 때 복사하거나 사용할 파일을 둡니다.

- template
- boilerplate
- image/icon/font
- sample data

## Optional Metadata

UI metadata가 필요하면 `agents/openai.yaml`을 둡니다.

```yaml
interface:
  display_name: "Skill Display Name"
  short_description: "짧은 UI 설명"
  default_prompt: "Use $skill-name to ..."
```

`default_prompt`는 `$skill-name`을 명시해야 합니다. icon이나 brand color는 명시적으로 필요할 때만 추가합니다. `agents/openai.yaml`은 Codex/OpenAI product-specific metadata이며, Claude 호환 package로 노출할 때 이 파일에 의존하지 않습니다.

Claude Code는 `SKILL.md` frontmatter의 `name`과 `description`을 기준으로 skill을 발견합니다. Claude-targeted exposure에서만 `allowed-tools` 같은 metadata를 추가합니다.

## Creation Criteria

새 skill은 다음 조건을 모두 만족할 때만 만듭니다.

- 같은 workflow가 여러 프로젝트에서 반복됩니다.
- prompt만으로는 품질이 흔들립니다.
- 구체적인 trigger 예시와 non-trigger 예시가 있습니다.
- skill package 안에 모아둘 reference, script, asset 중 하나 이상이 실제로 유용합니다.
- validation 방법이 있습니다.

조건을 만족하지 않으면 `AGENTS.md`, `docs/`, `prompts/` 중 더 낮은 비용의 계층을 사용합니다.

## Lifecycle

### 생성

1. `prompts/create-skill.md`를 사용합니다.
2. `/skill-creator`를 기준으로 skill을 초기화합니다.
3. source 위치는 기본적으로 `skills/<skill-name>/`를 사용합니다.
4. `SKILL.md`의 `description`에 trigger 조건을 구체적으로 씁니다.
5. 필요한 resource만 추가합니다.
6. placeholder를 제거합니다.
7. validator를 실행합니다.

### 변경

- trigger가 너무 넓어지지 않았는가?
- `description`만 읽고 trigger/non-trigger가 판단되는가?
- root `AGENTS.md`나 governance 문서와 충돌하지 않는가?
- reference가 `SKILL.md`와 중복되지 않는가?
- script를 바꿨다면 대표 경로를 실행했는가?
- `agents/openai.yaml`이 `SKILL.md`와 맞는가?
- 노출된 copy가 있다면 source와 동기화가 필요한가?

### Review

skill review는 code review와 다르게 trigger 품질을 우선합니다. 반복 review에는 `prompts/skill-review.md`를 사용합니다.

확인할 것:

- 이 skill이 언제 사용되어야 하는지 명확한가?
- 사용하지 말아야 할 경우가 필요한 만큼 명시되어 있는가?
- skill 본문이 절차 중심인가?
- reference/script/asset이 package 안에 응집되어 있는가?
- validation이 재현 가능한가?
- trigger test에 가까운 yes/no 예시가 모두 있는가?

### 폐기

다음 중 하나에 해당하면 skill을 폐기하거나 prompt/docs로 낮춥니다.

- 한 프로젝트에서만 쓰입니다.
- trigger가 모호해서 잘못 호출됩니다.
- 유지 비용이 반복 이득보다 큽니다.
- `SKILL.md`가 단순 prompt와 다르지 않습니다.
- resource가 없고 절차도 짧습니다.

폐기할 때는 해당 workflow가 이동한 위치를 `docs/governance/rules-and-skills.md` 또는 관련 prompt에 남깁니다.

## Validation

- 새 skill 또는 큰 수정 후에는 `/skill-creator`의 validator를 실행합니다.

```bash
python3 "${CODEX_HOME:-$HOME/.codex}/skills/.system/skill-creator/scripts/quick_validate.py" <path-to-skill-folder>
```

- `agents/openai.yaml`을 만들거나 수정했다면 `/skill-creator`의 `references/openai_yaml.md` 기준과 맞는지 확인합니다.
- 복잡한 skill은 실제 요청 예시 1-2개로 forward-test합니다.
- trigger 품질은 yes/no 표로 최소 검토합니다.

```text
Prompt | Should trigger? | Reason | Expected first action
...    | yes/no          | ...    | ...
```
