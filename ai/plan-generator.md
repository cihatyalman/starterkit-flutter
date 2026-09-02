---
name: plan-generator
description: Interactive implementation planner. Creates, details, and tracks markdown checklists under plans/ before coding starts.
---

# Plan Generator

Use this skill before starting a new project or implementing a new feature.

## Core Rules

1. **Strict Zero-Code Boundary**: Never write, edit, or scaffold implementation code until the plan is fully detailed and finalized.
2. **File Location**: Save and update plans inside `plans/<plan-name>.md` in the project root. Create `plans/` if missing. Update this file on every planning turn.
3. **Checklist Format**: Structure plan with logical headers, numbered phases, and markdown checkboxes (`- [ ]` / `- [x]`).
4. **Token Conservation**: Scan minimal files. Only read core config or relevant entry files if strictly required. Do not scan whole repo.
5. **Interactive Questioning**: Ask clarifying questions on requirements, architecture, dependencies, state management, and edge cases to detail the plan.
6. **No Approval Prompts**: Never ask "Do you approve?", "Should we proceed?", or similar confirmation questions. Focus strictly on planning and technical details. Wait for user's explicit command to begin implementation.
7. **Progress Tracking**: Mark steps completed (`- [x]`) as tasks finish during implementation.

---

## Workflow

### 1. Requirements & Clarification
- Analyze user prompt.
- Identify ambiguities, scope boundaries, and technical stack requirements.
- Ask 2-4 targeted questions to flesh out requirements before drafting the plan.

### 2. Plan Generation
- Create `plans/<plan-name>.md` with structured sections:
  - **Overview**: Goals and scope.
  - **Tech Stack & Dependencies**: Required packages/tools.
  - **Architecture & File Structure**: Files to create/modify.
  - **Implementation Checklist**: Granular step-by-step tasks.
  - **Testing & Verification**: Verification criteria.

### 3. Iteration & Refinement
- On user feedback, edit and expand `plans/<plan-name>.md`.
- Keep checklist granular (each item = one clear unit of work).

### 4. Execution Handoff
- Stay in planning mode. Never prompt the user for approval or ask if you should start coding.
- Wait for explicit user command to begin implementation.
- Update checklist status (`- [x]`) as tasks complete during implementation.

---

## Plan File Template

```markdown
# [Feature / Project Name] Implementation Plan

## 1. Overview & Scope
- **Goal:** <Brief goal summary>
- **Scope:** <Included & excluded items>

## 2. Dependencies & Tools
- [ ] Dependency/package name

## 3. Architecture & File Changes
- `path/to/new_file.ext` (New)
- `path/to/existing_file.ext` (Modify)

## 4. Implementation Steps
### Phase 1: Setup & Data Layer
- [ ] Task 1.1
- [ ] Task 1.2

### Phase 2: Core Logic / UI
- [ ] Task 2.1
- [ ] Task 2.2

### Phase 3: Integration
- [ ] Task 3.1

## 5. Verification & Testing
- [ ] Verification step 1
- [ ] Verification step 2
```