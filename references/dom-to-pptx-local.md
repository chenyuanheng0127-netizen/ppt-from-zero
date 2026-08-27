# Local dom-to-pptx Integration

Read this reference before authoring or converting the HTML-derived PPTX branch.

## Converter installation

- Upstream package: `dom-to-pptx` 2.1.1, MIT
- Skill wrapper: `scripts/dom_to_pptx.sh`
- Set `PPT_FROM_ZERO_DOM_TO_PPTX` or `DOM_TO_PPTX_BIN` to the executable path, or put `dom-to-pptx` on `PATH`.
- The converter is intentionally not vendored in this Skill package. This keeps the Skill small and lets users select a verified local installation.

Before using the converter, read the installed upstream guidance:

- `<dom-to-pptx-repo>/skills/dom-to-pptx-skill/SKILL.md`
- `reference/STYLE_WHITELIST.md`
- `reference/SAFE_HTML_TEMPLATE.md`
- `reference/VALIDATION.md`

The upstream Skill advises visual direction as well as conversion. Its visual advice remains subordinate to the confirmed shared design authority in `$ppt-from-zero`.

## Required HTML contract

- One `.slide` element maps to one PowerPoint slide in DOM order.
- Each root uses fixed `width:1920px; height:1080px; position:relative; overflow:hidden`.
- Avoid transformed ancestors, viewport units, and layout that changes after initial load.
- Use static, completed DOM content; the exporter waits for `networkidle0` but exposes no custom ready signal.
- Use local/data-URI images where possible; remote images require CORS.
- Define actual font families through `@font-face` or accessible web CSS. The CLI auto-detects and embeds fonts but exposes no manual font flag.
- Add notes with a descendant `<template data-pptx-notes>...</template>` for maximum portability. The verified local build also supports a non-empty `data-pptx-notes="..."` value on the slide root.

## Exact wide-screen export

```bash
"${SKILL_DIR}/scripts/dom_to_pptx.sh" export \
  "/absolute/path/deck.html" \
  --output "/absolute/path/deck_html_derived.pptx" \
  --selector ".slide" \
  --inject \
  --width 13.333333 \
  --height 7.5 \
  --browser-width 1920 \
  --browser-height 1080 \
  --title "Presentation title" \
  --author "Author"
```

`--inject` is mandatory in this workflow so conversion uses the verified local bundle rather than a CDN or HTML-bundled version. Create the output directory before export.

Override the converter when intentionally testing another verified installation:

```bash
PPT_FROM_ZERO_DOM_TO_PPTX="/absolute/path/dom-to-pptx" \
  "${SKILL_DIR}/scripts/dom_to_pptx.sh" --help
```

## Editability boundary

Normally native/editable:

- text and rich-text runs;
- bullets and lists;
- common rectangles, rounded rectangles, ellipses, fills, borders, and shadows;
- tables and supported native animations/transitions.

Flattened or partly rasterized:

- Flex/Grid become absolute coordinates and lose responsive constraints;
- `<img>` content remains an image;
- complex pseudo-elements, filters, compound borders, masks, and icons may become PNG/SVG fallbacks;
- linear gradients may be inserted as SVG images rather than native PowerPoint gradients;
- inline SVG defaults to raster in the CLI. `svgAsVector` requires the Node API and remains an SVG object until converted/ungrouped in PowerPoint.

Do not promise full editability for fallbacks. Inspect the exported PPTX object inventory and disclose the actual result.

## Local correctness patches

The verified local installation includes two focused fixes covered by tests:

- sort `presentation.xml` children into PresentationML schema order so OfficeCLI/OpenXML validation passes;
- extract speaker notes from root attribute values as well as descendant note elements.

Do not replace or update the repository without rebuilding and rerunning the tests below; an update may overwrite these fixes.

## Validation

Installation tests (run in the converter repository):

```bash
cd "<dom-to-pptx-repo>"
pnpm test -- --run
pnpm run build
```

The verified baseline is 10 test files and 103 passing tests.

Every produced HTML-derived PPTX must pass:

```bash
unzip -t "/absolute/path/deck_html_derived.pptx"
officecli validate "/absolute/path/deck_html_derived.pptx" --json
```

Also render every slide, inspect each page at full size, run the presentation overflow test, confirm notes, and query representative slides to verify native text/shapes rather than assuming conversion fidelity.
