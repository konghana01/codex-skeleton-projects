# 환경

## 필수

- `bash`
- `git`
- macOS에서 제공되는 standard Unix tools

## 선택

- `node`
- `npm`, `pnpm`, or `yarn`
- `python3`
- 개별 프로젝트에 필요한 language-specific formatter와 test runner

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
