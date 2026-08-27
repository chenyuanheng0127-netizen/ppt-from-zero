# HTML to PPT Dual Output

Read this reference when the user explicitly requests HTML → PPT conversion, two PPT variants, or a choice between an HTML-derived deck and a native PPT Master deck.

## Decision

Use two parallel authoring branches with one shared source contract:

```text
source corpus
   ↓
fact ledger + page blueprint + brand/design authority
   ├── Beautiful Article → single-file HTML → dom-to-pptx → PPTX A
   └── PPT Master → SVG/native DrawingML → PPTX B
```

The branches share facts, page order, data state, asset provenance, Logo treatment, and key titles. They differ only in rendering medium and editability.

## Branch A — Beautiful Article → HTML → PPT

1. Read `beautiful-article/SKILL.md` and only its source, planning, theme, asset, section, review, and HTML-output references that apply.
2. Convert the source corpus to `source.md` plus extraction notes.
3. Create the editorial plan with Brief / Outline / Theme / Assets.
4. Adapt the plan to a slide/page roster: every intended PPT page needs a stable boundary, title, visual block, and source note.
5. Generate the single-file HTML article using the Beautiful Article workflow. Its normal article checkpoints remain valid for HTML quality.
6. Read [dom-to-pptx-local.md](dom-to-pptx-local.md) and the installed upstream Skill/compatibility references it names. Build one fixed `1920×1080` `.slide` element per intended PPT page.
7. Convert the DOM/CSS slides with the local `scripts/dom_to_pptx.sh` wrapper. Use `--inject`, `--width 13.333333`, `--height 7.5`, `--browser-width 1920`, and `--browser-height 1080`. Preserve DOM order and `.slide` aspect ratio.
8. Add or verify speaker notes/source blocks and label the result `HTML-derived`.
9. Render the resulting PPTX and inspect every slide. This branch is usually visually faithful to HTML but less natively editable; disclose whether each page is an image, grouped shapes, or partially editable content.

### HTML branch constraints

- Do not pretend browser CSS, React components, SVG effects, or JavaScript interactions become native PowerPoint semantics automatically.
- Freeze fonts and dimensions before conversion.
- Check CJK wrapping, page breaks, crop, and background transparency at the final capture size.
- If a chart is rendered as a bitmap, retain the underlying data and source notes separately.
- Treat `dom-to-pptx` as a converter, not a quality gate. Verify its generated text, shapes, images, and charts in the resulting PPTX; unsupported CSS must be detected and either simplified upstream or disclosed.
- Do not use the HTML branch to bypass factual, brand, or accessibility checks.

## Branch B — PPT Master native

Run the normal `ppt-master` Generate PPTX route from the same confirmed blueprint:

- initialize one PPT Master project;
- write `design_spec.md` and `spec_lock.md`;
- author `svg_output/` in page order;
- run required first-page and final SVG gates;
- finalize and export native PPTX;
- render, inspect, and validate with overflow and OfficeCLI checks;
- label the result `PPT Master native`.

## Shared comparison rubric

Compare PPTX A and PPTX B on:

| Dimension | HTML-derived | PPT Master native |
| --- | --- | --- |
| Visual fidelity to HTML | usually strongest | may reinterpret layout |
| Native editability | often low/medium | usually strongest |
| Text reflow control | browser-controlled before capture | PowerPoint/font-controlled |
| Chart editability | depends on conversion path | native/fallback according to builder |
| Notes and provenance | must be reattached or verified | builder-native notes path |
| File stability | depends on raster/vector capture | native package validation |

Do not pick a winner silently. Deliver both branches and state the observed tradeoffs from actual renders.

## When HTML → PPT conversion is not allowed silently

Stop and surface the limitation when:

- the chosen converter is unavailable;
- the HTML contains interactions with no static representation;
- page boundaries are not defined;
- browser fonts are unavailable in PowerPoint;
- the user expects browser layout constraints, pixels inside images, or rasterized CSS fallbacks to remain fully editable;
- the two branches no longer share the same facts or page roster.

When `dom-to-pptx` is unavailable or cannot faithfully represent a page, stop the HTML branch and report the exact unsupported feature. Do not silently substitute a screenshot-only path when the user explicitly required DOM-to-PPT conversion.

## Deliverables

Dual-output delivery should include:

- `*_html_derived.pptx`;
- `*_pptmaster_native.pptx`;
- the single-file `article.html` used by Branch A;
- a short comparison note with editability, visual fidelity, and validation results.
