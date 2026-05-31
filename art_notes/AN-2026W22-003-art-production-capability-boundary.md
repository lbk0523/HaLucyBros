# AN-2026W22-003: Art Production Capability Boundary

## Purpose

Phase 3A fixes the boundary for Art Production Capability Validation before any
asset production begins.

This note prepares the Art Agent to use real tool workflows for
prototype-grade asset candidates. It does not generate images, select final art
direction, create a style bible, import sprites, mutate Godot files, or approve
production asset use.

## Inputs

- Phase roadmap: `HALUCY_FOUNDATION.md`
- Korean implementation roadmap: `Halucy Codex 구현 계획.md`
- Phase 2 closeout: `PHASE2_CLOSEOUT.md`
- Phase 2 game brief: `context/game_brief.md`
- Phase 2 readability manifest: `art_notes/AN-2026W22-002-platformer-greybox-readability.md`
- Art profile: `agents/profiles/art_agent.yaml`

## Phase 3A Question

Can the Art Agent prepare a bounded tool-use workflow so Phase 3 can later
produce reviewable prototype-grade art candidates and hand them through BK/Human
Creative Owner review and Implementation planning without expanding gameplay
scope?

Phase 3A passes only if the next Art Agent execution slice can proceed from a
fixed candidate slice, explicit allowed tools, required manifest fields, owner
review gate, and implementation handoff boundary.

## Candidate Slice

Use the Phase 2 platformer greybox as the source slice. The Phase 3 asset
candidate set is limited to visual replacement candidates for existing greybox
roles:

- player character visual candidate: one or two options
- floor/platform tile or surface candidate: one small set
- obstacle/blocker visual candidate: one option
- goal marker candidate: one option
- optional timer/HUD treatment candidate: one option

The candidate set must preserve the Phase 2 gameplay assumptions:

- left-to-right route
- visible right-side goal
- existing grounded single-jump platformer movement
- no new collision rule
- no new movement verb
- no new scoring, enemy, item, camera, or level-system requirement

## Allowed Tool Workflows

Allowed workflows for the later Phase 3 art-production slice:

- image generation or image editing for prototype-grade candidate visuals
- computer use to operate a visual tool when the workflow needs GUI interaction
- MCP-backed search, repository, design, or asset tooling when available and
  relevant
- asset review tooling for resolution, file format, visual consistency, or
  manifest completeness checks
- Codex structuring for prompt records, asset manifests, risk notes, and
  handoff summaries

Every real tool workflow must record evidence:

- tool or model name when known
- input prompt, search query, uploaded source, or acquisition path
- output file path or stable candidate reference
- whether the asset was generated, edited, found, or manually assembled
- usage and license or rights note
- known uncertainty that must block production use

Allowed tool use in Phase 3 does not mean the chosen tool becomes canonical.
Phase 3 validates capability and handoff quality, not a permanent art pipeline.

## Required Asset Manifest Fields

Every later asset candidate must have a manifest entry with these fields:

- candidate_id
- role: player, floor_platform, obstacle, goal_marker, or timer_hud
- file_path or stable reference
- preview_path when different from file_path
- source_type: generated, edited, found, hand_drawn, or composite
- source_tool_or_service
- prompt_or_acquisition_path
- generation_or_edit_parameters when known
- usage_scope: prototype_only unless BK explicitly approves otherwise
- license_or_rights_note
- attribution_required
- rights_risk: low, medium, high, or unknown
- editability: layered, flat_raster, vector, prompt_only, or unknown
- format
- resolution
- transparency
- color/readability notes
- animation_expectation: static only unless separately approved
- Godot import risk
- gameplay_scope_risk
- owner_review_status: pending, approved_for_prototype, redirect, or rejected
- implementation_handoff_note

If license or rights risk is unknown, the candidate may be reviewed as a visual
direction reference but must not be approved for committed prototype use.

## Owner Review Gate

BK/Human Creative Owner must review the Phase 3 candidate set before
Implementation treats any visual candidate as approved input.

The owner review must choose one of:

- approve for prototype use
- redirect with specific changes
- reject

The review must also state:

- which candidate roles are approved, redirected, or rejected
- whether the approval is prototype-only
- whether any license, brand, or taste risk blocks use
- whether the candidate changes concept positioning
- whether another Art Agent iteration is needed before Implementation planning

Owner approval in Phase 3 does not approve final art direction, production art,
style bible, launch positioning, or market validation.

## Implementation Handoff Boundary

Implementation handoff in Phase 3 is limited to integration assessment unless a
separate Work Package authorizes Godot mutation.

The Implementation Agent may later judge:

- which scene or node would receive the candidate asset
- expected import path
- required format conversion
- whether visual bounds can match existing collision bounds
- whether the candidate preserves route readability
- whether any candidate implies forbidden gameplay scope

The Implementation Agent may not:

- change Godot scenes or scripts without a later implementation Work Package
- add new movement verbs
- change collision rules
- add animation systems
- add enemies, items, scoring, camera polish, or new UI systems
- treat art approval as gameplay approval

## QA And Review Boundary

QA or review should check the asset candidate package before owner approval and
again before implementation planning.

Minimum checks:

- every candidate has a manifest entry
- every manifest entry has source/tool and prompt or acquisition evidence
- usage scope and license or rights risk are explicit
- file paths or stable references resolve
- candidate roles match the allowed candidate slice
- no generated or imported asset claims production readiness
- no candidate requires gameplay expansion

## Learning Capture Boundary

Learning capture is allowed only for one reusable lesson at a time.

Good Candidate Learning Card triggers:

- a tool workflow repeatedly produces usable prototype candidates
- a manifest field prevents an implementation or license mistake
- owner review reveals a repeatable handoff gap
- a tool-use failure produces a reusable constraint for future art slices

Do not turn raw prompts, full logs, or taste preferences into Learning Cards.

## Excluded Scope

Phase 3A excludes:

- image generation execution
- asset production
- imported sprites
- final art direction
- style bible
- full asset pack
- production-ready asset approval
- Godot mutation
- gameplay feature expansion
- movement verb additions
- enemy, item, scoring, camera, web export, or release work
- external tester workflow
- platform launch feedback
- market or audience validation
- Learning Card promotion beyond Candidate

## Stop Conditions

Stop and return to planning if any of these occur:

- asset production or image generation becomes necessary inside Phase 3A
- a final style, character identity, worldbuilding direction, or style bible
  decision is required
- license or rights risk is unknown but someone tries to approve prototype use
- Implementation handoff requires Godot edits before a later Work Package
- a candidate implies new movement, collision, enemy, item, score, camera, or UI
  systems
- owner review would be skipped or collapsed into Art Agent self-approval
- external feedback or release/platform decisions enter the Phase 3A scope

## Phase 3B Handoff

If this boundary is accepted, the next executable slice is Phase 3B Art Agent
tool execution:

- produce the bounded prototype-grade candidate set
- record real tool workflow evidence
- create an asset manifest with the required fields
- prepare an owner-facing candidate report
- stop before Godot implementation
