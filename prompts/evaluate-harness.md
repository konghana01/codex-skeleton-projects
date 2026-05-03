# Harness 평가 프롬프트

Side Harness의 rules, skills, prompts, environment가 Codex 공식 기준에 비춰 얼마나 잘 구성되었는지 정량 평가할 때 사용합니다.

```text
Side Harness를 정량 평가해줘.

Evaluation scope:
- rules
- skills
- prompts
- environment
- generated project template
- async workflow, if relevant

Context to read first:
- AGENTS.md
- README.md
- projects/registry.md
- docs/README.md
- docs/governance/governance.md
- docs/governance/context-map.md
- docs/governance/documentation.md
- docs/governance/improvement-loop.md
- docs/governance/improvement-history.md
- docs/evaluation/rubric.md
- docs/governance/rules-and-skills.md
- docs/skills/skill-guide.md
- docs/operations/environment.md
- docs/workflows/async-workflow.md, 비동기 작업 평가가 포함된다면
- templates/<template>/AGENTS.md, 생성 프로젝트 품질을 평가한다면
- relevant prompts/*.md

Official docs to check when current behavior matters:
- https://developers.openai.com/codex/skills
- https://developers.openai.com/codex/rules
- https://developers.openai.com/codex/guides/agents-md
- https://developers.openai.com/codex/cloud/environments
- https://developers.openai.com/codex/integrations/github
- https://developers.openai.com/api/docs/guides/evaluation-getting-started

Scoring:
- docs/evaluation/rubric.md의 100점 모델을 사용해줘.
- 각 항목은 20점 만점으로 채점해줘.
- 점수마다 evidence, risk, next action을 붙여줘.
- 사람이 보기 이해 가능한가, AI가 실행하기 명확한가, 반복 작업의 균일성이 있는가, 결과물 퀄리티와 검증이 충분한가, skill/rule/environment 운영 준비도가 있는가를 반드시 평가해줘.

Constraints:
- 점수는 후하게 주지 말고 evidence가 있는 만큼만 줘.
- 공식 문서와 repo 구조가 어긋나는 부분은 명확히 지적해줘.
- 평가만 요청받았다면 파일을 수정하지 마.
- 개선까지 요청받았다면 가장 점수 상승이 큰 항목부터 수정해줘.
- 하네스 파일을 수정했다면 `./scripts/doctor`를 실행해줘.

Output:
- Evaluation date
- Scope
- Official docs checked
- Score table
- Total score and decision: ready / usable with gaps / not ready
- Evidence
- Top risks
- Highest leverage improvements
- Verification, if files changed
```
