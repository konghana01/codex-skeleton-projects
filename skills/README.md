# Managed Skills

이 디렉토리는 Side Harness가 source로 관리하는 Codex skill package를 두는 곳입니다.

repo-local exposure 위치인 `.agents/skills`, Claude Code exposure 위치인 `.claude/skills`, 설치 위치인 `$CODEX_HOME/skills` 또는 `~/.codex/skills`와 구분합니다. 여기는 검토 가능한 source package이고, 노출/설치 위치는 agent가 실행 중 읽는 배포 결과입니다.

## Package Shape

```text
skills/<skill-name>/
  SKILL.md
  agents/
    openai.yaml
  references/
  scripts/
  assets/
```

필수 파일은 `SKILL.md`입니다. 나머지 directory는 필요할 때만 둡니다.

## Rules

- skill은 꼭 필요할 때만 만듭니다.
- skill name은 lowercase hyphen-case를 사용합니다.
- package 내부에 관련 reference, script, asset을 응집시킵니다.
- root `AGENTS.md`와 `docs/governance/governance.md`를 override하지 않습니다.
- package 공통 계약은 `docs/skills/package-contract.md`를 따릅니다.
- 공식 작성 기준과 trigger 검토는 `docs/skills/codex-skill-guidelines.md`를 따릅니다.
- 생성과 수정 기준은 `docs/skills/skill-lifecycle.md`를 따릅니다.
