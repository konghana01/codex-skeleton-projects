# Skill Review 프롬프트

repo에서 관리하는 `skills/<skill-name>/` package를 검토할 때 사용합니다.

```text
다음 Codex skill package를 review해줘.

Skill path:
- skills/<skill-name>/

Context to read first:
- AGENTS.md
- docs/governance/governance.md
- docs/governance/rules-and-skills.md
- docs/skills/package-contract.md
- docs/skills/codex-skill-guidelines.md
- docs/skills/skill-authoring.md
- docs/skills/skill-lifecycle.md
- skills/<skill-name>/SKILL.md
- skills/<skill-name>/agents/openai.yaml, if present

Focus:
- trigger description이 충분히 구체적인가?
- `description`만 읽고 trigger/non-trigger 판단이 가능한가?
- non-trigger나 boundary가 필요한 만큼 명확한가?
- SKILL.md가 절차 중심이고 concise한가?
- references/scripts/assets가 package 안에 응집되어 있는가?
- root AGENTS.md나 governance 문서와 충돌하지 않는가?
- validation이 재현 가능한가?
- 이 skill이 정말 skill이어야 하는가, prompt/docs/rule로 충분하지 않은가?
- `.agents/skills/`, `.claude/skills/` 또는 install 위치에 노출된 copy가 있다면 source와 동기화가 필요한가?

Constraints:
- review가 목적이다. 요청하지 않았다면 rewrite하지 마.
- finding은 file/line reference를 포함해줘.
- trigger 품질과 lifecycle 적합성을 code style보다 우선해줘.

Verification context:
- Validation run:
- Scripts tested:
- Forward-test run:
- Trigger test table:

Output:
- Review decision: approve / request changes / demote
- Findings:
- Required changes:
- Suggested validation:
- Demotion target, if skill is not justified:
```
