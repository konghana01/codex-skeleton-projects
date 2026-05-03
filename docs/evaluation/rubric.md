# Harness Evaluation Rubric

이 문서는 Side Harness의 rules, skills, prompts, environment를 정량 평가하는 기준만 정의합니다. 현재 점수나 과거 점수는 PR, issue, 또는 필요할 때 별도 기록에 둡니다.

## 기준 Source

평가자는 다음 순서로 기준을 확인합니다.

1. 현재 Codex 세션의 system/developer 지침
2. 이 repo의 root `AGENTS.md`
3. `docs/governance/governance.md`, `docs/governance/context-map.md`, `docs/governance/rules-and-skills.md`
4. `docs/skills/skill-guide.md`
5. OpenAI 공식 Codex 문서

공식 문서는 product behavior가 바뀔 수 있으므로 평가 시점에 다시 확인합니다.

참고 기준:

- Codex Skills: `https://developers.openai.com/codex/skills`
- Codex rules: `https://developers.openai.com/codex/rules`
- Codex AGENTS.md: `https://developers.openai.com/codex/guides/agents-md`
- Codex cloud environments: `https://developers.openai.com/codex/cloud/environments`
- Codex GitHub integration: `https://developers.openai.com/codex/integrations/github`
- OpenAI evals: `https://developers.openai.com/api/docs/guides/evaluation-getting-started`

## 100점 평가 모델

### 1. 사람이 보기에 이해 가능한가: 20점

사람이 하네스의 목적, 계층, 사용 흐름, 변경 기준을 빠르게 이해할 수 있는지 평가합니다.

점수 기준:

- 0-5: 문서가 흩어져 있고 source of truth를 찾기 어렵습니다.
- 6-10: 핵심 문서는 있지만 목적, 흐름, 계층이 자주 중복되거나 충돌합니다.
- 11-15: README와 주요 docs만 읽으면 대부분 이해할 수 있습니다.
- 16-20: 처음 보는 사람도 시작, 변경, 검증, 평가 흐름을 따라갈 수 있습니다.

확인할 파일:

- `README.md`
- `AGENTS.md`
- `docs/governance/governance.md`
- `docs/governance/context-map.md`
- `docs/governance/documentation.md`
- `docs/governance/improvement-loop.md`
- `docs/workflows/project-start.md`

### 2. AI가 보기에 실행 가능한가: 20점

Codex가 어떤 파일을 읽고, 어떤 규칙을 우선하고, 어떤 검사를 실행해야 하는지 모호하지 않은지 평가합니다.

점수 기준:

- 0-5: task마다 읽을 맥락과 완료 기준이 불명확합니다.
- 6-10: 규칙은 있지만 충돌 해결과 검증 기준이 약합니다.
- 11-15: 대부분의 작업에서 필요한 context와 verification을 찾을 수 있습니다.
- 16-20: context map, prompt, AGENTS 계층이 명확하고 반복 실행 시 의사결정이 안정적입니다.

확인할 파일:

- `AGENTS.md`
- `docs/governance/context-map.md`
- `prompts/*.md`
- 생성 프로젝트의 `AGENTS.md`

주의점:

- OpenAI Codex의 `AGENTS.md` 계층은 일반적으로 더 가까운 위치의 지침이 더 구체적인 instruction으로 작동합니다. root rule을 강하게 유지하려면 생성 프로젝트 `AGENTS.md`가 root priority를 반복해서 명시해야 합니다.

### 3. 반복 작업에서 균일한 결과가 나오는가: 20점

프로젝트 생성, 목적 정리, feature 구현, review, skill 생성 같은 반복 작업이 매번 비슷한 품질로 수행되는지 평가합니다.

점수 기준:

- 0-5: 매번 사람의 상세 지시가 필요합니다.
- 6-10: 템플릿은 있지만 산출물과 검증이 자주 흔들립니다.
- 11-15: 일반적인 반복 작업은 prompt와 template로 균일하게 시작됩니다.
- 16-20: 반복 작업마다 intake, acceptance criteria, verification, report 형식이 안정적입니다.

확인할 파일:

- `scripts/new-project`
- `templates/`
- `prompts/start-project.md`
- `prompts/feature.md`
- `prompts/review.md`
- `prompts/async-task.md`

### 4. 결과물 퀄리티와 검증이 충분한가: 20점

Codex가 만든 결과가 실제로 동작하고, 실패를 숨기지 않고, PR/review 기준까지 포함하는지 평가합니다.

점수 기준:

- 0-5: 완료 보고가 주관적이고 검증 명령이 없습니다.
- 6-10: 기본 check는 있지만 실제 stack이나 PR review와 연결이 약합니다.
- 11-15: 대부분의 작업에 verification과 report format이 있습니다.
- 16-20: 구현, self-heal, review, review 반영, 최종 보고까지 닫힌 루프가 있습니다.

확인할 파일:

- `scripts/doctor`
- project `Makefile`
- `docs/workflows/async-workflow.md`
- `prompts/async-task.md`

### 5. Skills, rules, environment 운영 준비도가 충분한가: 20점

공식 Codex skill 구조, rules, cloud/GitHub 환경과 하네스가 얼마나 잘 맞는지 평가합니다.

점수 기준:

- 0-5: skill/rule/environment 기준이 문서화되어 있지 않습니다.
- 6-10: 개념은 있지만 공식 구조와 연결이 약합니다.
- 11-15: skill source, repo-local exposure, local install, async workflow가 구분됩니다.
- 16-20: 공식 구조에 맞는 skill package, command approval rules, GitHub/cloud task 운영, evaluation loop가 실제로 작동합니다.

확인할 파일:

- `docs/skills/skill-guide.md`
- `docs/governance/rules-and-skills.md`
- `docs/operations/environment.md`
- `docs/operations/github.md`

## 평가 절차

1. `AGENTS.md`, `README.md`, `projects/registry.md`를 읽습니다.
2. `docs/governance/governance.md`, `docs/governance/context-map.md`, 이 문서를 읽습니다.
3. 평가 대상에 따라 relevant `docs/`, `prompts/`, `skills/`, `templates/`, `scripts/`를 읽습니다.
4. 필요한 경우 OpenAI 공식 Codex 문서를 다시 확인합니다.
5. 각 항목을 20점 만점으로 채점합니다.
6. 점수마다 evidence와 risk를 1-3개씩 남깁니다.
7. 점수를 올리기 위한 next action을 우선순위 순서로 제안합니다.
8. 하네스 파일을 바꿨다면 `./scripts/doctor`를 실행합니다.

## 평가 Output Format

```text
Evaluation date:
Scope:
Official docs checked:

Score:
- Human understandability: __/20
- AI executability: __/20
- Repeatability and consistency: __/20
- Output quality and verification: __/20
- Skills, rules, environment readiness: __/20
- Total: __/100

Decision:
- ready / usable with gaps / not ready

Evidence:
- ...

Top risks:
- ...

Highest leverage improvements:
1. ...
2. ...
3. ...

Verification:
- ...
```
