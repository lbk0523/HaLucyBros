# Halucy Context

Halucy is an AI-native indie game production project. This context captures the project language before implementation and operating documents are rewritten.

## Language

**Halucy**:
An AI-native project for making indie games by organizing AI agents and optimizing existing agent-platform and open-source references for Halucy's production loop.
_Avoid_: AI agent platform, hypercasual-only studio

**Agent Platform**:
An external or existing AI-agent work environment used to help produce games.
_Avoid_: Halucy product, platform to build first

**Open-Source Reference Project**:
An external project studied for patterns, architecture, workflow, or governance that Halucy may adapt without treating it as the product.
_Avoid_: Product to clone, mandatory dependency

**Agent Organization**:
The explicit division of AI-agent roles, responsibilities, handoffs, review gates, memory artifacts, and learning capture for making a game.
_Avoid_: Autonomous company, hidden chat workflow

**Research Agent**:
An AI role that performs market, reference, pre-production, launch-channel, and post-launch signal research.
_Avoid_: Market oracle, code implementer

**Art Agent**:
An AI role that creates, reviews, modifies, and organizes visual direction and art resources through external tools or integrations.
_Avoid_: Final art director, code implementer

**Implementation Agent**:
An AI role that implements the playable prototype in Godot and owns local technical structure within the approved Work Package.
_Avoid_: Product architect for unapproved scope

**QA Agent**:
An AI role that independently reviews implementation outputs, playability, bugs, onboarding, and feel without reviewing its own work.
_Avoid_: Self-review by the implementation agent

**Learning Librarian Agent**:
An AI role that creates Learning Card candidates, detects duplicates, links evidence, and suggests status changes without final Canonical or Policy authority.
_Avoid_: Unchecked memory authority

**Human Creative Owner**:
The human authority for creative direction, product direction, final concept choices, and Canonical or Policy-level judgment.
_Avoid_: AI-owned creative authority

**Core Learning Asset**:
A reusable lesson from agent work or game production that should influence future Halucy decisions.
_Avoid_: Raw chat log, disposable task note

**Non-Learning Record**:
A record that may be useful for immediate traceability but should not be promoted into durable decision context.
_Avoid_: Core learning, reusable lesson

**Durable Context**:
Project memory that remains usable through extended work, tool changes, or many months of operation.
_Avoid_: Chat history, unstated human memory

**Learning Capture**:
The act of turning agent work, decisions, failures, and feedback into durable reusable context.
_Avoid_: Transcript dumping, archive hoarding

**Learning Capture Gate**:
A production moment where Halucy checks whether a reusable lesson should become a Learning Card.
_Avoid_: Continuous documentation, every-task ritual

**Learning Card**:
A single durable record containing one reusable lesson for future Halucy work.
_Avoid_: Long report, mixed lesson dump

**Learning Card Status**:
The authority level of a Learning Card inside Halucy's durable context.
_Avoid_: Binary approved/unapproved memory

**Candidate Learning Card**:
A low-authority learning candidate created by an agent or human that is searchable but not trusted as a default decision rule.
_Avoid_: Canonical memory

**Working Learning Card**:
A provisional learning card that has enough support to guide work but can still be overturned easily.
_Avoid_: Policy, final doctrine

**Canonical Learning Card**:
A high-authority learning card that future agents may use as default context for similar decisions.
_Avoid_: Casual note, unreviewed assumption

**Policy Learning Card**:
A learning card that changes or creates an operating rule for Halucy.
_Avoid_: Agent-made policy change

**Learning Card Promotion**:
The act of raising a Learning Card to a higher authority status based on evidence and review rules.
_Avoid_: Silent memory overwrite

**Learning Card Store**:
The root `learning_cards/` repository area where completed Learning Cards live by status.
_Avoid_: Draft inbox, session log folder

**Learning Card Template**:
The required format for writing completed Learning Cards.
_Avoid_: Free-form report, chat summary

**Concept Learning Card**:
A **Learning Card** about why a game concept hypothesis survived, changed, or failed.
_Avoid_: Concept pitch

**Production Learning Card**:
A **Learning Card** about what worked or failed in agent organization, handoff, review, or production flow.
_Avoid_: Status report

**Technical Learning Card**:
A **Learning Card** about a reusable Godot, build, tooling, or code-structure pattern.
_Avoid_: Code diff summary

**Market Learning Card**:
A **Learning Card** about genre, community, feedback channel, positioning, or audience response.
_Avoid_: Market trivia

**Failure Learning Card**:
A **Learning Card** about a failure cause Halucy should avoid repeating.
_Avoid_: Blame note

