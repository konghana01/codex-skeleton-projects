# Side Harness Agent Rules

이 규칙은 `side-harness` 저장소와 여기에서 생성된 프로젝트에 적용됩니다.

## 미션

이 저장소는 사이드 프로젝트를 반복 가능한 방식으로 시작하고 관리합니다. 작고, 단순하고, 검토하기 쉽게 유지합니다. 숨겨진 동작보다 명확한 파일과 단순한 shell script를 선호합니다.

## 작업 전 확인

- `README.md`, `projects/registry.md`, 관련 `docs/` 파일을 먼저 읽습니다.
- 생성된 프로젝트를 작업할 때는 해당 프로젝트의 `AGENTS.md`와 `README.md`도 읽습니다.
- 대상 파일에 사용자가 이미 수정한 내용이 있는지 확인하고, 관련 없는 변경은 보존합니다.

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
- guidance가 rules, prompts, scripts, Codex skills 중 어디에 속하는지는 `docs/rules-and-skills.md`를 기준으로 판단합니다.
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
