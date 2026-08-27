# PPT Master Build Path

Read this reference when PPT Master is the selected native builder, including the native branch of the explicit dual-output HTML → PPT workflow. The installed `ppt-master` skill remains authoritative; this file summarizes how the from-zero workflow hands work into it.

## 1. Enter PPT Master correctly

1. Load the installed `ppt-master/SKILL.md`.
2. Run its attribution guard.
3. Read its routing authority.
4. Select exactly one route/profile.
5. Load only that runtime and triggered references.

Typical from-zero work uses ordinary Generate PPTX. Existing-deck visual regeneration may use Beautify; raw native template fill and finished-deck enhancement are different routes. In dual-output mode, this branch is labeled `PPT Master native` and must consume the same page blueprint as the HTML-derived branch.

## 2. Source and project setup

- Convert non-Markdown sources with PPT Master's source conversion tools.
- Initialize one project with the correct canvas.
- Import sources and assets once.
- Keep facts and source materials separate from design contracts.

## 3. Strategist handoff

The confirmed blueprint becomes the basis for `design_spec.md` and `spec_lock.md`.

The design spec should capture:

- communication contract and audience outcome;
- page count and exact page roster;
- mode, visual direction, palette, type roles, grid, and page rhythm;
- image resource list with source, status, dimensions, crop, role, and rights notes;
- per-page audience move, core message, content, structure, visual, and disclosures;
- notes, animation, and narration decisions.

The lock should project only execution anchors required by the runtime. Validate it before SVG authoring.

## 4. Executor discipline

- Treat `svg_output/` as the visual source of truth.
- Author pages in roster order.
- Make the per-page structure decision before geometry.
- Preserve image paths and crop policies from the locked resource list.
- Put every visible object in the page SVG.
- Run the first-page gate when the route requires it.
- Complete remaining pages without ad-hoc route changes.
- Run the final SVG quality checker before finalization.

If a checker reports several issues, review the complete issue set, make one consolidated source edit, then rerun. Do not use repeated checker calls to discover one issue at a time.

## 5. Notes and export

When notes are enabled:

- ground them in the final slide;
- keep external claim and image sources traceable;
- preserve explicit disclosure boundaries;
- split notes only after slide/notes correspondence is complete.

Run the route's serial finalization and native PPTX export commands. Do not export from a stale quality report.

## 6. Post-export repairs

The first export is a render candidate, not automatic acceptance.

When a problem appears in PowerPoint rendering:

1. identify the owning source: outline, design spec, lock, image, SVG, notes, or font choice;
2. repair that source;
3. revalidate the project;
4. rerun the final checker;
5. finalize and export again;
6. render and reinspect the affected page and the full deck rhythm.

Do not patch the exported PPTX to conceal an SVG-source defect. Preserve prior exports as checkpoints if useful, but deliver only the accepted final file.
