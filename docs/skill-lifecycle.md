# Skill Lifecycle

이 문서는 Side Harness에서 Codex skill을 엄격하게 관리하기 위한 생명주기를 정의합니다. skill은 꼭 필요할 때만 만들고, 하나의 package 안에 관련 instruction, reference, script, asset을 응집시킵니다.

## 관리 위치

하네스에서 관리하는 skill source는 repo 안의 `skills/<skill-name>/`에 둡니다.

```text
skills/
  skill-name/
    SKILL.md
    agents/
      openai.yaml
    references/
    scripts/
    assets/
```

`$CODEX_HOME/skills` 또는 `~/.codex/skills`는 설치 위치입니다. repo의 `skills/`는 source of truth이고, 설치 위치는 실행을 위한 배포 결과로 봅니다.

## 생성 조건

다음 조건을 모두 만족할 때만 skill을 만듭니다.

- 같은 workflow가 여러 프로젝트에서 반복됩니다.
- prompt만으로는 품질이 흔들립니다.
- 구체적인 trigger 예시와 non-trigger 예시가 있습니다.
- skill package 안에 모아둘 reference, script, asset 중 하나 이상이 실제로 유용합니다.
- validation 방법이 있습니다.

조건을 만족하지 않으면 `AGENTS.md`, `docs/`, `prompts/` 중 더 낮은 비용의 계층을 사용합니다.

## Package 기준

skill package는 자기 안에서 응집되어야 합니다.

- `SKILL.md`: trigger와 실행 절차
- `references/`: 길거나 조건부로 필요한 상세 문서
- `scripts/`: deterministic repeated operation
- `assets/`: output에 복사하거나 사용할 template, image, font, sample data
- `agents/openai.yaml`: UI metadata, 필요할 때만

skill package 밖의 문서를 깊게 참조하지 않습니다. 하네스 전체 원칙은 `docs/`에 두되, skill 실행에 필요한 구체 지식은 package 내부에 둡니다.

## 생성 절차

1. `prompts/create-skill.md`를 사용합니다.
2. `/skill-creator`를 기준으로 skill을 초기화합니다.
3. source 위치는 기본적으로 `skills/<skill-name>/`를 사용합니다.
4. `SKILL.md`의 `description`에 trigger 조건을 구체적으로 씁니다.
5. 필요한 resource만 추가합니다.
6. placeholder를 제거합니다.
7. validator를 실행합니다.

검증 명령:

```bash
python3 "${CODEX_HOME:-$HOME/.codex}/skills/.system/skill-creator/scripts/quick_validate.py" skills/<skill-name>
```

## 변경 절차

skill을 수정할 때는 다음을 확인합니다.

- trigger가 너무 넓어지지 않았는가?
- root `AGENTS.md`나 governance 문서와 충돌하지 않는가?
- reference가 `SKILL.md`와 중복되지 않는가?
- script를 바꿨다면 대표 경로를 실행했는가?
- `agents/openai.yaml`이 `SKILL.md`와 맞는가?

## Review 기준

skill review는 code review와 다르게 trigger 품질을 우선합니다.

반복 review에는 `prompts/skill-review.md`를 사용합니다.

확인할 것:

- 이 skill이 언제 사용되어야 하는지 명확한가?
- 사용하지 말아야 할 경우가 필요한 만큼 명시되어 있는가?
- skill 본문이 절차 중심인가?
- reference/script/asset이 package 안에 응집되어 있는가?
- validation이 재현 가능한가?

## 폐기 기준

다음 중 하나에 해당하면 skill을 폐기하거나 prompt/docs로 낮춥니다.

- 한 프로젝트에서만 쓰입니다.
- trigger가 모호해서 잘못 호출됩니다.
- 유지 비용이 반복 이득보다 큽니다.
- `SKILL.md`가 단순 prompt와 다르지 않습니다.
- resource가 없고 절차도 짧습니다.

폐기할 때는 해당 workflow가 이동한 위치를 `docs/rules-and-skills.md` 또는 관련 prompt에 남깁니다.
