# Skill 작성 기준

Codex skill은 반복되는 전문 workflow를 다른 Codex 세션이 안정적으로 수행하도록 만드는 작은 패키지입니다. 이 문서는 `/skill-creator`, `docs/skills/package-contract.md`, 로컬 system skills의 구조를 기준으로 Side Harness에서 skill을 만들 때 지켜야 할 작성 형식을 정의합니다.

## 판단 기준

skill을 만들기 전에 먼저 이 질문에 답합니다.

- 이 workflow가 단일 프로젝트를 넘어 반복되는가?
- 일반 prompt보다 긴 절차, domain knowledge, tool knowledge가 필요한가?
- `scripts/`, `references/`, `assets/`가 반복 실수를 줄이는가?
- 다른 Codex 세션이 이 skill만 읽고도 같은 품질로 수행할 수 있는가?

하나의 프로젝트에만 적용되는 선호나 규칙이면 skill이 아니라 프로젝트 `AGENTS.md` 또는 `docs/`에 둡니다.

## 권장 디렉토리

하네스에서 source로 관리하는 skill은 `skills/<skill-name>/` 아래에 둡니다.

```text
skills/skill-name/
  SKILL.md
  agents/
    openai.yaml
  scripts/
  references/
  assets/
```

필수 파일은 `SKILL.md`뿐입니다. `agents/openai.yaml`은 UI metadata가 필요할 때 권장합니다. `scripts/`, `references/`, `assets/`는 직접 필요한 경우에만 만듭니다.

`.agents/skills/<skill-name>/`은 필요할 때 repo-local Codex discovery를 위한 노출 위치입니다. `.claude/skills/<skill-name>/`은 Claude Code project skill 노출 위치입니다. `$CODEX_HOME/skills` 또는 `~/.codex/skills`는 현재 사용자 환경의 Codex 설치 위치입니다. repo의 `skills/`는 검토 가능한 source of truth입니다.

## SKILL.md Frontmatter

`SKILL.md`는 YAML frontmatter로 시작합니다.

```yaml
---
name: skill-name
description: "무엇을 하는 skill인지와 언제 trigger되어야 하는지를 구체적으로 적습니다."
---
```

`description`은 Codex가 skill을 사용할지 판단하는 routing contract입니다. 본문을 읽기 전에 이 값만 보고 skill 사용 여부가 결정될 수 있으므로 다음을 포함합니다.

- skill이 해결하는 일
- 사용할 상황
- 관련 파일 형식, tool, workflow, task
- 사용하지 말아야 할 가까운 상황, 필요하다면

trigger 정보는 본문에만 숨기지 않습니다. 본문의 `When To Use`는 이미 skill이 trigger된 뒤 경계를 재확인하는 보조 정보입니다.

기본적으로 `name`과 `description`만 둡니다. system skill에서 `metadata`가 보이더라도 새 skill은 `/skill-creator`와 validation 결과를 우선합니다.

## SKILL.md 본문 구조

본문은 절차 중심으로 씁니다. 모든 skill이 같은 목차를 가질 필요는 없지만, 기본형은 다음을 권장합니다.

```md
# Skill Title

## Overview

이 skill이 가능하게 하는 일을 1-2문장으로 설명합니다.

## Quick Start

가장 흔한 사용 절차를 짧게 적습니다.

## When To Use

- trigger 예시
- 적합한 task

## When Not To Use

- 다른 rule, prompt, script, 또는 일반 구현으로 충분한 경우

## Workflow

1. 먼저 확인할 것
2. 실행 순서
3. 판단 기준
4. 산출물 정리

## Resources

- `scripts/...`: 언제 실행하는지
- `references/...`: 언제 읽는지
- `assets/...`: 언제 복사하거나 사용하는지

## Validation

완료 전에 실행할 검사와 실패 시 처리 방법을 적습니다.
```

복잡한 skill은 `Decision Tree`, `Modes`, `Quality Rules`, `Examples` 섹션을 추가할 수 있습니다. 단순 skill은 불필요한 섹션을 제거합니다.

## Resource 설계

### scripts/

반복해서 다시 작성하면 위험하거나 낭비인 deterministic operation을 둡니다.

- file conversion
- API 호출 wrapper
- validation script
- data processing
- scaffold generator

script를 추가했다면 실제로 실행해서 대표 경로를 검증합니다.

### references/

본문에 넣기에는 길지만 작업 중 필요할 수 있는 문서를 둡니다.

- API reference
- schema
- domain policy
- 상세 workflow guide
- 긴 예시 모음

`SKILL.md`에는 어떤 상황에서 어떤 reference를 읽을지만 적습니다. 긴 내용을 본문에 중복하지 않습니다.

### assets/

Codex가 output을 만들 때 복사하거나 사용할 파일을 둡니다.

- template
- boilerplate
- image/icon/font
- sample data

asset은 보통 context로 읽히는 문서가 아니라 결과물에 쓰이는 파일입니다.

## agents/openai.yaml

UI metadata가 필요하면 `agents/openai.yaml`을 둡니다.

```yaml
interface:
  display_name: "Skill Display Name"
  short_description: "짧은 UI 설명"
  default_prompt: "Use $skill-name to ..."
```

`default_prompt`는 `$skill-name`을 명시해야 합니다. icon이나 brand color는 명시적으로 필요할 때만 추가합니다.

`agents/openai.yaml`은 Codex/OpenAI product-specific metadata입니다. Claude 호환 package로 노출할 때 이 파일에 의존하지 않습니다.

## 작성 품질 기준

- `SKILL.md`는 500 lines 아래를 목표로 합니다.
- instructions는 imperative/procedural하게 씁니다.
- 하나의 skill은 하나의 집중된 workflow를 다룹니다.
- 자세한 reference는 `references/`로 분리합니다.
- reference는 가능하면 `SKILL.md`에서 직접 링크되는 1-depth 구조로 둡니다.
- placeholder file은 완성 전에 제거하거나 실제 내용으로 바꿉니다.
- skill folder에는 `README.md`, `CHANGELOG.md`, `INSTALLATION_GUIDE.md` 같은 보조 문서를 만들지 않습니다.
- secret, private token, 실제 credential을 넣지 않습니다.

## 검증

새 skill 또는 큰 수정 후에는 `/skill-creator`의 validator를 실행합니다.

```bash
python3 "${CODEX_HOME:-$HOME/.codex}/skills/.system/skill-creator/scripts/quick_validate.py" <path-to-skill-folder>
```

`agents/openai.yaml`을 만들거나 수정했다면 `/skill-creator`의 `references/openai_yaml.md` 기준과 맞는지 확인합니다.

복잡한 skill은 실제 요청 예시 1-2개로 forward-test하는 것을 권장합니다.

trigger 품질은 다음 표로 최소 검토합니다.

```text
Prompt | Should trigger? | Reason | Expected first action
...    | yes/no          | ...    | ...
```

생성, 변경, review, 폐기 lifecycle은 `docs/skills/skill-lifecycle.md`를 따릅니다.
