---
name: project-startup
description: Use when a newly created or cloned managed project needs its README, AGENTS, notes, checks, environment, or registry aligned to the project purpose; do not use for routine feature work.
---

# Project Startup

## Overview

A new project becomes useful only after its purpose, first milestone, checks, and durable notes are aligned. This skill keeps that startup pass short and consistent.

## When To Use

- a project was just created with `scripts/new-project`
- a project was cloned and needs its startup files normalized
- `README.md`, `AGENTS.md`, `notes/`, `Makefile`, `.env.example`, or the project registry are still generic

## When Not To Use

- the task is feature implementation inside an already-stable project
- only one local preference or one-off note needs to change
- the project already has a clear purpose, first milestone, and check command

## Workflow

1. Read the project `README.md`, `AGENTS.md`, `notes/decisions.md`, and `notes/todos.md`.
2. Read `prompts/start-project.md` and `docs/workflows/project-start.md`.
3. Keep the project goal, non-goals, first milestone, commands, and environment explicit.
4. Update only durable files:
   - `README.md`
   - `AGENTS.md`
   - `notes/decisions.md`
   - `notes/todos.md`
   - `notes/bugs.md` only when needed
   - `.env.example` only when needed
   - `Makefile` only when a real check exists
   - `projects/registry.md` only for managed projects
5. Keep the first useful outcome narrow and the checks real.

## Validation

- Run `make check` when the project has a real check.
- If a check is missing, record the next check to add.
- Do not add extra docs or resource files unless they solve a repeatable problem.
