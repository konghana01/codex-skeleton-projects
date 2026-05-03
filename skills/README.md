# Managed Skills

이 디렉토리는 Side Harness가 source로 관리하는 Codex skill package를 두는 곳입니다.

repo-local exposure 위치인 `.agents/skills`, Claude Code exposure 위치인 `.claude/skills`, 설치 위치인 `$CODEX_HOME/skills` 또는 `~/.codex/skills`와 구분합니다. 여기는 검토 가능한 source package이고, 노출/설치 위치는 agent가 실행 중 읽는 배포 결과입니다. 노출 위치는 실제 skill이 있을 때만 만듭니다.

## Current Packages

- `project-startup`: 새로 만들거나 clone한 프로젝트의 초기 정리 workflow

## Rules

- skill은 꼭 필요할 때만 만듭니다.
- skill name은 lowercase hyphen-case를 사용합니다.
- package 내부에 관련 reference, script, asset을 응집시킵니다.
- root `AGENTS.md`와 `docs/governance/governance.md`를 override하지 않습니다.
- package, 작성 형식, trigger, lifecycle 기준은 `docs/skills/skill-guide.md`를 따릅니다.
