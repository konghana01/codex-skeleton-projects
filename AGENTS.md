# Side Harness Agent Rules

이 규칙은 `side-harness` 저장소와 여기에서 생성된 프로젝트에 적용됩니다.

## 미션

이 저장소는 사이드 프로젝트를 반복 가능한 방식으로 시작하고 관리합니다. 작고, 단순하고, 검토하기 쉽게 유지합니다. 숨겨진 동작보다 명확한 파일과 단순한 shell script를 선호합니다.

## 작업 전 확인

- `README.md`, `projects/registry.md`, `docs/README.md`, `docs/governance/governance.md`, `docs/governance/context-map.md`, 관련 `docs/` 파일을 먼저 읽습니다.
- 생성된 프로젝트를 작업할 때는 해당 프로젝트의 `AGENTS.md`와 `README.md`도 읽습니다.
- 대상 파일에 사용자가 이미 수정한 내용이 있는지 확인하고, 관련 없는 변경은 보존합니다.

## 계층 규칙

- 이 root `AGENTS.md`는 하네스 안에서 가장 강한 repo-local 규칙입니다.
- 생성된 프로젝트의 `AGENTS.md`는 이 파일을 구체화합니다. 충돌하면 이 root `AGENTS.md`가 우선합니다.
- `docs/`에는 오래 유지될 철학, convention, lifecycle, context map을 둡니다.
- `prompts/`에는 반복 작업을 시작하기 위한 task template만 둡니다.
- `skills/`에는 꼭 필요한 경우에만 만드는 엄격한 Codex skill package source를 둡니다.
- 일시적인 상태나 다음 행동은 project `notes/` 또는 GitHub issue/PR에 둡니다.

## 프로젝트 생성 계약

- 관리 대상 프로젝트를 만들 때는 `scripts/new-project`를 사용합니다.
- 기본 템플릿은 `scratch`입니다.
- 새 프로젝트는 `projects/<project-name>/` 아래에 둡니다.
- 프로젝트 이름은 letters, numbers, dots, underscores, hyphens만 사용합니다.
- 이미 존재하는 프로젝트 디렉토리는 덮어쓰지 않습니다.

## 구현 규칙

- 실제 프로젝트에서 필요가 증명되기 전까지 템플릿은 최소로 유지합니다.
- 같은 동작이 최소 두 개 프로젝트에서 반복되기 전에는 script로 공통화하지 않습니다.
- 프롬프트는 task-focused로 유지합니다. 필요한 결과, 먼저 읽을 컨텍스트, 실행할 검사를 명확히 적습니다.
- 프로젝트 생성 또는 clone 직후 첫 목적 정리에는 `prompts/start-project.md`를 사용합니다.
- guidance가 rules, prompts, scripts, Codex skills 중 어디에 속하는지는 `docs/governance/rules-and-skills.md`를 기준으로 판단합니다.
- 문서와 skill의 source of truth는 `docs/governance/governance.md`, `docs/governance/context-map.md`, `docs/skills/skill-lifecycle.md`를 기준으로 관리합니다.
- 새 문서는 하나의 역할만 가져야 하며, 배치와 분리 기준은 `docs/governance/documentation.md`를 따릅니다.
- 반복 작업에서 얻은 재사용 가능한 학습은 `docs/governance/improvement-loop.md` 기준으로 선별하고, entry는 `docs/governance/improvement-history.md`에 남깁니다.
- Codex skill을 생성, 수정, 검토할 때는 `/skill-creator`, `docs/skills/package-contract.md`, `docs/skills/skill-authoring.md`, `docs/skills/skill-lifecycle.md`를 먼저 읽습니다.
- 사람이 읽는 규칙과 프롬프트 본문은 한국어 우선으로 작성하고, 파일명/명령어/코드 식별자는 영어를 유지합니다.
- secret을 commit하지 않습니다. `.env`는 local에만 두고, 공유 가능한 값만 `.env.example`에 둡니다.

## 검증

하네스 자체를 수정한 뒤에는 다음을 실행합니다.

```bash
./scripts/doctor
```

프로젝트를 생성한 뒤에는 가능하면 해당 프로젝트의 local check를 실행합니다.

```bash
make check
```

검사를 실행할 수 없다면 이유를 명확히 남깁니다.
