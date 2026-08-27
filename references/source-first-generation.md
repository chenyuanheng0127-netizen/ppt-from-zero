# Source-First Generation and Design Preflight

This reference replaces draft-first beautification. Read it before authoring a new deck or materially rebuilding an existing one.

## Principle

Generate the target version directly from a resolved source contract. A first pass is not a disposable visual experiment. Every visible choice should already have an owner: content, brand, design system, asset plan, data state, or export constraint.

An existing draft may reveal source facts, page order, legacy assets, or a user-specified visual reference. It does not automatically become the target style, and its defects must not be copied.

## Source-first gates

### Gate A — Communication

- audience, purpose, delivery setting, and outcome are explicit;
- every page has one audience move and one core message;
- page order forms a cumulative arc;
- visible copy is audience-facing;
- unresolved claims are marked as missing, placeholder, or blocked.

### Gate B — Brand

- every Logo has an approved source and variant;
- light/dark background treatment is decided before layout;
- transparent reversed marks are prepared for dark backgrounds where permitted;
- co-branding is aligned by optical weight, height, baseline, and clear space;
- no Logo is generated, stretched, rotated, shadowed, outlined, or placed in an accidental white sticker box.

### Gate C — Visual system

- one art direction is written in one sentence;
- palette has semantic roles and one controlled accent;
- title/body/data/annotation/footer roles and anchor sizes are named;
- grid, safe margins, spacing, and page rhythm are set;
- each page has a chosen composition family and adjacent pages vary deliberately;
- forbidden patterns are named before authoring.

### Gate D — Assets and data

- each image has a source, rights status, dimensions, crop policy, focal area, and page role;
- user/official images are used for identity and factual context;
- generated images are limited to original conceptual or editorial visuals;
- chart type follows the analytical question;
- real values, units, dates, benchmark, methodology, and data state are available;
- missing values are rendered as explicit evidence placeholders, never plausible fake curves.

### Gate E — Export behavior

- all intended visible elements will exist in the builder's source representation;
- fonts are presentation-safe and tested against the actual export renderer;
- text frames have width for the exported font, not merely the authoring preview;
- notes/source blocks are planned;
- the selected builder's route, structure mode, and quality gates are known before mass authoring.

Do not begin drawing pages until all five gates have an answer. A blocker should be surfaced to the user or represented honestly as a placeholder; it must not be hidden by decoration.

## Direct-generation construction order

1. Establish the communication contract and source/fact ledger.
2. Draft the ordered page blueprint with content, relationships, evidence, and disclosure state.
3. Declare the active Skill stack and assign each decision to one owner.
4. Lock the single visual system and brand variants.
5. Acquire/generate only the assets already assigned in the blueprint.
6. Write the builder's design spec and execution lock.
7. Author pages in roster order with page-specific compositions.
8. Apply first-page and final static gates as required by the builder.
9. Export the native PPTX.
10. Render the actual final file and inspect every page.

For the explicit dual-output mode, insert one parallel branch after step 5:

```text
same fact ledger + same page blueprint
   ├── beautiful-article → HTML → defined page frames → PPTX A
   └── ppt-master → SVG/native DrawingML → PPTX B
```

The HTML branch is generated intentionally from the source, not as a disposable prototype. The PPT Master branch is also generated directly from the same source contract. Both are inspected as final deliverables; neither is treated as a later beautification pass for the other.

The last two steps are acceptance checks, not a plan to repair a weak design. If they reveal a mismatch, repair the owning upstream source and regenerate; do not patch the PPTX or conceal the issue.

## Quality bar for the first generated version

The first deliverable should already satisfy:

- coherent brand integration on every page;
- visible hierarchy at projection distance;
- varied but related slide silhouettes;
- purposeful and non-repetitive charts/diagrams;
- honest placeholders and traceable sources;
- no unintended overlap, clipping, font drift, or logo collisions;
- actual Office-render verification.

## Existing-draft handling

When a user supplies an old deck:

- classify it as source content, visual reference, native template, or finished deck to enhance;
- choose the corresponding builder route;
- preserve only what the route and user explicitly require;
- rebuild the target from the source contract and current design authority;
- never use “beautify later” as the main strategy.
