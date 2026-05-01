# __PROJECT_NAME__ Agent Rules

이 프로젝트는 `__TEMPLATE_NAME__` template에서 생성되었습니다.

## 작업 전 확인

- `README.md`를 읽습니다.
- 이 `AGENTS.md`를 읽습니다.
- 관련 context를 위해 `notes/decisions.md`를 확인합니다.
- 현재 next task를 위해 `notes/todos.md`를 확인합니다.
- 관련 없는 사용자 변경사항은 보존합니다.

## Project Startup

프로젝트 목적이 제공되면 `README.md`, 이 `AGENTS.md`, `notes/`를 갱신해서 purpose, first milestone, checks, next task가 명확히 드러나게 합니다.

## 구현

- 초기 변경은 작고 되돌리기 쉽게 유지합니다.
- 프로젝트 방향이 검증되기 전까지 가장 단순하게 동작하는 경로를 선호합니다.
- dependency는 실제 복잡도를 줄일 때만 추가합니다.
- durable project rules는 여기에 둡니다. one-off task detail은 task prompt나 `notes/todos.md`에 둡니다.
- 사람이 읽는 문서와 rule 본문은 한국어 우선으로 작성하고, 파일명/명령어/코드 식별자는 영어를 유지합니다.

## 검증

다음을 실행합니다.

```bash
make check
```

프로젝트에 실제 stack이 생기면 `Makefile`의 placeholder checks를 실제 test, lint, typecheck command로 교체합니다.
