# 환경

## 필수

- `bash`
- `git`
- macOS에서 제공되는 standard Unix tools

## 선택

- `node`
- `npm`, `pnpm`, or `yarn`
- `python3`
- `omx`, Codex App에서 oh-my-codex skill/workflow surface를 선택적으로 쓸 때
- 개별 프로젝트에 필요한 language-specific formatter와 test runner

## Codex App and OMX

기본 실행 표면은 Codex App입니다. 하네스 작업은 Codex App, repo-local `AGENTS.md`, `docs/`, `prompts/`, `skills/`만으로 수행할 수 있어야 합니다.

oh-my-codex는 optional accelerator입니다. 설치되어 있다면 다음 용도로 사용합니다.

- Codex App 안에서 `/skills` 또는 `$plan`, `$code-review` 같은 plugin-provided skill/workflow discovery를 사용합니다.
- `omx setup`, `omx update`, `omx doctor`, `omx list`는 설치와 상태 점검 같은 관리 명령으로 사용합니다.
- `omx exec`, `omx team`, HUD, tmux/sidecar runtime은 명시적으로 CLI runtime이 필요한 경우에만 사용합니다.

하네스 문서와 prompt는 Codex App-first 흐름을 기준으로 작성합니다. OMX가 없어도 기본 작업 흐름이 깨지면 안 됩니다.

`.omx/`는 oh-my-codex runtime/cache/state입니다. source of truth가 아니므로 commit하지 않습니다.

## Secrets

- local secret은 `.env`에 둡니다.
- commit하는 것은 `.env.example`만 허용합니다.
- API key를 prompt, log, commit, issue text에 붙여넣지 않습니다.

## Local Checks

다음을 실행합니다.

```bash
./scripts/doctor
```

이 명령은 하네스 구조를 확인하고 일반적인 optional tool 상태를 보고합니다.

OMX 상태가 필요한 작업에서는 추가로 다음을 실행합니다.

```bash
omx doctor
```
