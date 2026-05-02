# Skill Package Contract

이 문서는 Side Harness에서 skill을 package로 다루기 위한 공통 계약입니다. 하네스는 Codex-first이지만, Claude도 공식적으로 skill을 directory package로 다루므로 최대한 공통 구조를 유지합니다.

## 결론

Claude에서도 skill은 package directory가 convention입니다. Anthropic 공식 문서도 skill을 `SKILL.md`를 포함한 directory로 설명하고, 필요할 때 scripts, references, assets 또는 templates 같은 supporting files를 함께 둔다고 설명합니다.

따라서 Side Harness의 기본 원칙은 다음과 같습니다.

- canonical source는 `skills/<skill-name>/`입니다.
- Codex repo-local exposure는 `.agents/skills/<skill-name>/`입니다.
- Claude Code project exposure는 `.claude/skills/<skill-name>/`입니다.
- local personal install은 tool별 위치를 사용합니다.
- source를 먼저 고치고, exposure/install 위치는 필요할 때 명시적으로 동기화합니다.
- `skills/` 아래에는 실제 managed skill source만 둡니다. template, example, placeholder package는 두지 않습니다.

## 공통 Package Shape

```text
skill-name/
  SKILL.md
  references/
  scripts/
  assets/
```

필수 파일은 `SKILL.md`입니다. resource directory는 실제로 필요할 때만 둡니다.

공통 규칙:

- directory name과 `SKILL.md`의 `name`은 일치해야 합니다.
- `name`은 lowercase hyphen-case를 사용합니다.
- `description`에는 무엇을 하는지와 언제 사용해야 하는지를 모두 적습니다.
- `SKILL.md`는 500 lines 아래를 목표로 합니다.
- 긴 설명은 `references/`로 분리합니다.
- 반복적이고 deterministic한 작업은 `scripts/`로 둡니다.
- output에 쓰는 template, boilerplate, image, sample data는 `assets/`로 둡니다.
- 하나의 skill은 하나의 집중된 workflow를 다룹니다.

## Codex Package

Codex 기준 위치:

```text
skills/<skill-name>/                 # Side Harness source of truth
.agents/skills/<skill-name>/         # repo-local exposure, 필요할 때만
${CODEX_HOME:-$HOME/.codex}/skills/  # local install, 명시 요청이 있을 때만
```

Codex package는 필요할 때 `agents/openai.yaml`을 추가할 수 있습니다.

```text
skill-name/
  SKILL.md
  agents/
    openai.yaml
  references/
  scripts/
  assets/
```

`agents/openai.yaml`은 Codex/OpenAI product-specific metadata입니다. Claude 호환 package로 노출할 때 이 파일에 의존하지 않습니다.

## Claude Package

Claude Code 기준 위치:

```text
.claude/skills/<skill-name>/   # project skill
~/.claude/skills/<skill-name>/ # personal skill
```

Claude도 `SKILL.md` frontmatter의 `name`과 `description`을 기준으로 skill을 발견합니다. Claude Code는 skill별 tool 제한을 위해 `allowed-tools` frontmatter를 지원할 수 있습니다. 이 값은 Claude-targeted exposure에만 사용하고, Codex source package의 기본값으로 넣지 않습니다.

Claude.ai upload용 skill은 description length 제한이 더 짧을 수 있습니다. Claude.ai에 올릴 목적이 있으면 해당 시점의 공식 Anthropic 문서를 다시 확인합니다.

## Cross-agent Compatibility

Codex와 Claude에서 모두 쓰일 가능성이 있는 skill은 다음 기준을 따릅니다.

- source package는 `skills/<skill-name>/`에 둡니다.
- `SKILL.md` frontmatter는 기본적으로 `name`, `description`만 둡니다.
- Codex 전용 UI metadata는 `agents/openai.yaml`에 둡니다.
- Claude 전용 `allowed-tools` 같은 metadata는 Claude exposure 단계에서만 추가합니다.
- `templates/` 대신 기본적으로 `assets/`를 사용합니다. Claude-only package가 명확하면 `templates/`를 둘 수 있습니다.
- tool-specific instruction은 본문에서 분리하고, 필요한 경우 `references/`에 `codex.md`, `claude.md`처럼 나눕니다.

## Lifecycle Reference

skill 생성, 변경, review, 폐기 절차는 `docs/skills/skill-lifecycle.md`를 따릅니다. 이 문서는 package 위치와 호환성 계약만 정의합니다.

## Official References

- OpenAI Codex Skills: `https://developers.openai.com/codex/skills`
- Anthropic Claude Skills overview: `https://claude.com/docs/skills/overview`
- Anthropic Claude Code Agent Skills: `https://docs.claude.com/en/docs/claude-code/skills`
- Anthropic custom Skills: `https://claude.com/docs/skills/how-to`