**Prompt Learning Card**:
A **Learning Card** about an effective prompt, handoff, checklist, or agent instruction pattern.
_Avoid_: Raw prompt archive

**Learning Automation**:
A later-stage workflow that captures and routes learning assets automatically after the manual version has proven valuable.
_Avoid_: Automatic strategic decision, premature automation

**Indie Game Production Loop**:
The repeatable path from opportunity research to playable prototype, feedback, decision, and reusable learning.
_Avoid_: Organization OS for its own sake

**Opportunity Space**:
An evidence-backed family of game concepts worth testing for a small AI-assisted team.
_Avoid_: Genre preference, brainstorm bucket

**Playable Prototype**:
A small build that tests whether a game concept has a real player-facing hook.
_Avoid_: Final product, technical demo only

**Initial Validation**:
A phase-gated test of whether organized AI agents can produce a playable indie game prototype with enough evidence to judge the production loop.
_Avoid_: Commercial launch, agent-platform buildout

## Relationships

- **Halucy** studies **Open-Source Reference Projects** and uses one or more **Agent Platforms** to run the **Indie Game Production Loop**.
- **Agent Organization** defines how AI agents participate in the **Indie Game Production Loop** and how their work becomes **Core Learning Assets**.
- The initial **Agent Organization** uses **Research Agent**, **Art Agent**, **Implementation Agent**, **QA Agent**, and **Learning Librarian Agent** to actually produce the prototype.
- **Human Creative Owner** keeps final creative, product, Canonical, and Policy authority.
- **Learning Capture** turns agent work into **Learning Cards** that become **Durable Context**.
- **Learning Capture** occurs at explicit **Learning Capture Gates**, not after every small task.
- A **Learning Card** should contain exactly one reusable lesson.
- Every **Learning Card** has a **Learning Card Status**: **Candidate Learning Card**, **Working Learning Card**, **Canonical Learning Card**, or **Policy Learning Card**.
- **Learning Card Promotion** moves cards from `Candidate` to `Working`, `Working` to `Canonical`, or `Canonical` to `Policy`.
- Completed **Learning Cards** live in the **Learning Card Store**.
- Each completed **Learning Card** must follow the **Learning Card Template**.
- A **Non-Learning Record** may support traceability but should not pollute **Durable Context**.
- **Learning Automation** should automate proven **Learning Capture** workflows, not replace human judgment before the loop is understood.
- An **Opportunity Space** produces one or more candidate game concepts.
- A candidate game concept becomes a **Playable Prototype** only when it has a specific testable hook.
- **Initial Validation** succeeds only if **Agent Organization** produces a **Playable Prototype** through phase gates and leaves evidence for judging the loop.
- A **Playable Prototype** produces feedback and learning for the next loop.

## Example Dialogue

> **Dev:** "Should we fork an agent platform before choosing the first game?"
> **Domain expert:** "No. **Halucy** studies **Open-Source Reference Projects** and uses **Agent Platforms** to organize production; the platform is not the product."
>
> **Dev:** "Should every agent transcript become project memory?"
> **Domain expert:** "No. Only work that changes future decisions becomes a **Core Learning Asset** in **Durable Context**."
>
> **Dev:** "The agent changed ten files. Is that a learning asset?"
> **Domain expert:** "Not by itself. It becomes a **Core Learning Asset** only if it teaches a reusable pattern, boundary, failure mode, or decision rule."
>
> **Dev:** "Can one learning note cover the concept, market response, and Godot tooling issue?"
> **Domain expert:** "No. Split it into separate **Learning Cards** so each card carries one reusable lesson."
>
> **Dev:** "Where should finished learning cards go?"
> **Domain expert:** "Put completed cards in the **Learning Card Store** under `learning_cards/`, grouped by card status."
>
> **Dev:** "Can I write a free-form lesson summary?"
> **Domain expert:** "Only as a draft. Completed cards must follow the **Learning Card Template** so future agents can reuse them."
>
> **Dev:** "Should every completed task create a learning card?"
> **Domain expert:** "No. Check for learning only at **Learning Capture Gates** unless a major failure happens."
>
> **Dev:** "Can agents create learning cards without human approval?"
> **Domain expert:** "Yes, as **Candidate Learning Cards** or **Working Learning Cards**. **Canonical Learning Cards** and **Policy Learning Cards** require stricter promotion rules."
>
> **Dev:** "Can an agent promote a lesson into policy?"
> **Domain expert:** "No. **Policy Learning Cards** change operating rules and require human approval."
>
> **Dev:** "Do we only define agent roles, or do we use them to build the prototype?"
> **Domain expert:** "Use them to build the prototype. The initial split is a working production structure, not an org chart."

