# Claude Project Skill Exposure

이 디렉토리는 Claude Code project skill exposure를 위한 자리입니다.

Side Harness의 skill source of truth는 `skills/<skill-name>/`입니다. `.claude/skills/<skill-name>/`은 Claude Code에서 project skill로 발견해야 할 때만 명시적으로 복사하거나 동기화하는 노출 위치로 취급합니다.

## Rules

- source는 항상 `skills/<skill-name>/`에서 먼저 수정합니다.
- 이 디렉토리의 package를 canonical source로 삼지 않습니다.
- 아직 노출할 skill이 없다면 이 README만 둡니다.
- 노출된 skill은 `SKILL.md`를 포함해야 하며, source package와 구조가 같아야 합니다.
- Claude-only metadata가 필요하면 `docs/skills/package-contract.md` 기준으로 분리합니다.
