# Current Harness Assessment

이 문서는 현재 Side Harness 평가 결과만 기록합니다. 평가 기준은 `docs/evaluation/rubric.md`를 따릅니다.

## 2026-05-03

Scope:

- 하네스 root 문서
- skill/rule/environment 문서
- prompt/template/script 구조
- Codex/Claude skill exposure 구조

Score:

| 항목 | 점수 |
| --- | ---: |
| 사람이 보기에 이해 가능한가 | 19/20 |
| AI가 보기에 실행 가능한가 | 18/20 |
| 반복 작업에서 균일한 결과가 나오는가 | 17/20 |
| 결과물 퀄리티와 검증이 충분한가 | 15/20 |
| Skills, rules, environment 운영 준비도 | 17/20 |
| **총점** | **86/100** |

Decision:

- usable with gaps

Evidence:

- `README.md`, `AGENTS.md`, `docs/README.md`, `docs/governance/governance.md`, `docs/governance/context-map.md`, `docs/governance/documentation.md`가 계층과 진입 순서를 정의합니다.
- `docs/governance/improvement-loop.md`와 `docs/governance/improvement-history.md`가 반복 학습을 하네스 개선으로 승격하는 경로를 분리합니다.
- `prompts/start-project.md`, feature/review/refactor/release prompt, async prompt들이 반복 작업의 결과 형식을 어느 정도 고정합니다.
- `docs/skills/package-contract.md`, `docs/skills/codex-skill-guidelines.md`, `docs/skills/skill-authoring.md`, `docs/skills/skill-lifecycle.md`가 skill source, format, lifecycle, Codex-specific 기준을 분리합니다.
- `scripts/doctor`가 하네스 구조를 확인하지만, 실제 프로젝트 stack의 lint/test/typecheck 품질까지 보장하지는 않습니다.
- `docs/workflows/async-workflow.md`는 PR 중심 생명주기를 정의하지만, GitHub issue/PR automation, command approval rules, cloud task 환경은 아직 문서 중심입니다.

Top risks:

1. root `AGENTS.md`를 강하게 유지하려는 의도와 Codex의 가까운 `AGENTS.md` 계층 동작이 충돌할 수 있습니다. 생성 프로젝트 `AGENTS.md`가 root priority를 반복해서 명시하고 있어 완화되지만, 실제 프로젝트에서 local rule을 추가할 때 계속 감시해야 합니다.
2. skill package 기준은 좋아졌지만 실제 managed skill이 아직 거의 없기 때문에 skill 품질은 구조 기준만 검증된 상태입니다.
3. 반복 결과의 균일성은 prompt/template에 의존합니다. generated project별 real checks가 생기기 전까지 결과 품질은 stack마다 흔들릴 수 있습니다.
4. 비동기 작업은 설계가 있지만 GitHub issue/PR automation, reviewer separation, notification loop가 아직 실행 시스템으로 고정되지 않았습니다.
5. environment 문서는 최소 수준입니다. 외부에서 오래 도는 작업, secret handling, approval point, cloud/local 차이에 대한 operational runbook이 더 필요합니다.

Highest leverage improvements:

1. 첫 managed skill을 하나 만들고 `quick_validate.py`, trigger test, review prompt로 end-to-end 검증합니다.
2. 생성 프로젝트 startup 후 `Makefile` placeholder를 실제 lint/test/typecheck로 바꾸는 기준을 `docs/workflows/project-start.md`와 template에 더 강하게 넣습니다.
3. GitHub issue 기반 async loop를 실제 명령/PR template/checklist로 구체화합니다.
4. command approval rules와 local/cloud environment 차이를 `docs/operations/environment.md`에 확장합니다.
5. `prompts/evaluate-harness.md`로 정기 평가를 반복하고, 점수 변화와 개선 action을 PR 단위로 추적합니다.
