# Skill 생성 프롬프트

반복 workflow를 Codex skill로 만들어야 할 때 사용합니다. 작업 기준은 `/skill-creator`, `docs/skills/package-contract.md`, `docs/skills/codex-skill-guidelines.md`, `docs/skills/skill-authoring.md`, `docs/skills/skill-lifecycle.md`입니다.

```text
이 반복 workflow를 위한 Codex skill을 생성하거나 갱신해줘.

skill 생성 과정의 source of truth는 `/skill-creator`로 삼고, package 공통 계약은 `docs/skills/package-contract.md`, 공식 Codex skill 작성 팁은 `docs/skills/codex-skill-guidelines.md`, Side Harness의 구조화 기준은 `docs/skills/skill-authoring.md`와 `docs/skills/skill-lifecycle.md`를 따라줘.

Workflow:
- ...

Intended users:
- ...

Skill scope:
- Must support:
- Should support:
- Explicit non-goals:

Examples that should trigger the skill:
- ...

Examples that should not trigger the skill:
- ...

Expected output from the skill:
- ...

Reusable resources, if known or recommended:
- scripts:
- references:
- assets:

Preferred location:
- default source package location: skills/<skill-name>/
- repo-local exposure location, only when explicitly needed: .agents/skills/<skill-name>/
- Claude Code project exposure location, only when explicitly needed: .claude/skills/<skill-name>/
- install to ${CODEX_HOME:-$HOME/.codex}/skills only when explicitly asked.

Context to read first:
- /skill-creator
- AGENTS.md
- docs/governance/rules-and-skills.md
- docs/skills/package-contract.md
- docs/skills/codex-skill-guidelines.md
- docs/skills/skill-authoring.md
- docs/skills/skill-lifecycle.md
- any existing related skill, if one exists
- relevant existing Codex system skills, if their structure is useful

Constraints:
- workflow가 단일 프로젝트를 넘어 반복될 때만 skill을 만들어줘.
- 먼저 이 workflow가 skill이 맞는지 판단하고, 아니라면 rule/prompt/docs 중 더 낮은 계층을 제안해줘.
- `/skill-creator` workflow를 따라줘: examples 이해, reusable resources 계획, skill initialize 또는 update, concise instructions 작성, validate, iterate.
- 새 skill source package는 `skills/<skill-name>/` 아래에 만들고, 가능하면 `/skill-creator`의 `init_skill.py`를 해당 경로에 맞게 사용해줘.
- `.agents/skills/<skill-name>/`에는 repo-local discovery가 필요하다고 명시된 경우에만 노출해줘. 노출하더라도 source of truth는 `skills/<skill-name>/`야.
- `.claude/skills/<skill-name>/`에는 Claude Code project skill 노출이 필요하다고 명시된 경우에만 노출해줘.
- Codex 실행용 설치 위치인 `${CODEX_HOME:-$HOME/.codex}/skills`에는 내가 명시적으로 요청할 때만 설치해줘.
- skill name은 lowercase hyphen-case, 64자 이하로 정규화해줘.
- SKILL.md frontmatter는 `name`과 trigger 중심의 `description`을 반드시 포함해줘.
- `description`에는 무엇을 하는지와 언제 사용해야 하는지를 모두 넣어줘. trigger 정보를 본문에만 숨기지 마.
- SKILL.md 본문은 `Overview`, `Quick Start`, `When To Use`, `When Not To Use`, `Workflow`, `Resources`, `Validation` 중 필요한 섹션을 사용해 구조화해줘.
- 불필요한 섹션은 만들지 말고, placeholder는 완성 전에 제거해줘.
- SKILL.md는 concise하고 procedural하게 유지해줘. 500 lines 아래를 목표로 해줘.
- 상세 reference material은 SKILL.md가 아니라 `references/`에 둬.
- deterministic repeated operation은 `scripts/`에 둬.
- output에 쓰이는 template, image, font, boilerplate는 `assets/`에 둬.
- UI metadata가 필요하면 `agents/openai.yaml`을 만들고, `default_prompt`에는 `$skill-name`을 포함해줘.
- README.md, CHANGELOG.md, INSTALLATION_GUIDE.md 같은 보조 문서는 skill folder에 만들지 마.
- secret을 포함하지 마.
- 사람이 읽는 설명은 한국어 우선으로 작성하고, skill name/file name/command/code identifier는 영어를 유지해줘.

Verification:
- `/skill-creator`의 `quick_validate.py`로 skill folder를 validate해줘.
- script를 추가했다면 대표 실행 경로를 실제로 실행해줘.
- `agents/openai.yaml`을 만들었다면 `/skill-creator`의 `references/openai_yaml.md` 기준을 확인해줘.
- 복잡한 skill이면 실제 trigger 예시 1-2개로 forward-test가 필요한지 판단해줘.
- 최소 trigger test table을 작성해줘: should trigger 예시와 should not trigger 예시를 모두 포함해줘.
- 실행할 수 없는 validation이 있으면 이유를 보고해줘.

Output:
- Skill suitability decision
- Skill path
- Normalized skill name
- Trigger summary
- Trigger test table
- Resource plan: scripts / references / assets
- SKILL.md structure summary
- agents/openai.yaml 여부
- 생성 또는 변경한 파일
- Validation result
- 남은 open questions 또는 follow-up
```

Expected SKILL.md shape:

```md
---
name: skill-name
description: "무엇을 하는지와 언제 trigger되어야 하는지를 구체적으로 적는다."
---

# Skill Title

## Overview

## Quick Start

## When To Use

## When Not To Use

## Workflow

## Resources

## Validation
```

Expected resource decision table:

```text
Resource | Needed? | Reason | Files
scripts  | yes/no  | ...    | ...
references | yes/no | ...    | ...
assets   | yes/no  | ...    | ...
```

Expected final report:

```text
- Skill path
- Trigger:
- Structure:
- Resources:
- Files changed:
- Validation:
- Follow-up:
```
