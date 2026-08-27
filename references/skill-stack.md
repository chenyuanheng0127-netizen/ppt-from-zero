# Skill Stack and Responsibilities

This reference records the non-competing Skill roles used by the from-zero workflow. Read it when the deck needs the corresponding capability, and announce the selected stack to the user before authoring.

## Core builders

### `ppt-master`

Use for PPT Master requests and for generated editable PPTX output when available.

Owns:

- route selection and one active runtime;
- source conversion and project initialization;
- `design_spec.md` and `spec_lock.md`;
- SVG page source of truth;
- image/resource provenance and readiness;
- first-page and final SVG quality gates;
- `finalize_svg.py` and SVG-to-native-PPTX export;
- speaker notes, animations, and postflight rules when triggered.

Does not own:

- the user's factual claims;
- visual acceptance after Office rendering;
- permission to invent data or alter official logos.

### `presentations`

Use for any PowerPoint, PPTX, or Google Slides deliverable; for local PPTX work it complements PPT Master.

Owns:

- audience-facing narrative and slide-by-slide communication job;
- title/body/data hierarchy and minimum readable sizes;
- source blocks in notes;
- rendering every final slide;
- montage and overflow testing;
- final presentation acceptance.

Does not own a second build pipeline when PPT Master is active.

## Visual and brand advisors

### `brand`

Use whenever a logo, institution, partner, named organization, brand voice, or color system is present.

Apply:

- approved full-color/reversed/monochrome variants;
- clear space and minimum size;
- optical rather than equal-box co-branding;
- no stretch, crop, rotate, shadow, outline, or generative alteration.

### `design-system`

Use when more than one page shares typography, colors, spacing, recurring chrome, or components.

Apply a three-layer token model:

- primitive colors/sizes;
- semantic roles such as `surface`, `accent`, `muted`, `title`, `body`, `data`;
- component/page roles such as hero, evidence frame, footer, and logo lockup.

Do not turn every repeated element into a card. Tokens should create coherence, not UI-like repetition.

### `ui-ux-pro-max`

Use for font pairing, palette validation, readability, accessibility, chart selection, and information density.

Apply:

- finance/education-appropriate palette reasoning;
- contrast checks for small and large text;
- chart type chosen from the analytical question;
- legible labels and sufficient whitespace;
- no tiny text used to force fit.

### `design-taste-frontend` / `taste-skill`

Use for anti-slop review and composition quality. The catalog label is `design-taste-frontend`; the local Taste skill path is `~/.codex/skills/taste-skill/SKILL.md`. It is a visual critic, not a PPTX exporter. For a new high-aesthetic PPT, activate it before the visual system is locked and again against the rendered deck. Apply only transferable composition, hierarchy, palette, typography, and anti-pattern guidance; ignore browser/mobile-specific rules that do not apply to PowerPoint.

Apply:

- audit first, then fix;
- infer a deliberate art direction from audience and domain;
- vary slide silhouettes without losing the system;
- reject generic card grids, empty slogans, decorative noise, and default gradients;
- keep the primary visual and narrative claim aligned.

## Art direction and content advisors

### `design`

Use when the deck needs broader art direction, brand identity, image-led composition, custom icons, or presentation visual language. Feed its recommendations into the one locked design authority; do not let it replace the selected PPT builder.

### `slides`

Use when shaping strategic narrative, contextual slide strategy, design tokens, or chart-led presentation references. Treat HTML/Chart.js output as a planning reference unless the user explicitly requests an HTML presentation; for PPTX delivery, hand the approved direction to PPT Master or Presentations.

### `imagegen`

Use for original bitmap visuals such as hero scenes, material studies, conceptual metaphors, and non-factual decorative support.

Before generation, define aspect ratio, crop, focal area, lighting, and text-safe negative space. Never generate official logos, institutional seals, factual screenshots, numeric charts, or embedded claims. Use deterministic image processing for exact logo variants.

### `stop-slop`