## Flagged Ambiguities

- Existing draft documents describe Halucy as a hypercasual experiment factory. Resolved: Halucy is an AI-native indie game production project and is not limited to hypercasual.
- "Agent platform" was used as both a possible product and a tool. Resolved: an **Agent Platform** is a tool Halucy uses, not the thing Halucy is trying to build first.
- "Use existing AI agent platforms" was too passive. Resolved: Halucy optimizes agent-platform and open-source references into its own **Agent Organization** and production loop.
- "Learning" can mean raw logs, summaries, decisions, or reusable knowledge. Resolved: only reusable lessons that should affect future decisions are **Core Learning Assets**.

## Initial Agent Profiles

The initial validation uses these AI profiles in real prototype production:

- **Research Agent**: produces market research, reference packs, pre-production inputs, launch-channel notes, and post-launch signal reports.
- **Art Agent**: produces style direction, art resource candidates, asset prompts, visual reviews, and asset manifests.
- **Implementation Agent**: implements Godot scenes, scripts, build flow, and technical changes inside approved Work Packages.
- **QA Agent**: independently reviews Implementation Agent output, playability, bugs, onboarding, and feel.
- **Learning Librarian Agent**: creates Learning Card candidates, detects duplicates, links evidence, and suggests status changes.
- **Human Creative Owner**: makes final creative and product decisions.

These profiles are used to make the prototype. They are coordinated through Work Packages and artifact handoffs, not through an automatic multi-agent runtime at the start.

## Core Learning Asset Criteria

A record qualifies as a **Core Learning Asset** when it would help Halucy make a better future decision in one of these areas:

- game concept hypothesis and falsification result: **Concept Learning Card**
- boundary between work that agents can own and work humans must own: **Production Learning Card**
- reusable Godot, build, tooling, or code-structure pattern: **Technical Learning Card**
- repeated signal from player or external feedback: **Market Learning Card**
- genre, market, or community validation channel learning: **Market Learning Card**
- cause of a failed production loop: **Failure Learning Card**
- effective prompt, handoff, checklist, or review pattern: **Prompt Learning Card**

A record should remain a **Non-Learning Record** when it is only:

- a raw transcript
- a routine task log
- an isolated opinion
- a one-off TODO
- a code change list without a reusable lesson
- an idea with no testable decision impact

## Learning Card Store

Completed Learning Cards live at:

```text
learning_cards/
  candidate/
  working/
  canonical/
  policy/
```

Card type is a required field on each card: `concept`, `production`, `technical`, `market`, `failure`, or `prompt`.

Drafts, raw logs, and session transcripts should not be stored here unless they have been promoted into a completed **Learning Card**.

## Learning Card Template

The required template lives at:

```text
templates/learning-card.md
```

The most important field is `Reuse Rule`. A note without a reuse rule is not a completed **Learning Card**.

## Learning Card Status

Learning Card authority levels:

- `Candidate`: searchable low-authority learning candidate.
- `Working`: provisional learning that can guide current work but remains easy to overturn.
- `Canonical`: high-authority learning future agents may use as default context.
- `Policy`: learning that changes an operating rule.

Humans should not manually approve every **Candidate Learning Card**. Long-term operation depends on agents creating and organizing low-authority learning while humans focus on promotion rules, high-impact reviews, and policy changes.

## Learning Card Promotion Rules

`Candidate -> Working` may be done by an agent review when:

- the same lesson appears in two or more independent sources, or
- evidence inside one prototype is clear enough to guide current work.

`Working -> Canonical` requires human approval or a later-defined strong review protocol when:

- the lesson has been reused in at least two production loops, or
- the lesson prevented a major failure, or
- the lesson is repeatedly needed by future agents as default context.

`Canonical -> Policy` always requires human approval because it changes an operating rule, prohibition, or default process.

During initial validation, do not create automatic promotion rules. Observe the manual pattern first.

## Learning Capture Gates

During initial validation, Learning Capture happens at these gates:

- `Concept Selection`: capture why candidates were selected or rejected.
- `Prototype Vertical Slice`: capture reusable agent-organization, Godot, or tooling lessons.
- `First External Feedback`: capture repeated player, community, or positioning signals.
- `Major Failure / Scope Cut`: capture causes that should not repeat.
- `Production Retrospective`: capture reusable agent roles, prompts, handoffs, and review patterns.

Do not require a Learning Card after every routine task.
