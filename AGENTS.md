# Halucy Agent Startup

This file is a startup contract for agents working in this repository. It is
not the canonical project context or a separate policy source.

## Workspace Policy Inheritance

This repo lives under `/Users/byung/agent-workspace` and inherits the workspace
startup contract at `/Users/byung/agent-workspace/AGENTS.md`.

Before implementation, repo structure changes, build/test workflow changes, or
multi-file code edits, follow the workspace Codex execution model: scope the
work, protect existing changes, run deterministic verification, and report
changed files, commands, results, failures, and decisions needed.

If Halucy-specific rules conflict with workspace policy, follow the stricter
rule.

## Read First

For execution work, read:

1. the active Work Package for the task
2. the relevant `agents/profiles/*.yaml`
3. artifacts referenced by the Work Package

Do not read all foundation documents by default.

Read `CONTEXT.md` only when terminology, Learning Cards, agent roles, durable
context, or learning authority matters.

Read `HALUCY_FOUNDATION.md` only when phase plan, architecture, source-of-truth,
role-boundary, or project-direction decisions matter.

If instructions conflict, treat `HALUCY_FOUNDATION.md` as the first document to
update, then propagate the decision into the more specific document.

## Core Rules

- Halucy is an AI-native indie game production project.
- Do not start implementation work without a Work Package.
- Stay inside approved targets and forbidden-change boundaries.
- Keep Implementation and QA separate.
- Surface Human Creative Owner decisions explicitly.
- Do not promote Canonical or Policy Learning Cards without human approval.
- Verify before claiming pass, completion, migration, or phase closure.