Use when visible Chinese copy reads mechanical, repetitive, inflated, or obviously AI-generated. Preserve facts, figures, names, qualifiers, and argument boundaries. It may polish wording; it may not change the source-grounded message or silently add claims.

### `beautiful-article`

Use only when the source corpus is long, heterogeneous, or needs editorial restructuring before it becomes a slide blueprint. Its native output is a single HTML article, so do not run its scaffold, HTML build, or HTML delivery checkpoints for an ordinary PPTX task. In the explicit dual-output mode, it owns Branch A: HTML article → page frames → HTML-derived PPTX.

Transferable planning guidance:

- source → Markdown normalization and extraction notes;
- Brief / Outline / Theme / Assets planning;
- information-density decisions and section rhythm;
- cover/hero intent and asset policy;
- editorial, visual, and technical review questions.

Do not transfer article-only constraints such as 3:4 book-cover delivery, article TOC behavior, Reacticle components, or single-file HTML packaging into the native PPT Master branch.

### `dom-to-pptx`

Use only for the explicit HTML-derived PPTX branch. The verified local installation converts DOM/CSS coordinates and supported styles to PowerPoint objects. Read [dom-to-pptx-local.md](dom-to-pptx-local.md) before authoring because Flex/Grid semantics, images, gradients, complex CSS, SVG behavior, fonts, and notes have specific conversion boundaries.

## Routing rules

| Need | Primary owner | Advisors |
| --- | --- | --- |
| New editable PPTX | `ppt-master` | `presentations`, `brand`, `design-system`, `ui-ux-pro-max`, taste, `design`, `slides`, `imagegen`, `stop-slop` as triggered |
| Existing deck visual rebuild | `ppt-master` Beautify/Generate route | `presentations`, brand, visual advisors |
| Native template fill | `ppt-master` Fill Native route | `presentations`, brand |
| Narrative-only planning | `presentations` | `slides`, `stop-slop`, `ui-ux-pro-max` |
| Original hero visual | `imagegen` | `brand`, `design`, `ui-ux-pro-max` |
| Brand or co-brand audit | `brand` | `design-system`, `ui-ux-pro-max`, taste |
| Visual QA after rendering | `presentations` | `ui-ux-pro-max`, taste, brand |
| Long/complex source editorial planning | `beautiful-article` | `presentations`, `slides`, `stop-slop`, `ui-ux-pro-max` |
| Explicit HTML → PPT plus native PPT comparison | `beautiful-article` + `ppt-master` | `presentations`, `brand`, `design-system`, `ui-ux-pro-max`, `taste`, `imagegen`, `stop-slop` as triggered |

Never invoke two builders for the same branch. The only exception is the explicit dual-output mode, where `beautiful-article` owns the HTML-derived branch and `ppt-master` owns the native branch. Both branches consume the same fact ledger and blueprint. Advisory Skill output must be distilled into the branch's artifacts, not copied as conflicting instructions.

## User-facing declaration

At the start of a new deck, explicitly tell the user which of the following are active and why:

- `ppt-master` — the editable PPTX build and export route;
- `presentations` — narrative and final rendered-deck acceptance;
- `brand` — Logo, identity, co-brand, and brand consistency;
- `design-system` — tokens, spacing, typography roles, and reusable visual grammar;
- `ui-ux-pro-max` — palette, font pairing, chart choice, readability, and accessibility;
- `design-taste-frontend` / `taste-skill` — anti-slop and composition quality;
- `design` — broader art direction and image-led visual language;
- `slides` — strategic narrative and chart-led slide references;
- `imagegen` — original bitmap visual generation;
- `stop-slop` — copy polishing when the source wording reads mechanically.
- `beautiful-article` — long-source editorial planning or the explicit HTML-derived PPT branch.
- `dom-to-pptx` — local DOM/CSS-to-PPTX converter for the explicit HTML-derived branch.

Mark each Skill as `active`, `advisory`, or `not triggered` based on the actual task. Do not claim `beautiful-article` or `taste-skill` was used merely because it appears in this list.
