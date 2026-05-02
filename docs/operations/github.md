# GitHub 운영

이 하네스는 GitHub에 올려서 버전 관리하는 편이 좋습니다. 특히 프로젝트를 하나씩 clone해서 사용할 계획이라면, 하네스와 생성 프로젝트를 같은 Git repo에 섞지 않는 것이 안전합니다.

## 권장 구조

- `side-harness` 자체는 하나의 GitHub repo로 관리합니다.
- 생성된 각 side project는 별도의 GitHub repo로 관리합니다.
- `projects/registry.md`에는 프로젝트 상태, local path, GitHub URL, 다음 작업을 기록합니다.
- 하네스 repo에는 템플릿, 프롬프트, 문서, script만 commit합니다.
- 생성된 `projects/<name>/` 디렉토리는 기본적으로 하네스 repo에 commit하지 않습니다.

## 이유

- 프로젝트마다 release, issue, secret, dependency, 배포 방식이 달라질 수 있습니다.
- 하네스는 여러 프로젝트의 시작 품질을 관리하는 도구이고, 개별 프로젝트의 product code와 수명이 다릅니다.
- 별도 repo로 두면 clone, archive, 공개 전환, 배포 연동이 단순합니다.

## 하네스 Repo 생성

처음 한 번만 하네스 root에서 실행합니다.

```bash
git init -b main
git add .
git commit -m "Initialize side harness"
```

GitHub CLI를 쓴다면:

```bash
gh repo create side-harness --private --source . --remote origin --push
```

이미 GitHub에서 repo를 만들었다면:

```bash
git remote add origin git@github.com:<owner>/side-harness.git
git push -u origin main
```

## 생성 프로젝트 Repo 생성

프로젝트를 만든 뒤 startup pass를 먼저 실행합니다.

```bash
./scripts/new-project my-idea
```

그다음 Codex에게 `prompts/start-project.md`를 사용해 목적 기반 정리를 맡깁니다.

프로젝트 디렉토리에서 별도 repo를 시작합니다.

```bash
cd projects/my-idea
git init -b main
git add .
git commit -m "Initialize my-idea"
```

GitHub CLI를 쓴다면:

```bash
gh repo create my-idea --private --source . --remote origin --push
```

생성된 repo URL은 `projects/registry.md`의 `GitHub` 컬럼에 기록합니다.

## 공개 범위

기본은 private repo를 권장합니다. 프로젝트가 공개되어도 되는 상태가 되었을 때 public으로 전환합니다.

`.env`는 절대 commit하지 않습니다. 공유 가능한 예시는 `.env.example`에만 둡니다.

## 비동기 작업과 PR

비동기 기능 개발은 GitHub issue와 PR을 기준으로 운영합니다.

- 사용자 요청은 issue 또는 task note로 정리합니다.
- 구현은 branch에서 진행합니다.
- 검증 가능한 상태가 되면 PR을 생성합니다.
- 리뷰 에이전트는 PR diff를 기준으로 finding을 남깁니다.
- finding 반영 후 PR ready 상태를 최종 작업 결과로 봅니다.
