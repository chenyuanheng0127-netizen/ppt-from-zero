<p align="center">
  <img src="./assets/logo_ppt-from-zero_horizontal_20260827.svg" alt="PPT From Zero" width="720" />
</p>

<p align="center">
  <a href="./LICENSE">MIT License</a> ·
  <a href="https://github.com/hugohe3/ppt-master">PPT Master</a> ·
  <a href="https://hugohe3.github.io/ppt-master-examples/">Live examples</a> ·
  <a href="./README_CN.md">中文</a>
</p>

# PPT From Zero

`ppt-from-zero` is an integrated PPT-producing Skill for agent-capable AI tools. It turns PDFs, DOCX files, web pages, outlines, images, and data into a source-grounded, branded, editable PPTX, with a deliberate slide blueprint and a full rendered-deck QA pass.

It is a complete route from source material to accepted PPT output. The integrated Skill stack assigns source, story, brand, design, image, HTML, native PPTX, and QA decisions to the right specialist. [`ppt-master`](https://github.com/hugohe3/ppt-master) owns the native PPTX export implementation; `ppt-from-zero` coordinates the complete production contract around it.

![Workflow](./assets/diagram_ppt-from-zero_workflow_20260827.svg)

## What it adds

| Stage | Output | Why it matters |
| --- | --- | --- |
| Communication contract | Audience outcome and narrative arc | Every slide has one job |
| Fact inventory | Claims, values, qualifiers, sources, and missing evidence | No invented facts or simulated data |
| Page blueprint | Page-by-page content, structure, visual, provenance, and notes | Design follows the story |
| Shared visual system | Palette, type roles, grid, image rules, chart language, logo treatment | Related pages stay coherent |
| Builder routing | Native PPT Master or explicit HTML-derived + native dual output | The editability tradeoff is visible |
| Release QA | Rendered slide inspection, overflow checks, notes, and OpenXML validation | The delivered file is the file that was checked |

## Integrated Skill Stack

These Skills are part of the `ppt-from-zero` production route. They are scoped roles in one workflow, not separate competing PPT generators. The route loads only the roles needed for the request and resolves their advice into one shared fact ledger, page blueprint, and visual authority.

| Integrated Skill | Responsibility in the PPT route | When it is used |
| --- | --- | --- |
| `ppt-master` | Native PPTX builder, SVG source of truth, project specs, export, and native postflight | Default native branch when available; mandatory when explicitly named |
| `presentations` | Audience-facing narrative, slide hierarchy, notes, rendering, montage, overflow, and final acceptance | Every PPTX deliverable |
| `brand` | Logo variants, clear space, optical co-branding, identity, and asset consistency | Logos, institutions, partners, or named brands |
| `design-system` | Primitive → semantic → component tokens for type, color, spacing, and recurring page grammar | Shared visual systems across pages |
| `ui-ux-pro-max` | Font pairing, contrast, chart choice, density, and accessibility decisions | Readability, charts, tables, and information-dense decks |
| `design-taste-frontend` / `taste-skill` | Anti-template review, composition variety, hierarchy, and anti-slop visual preflight | New high-aesthetic decks and visual QA |
| `design` | Broader art direction, custom icons, image-led composition, and presentation visual language | When the deck needs custom visual direction or icons |
| `slides` | Strategic narrative, contextual slide strategy, design tokens, and chart-led references | Narrative planning and strategy-heavy decks |
| `imagegen` | Original bitmap hero visuals, textures, and conceptual metaphors | Only for original non-factual imagery; never official marks or data charts |
| `stop-slop` | Humanizes mechanical Chinese copy while preserving facts and claims | When visible Chinese copy needs polishing |
| `beautiful-article` | Source normalization and editorial planning for long or heterogeneous material; owns the HTML branch | Long sources or explicit HTML-derived output |
| `dom-to-pptx` | Converts fixed `.slide` HTML/CSS frames into the HTML-derived PPTX | Explicit HTML-derived branch only |

### Route map

```text
source material
    ↓
ppt-from-zero: contract → fact ledger → page blueprint → shared design authority
    ├── native route: ppt-master → editable PPTX → presentations QA
    └── dual route: beautiful-article → fixed HTML slides → dom-to-pptx → PPTX A
                    ppt-master → native PPTX B
                    presentations compares both final renders
```

The advisory Skills shape the shared decisions above. They are not silently skipped in favor of a generic template, and they do not rewrite one another's source-of-truth files.

## See it in action

The examples below are real rendered decks from the companion examples gallery. Open a screenshot for the online viewer or download the editable `.pptx` from the linked example project.

| Editorial architecture | Data journalism | Swiss grid |
| --- | --- | --- |
| [![Pritzker 2026](https://raw.githubusercontent.com/hugohe3/ppt-master/main/docs/assets/screenshots/preview_pritzker_2026.png)](https://hugohe3.github.io/ppt-master-examples/viewer.html?project=ppt169_pritzker_2026) | [![Global AI Capital](https://raw.githubusercontent.com/hugohe3/ppt-master/main/docs/assets/screenshots/preview_global_ai_capital.png)](https://hugohe3.github.io/ppt-master-examples/viewer.html?project=ppt169_global_ai_capital_2026) | [![Swiss grid](https://raw.githubusercontent.com/hugohe3/ppt-master/main/docs/assets/screenshots/preview_swiss_grid.png)](https://hugohe3.github.io/ppt-master-examples/viewer.html?project=ppt169_swiss_grid_systems) |

More visual references: [all examples](https://hugohe3.github.io/ppt-master-examples/), [source repository](https://github.com/hugohe3/ppt-master-examples), and the [PPT Master positioning guide](https://github.com/hugohe3/ppt-master/blob/main/docs/why-ppt-master.md).

## Install and invoke

Install the standalone Skill package, then point your agent at the Skill file:

```bash
npx skills add chenyuanheng0127-netizen/ppt-from-zero
```

```text
SKILL.md
```

The native branch expects the [`ppt-master`](https://github.com/hugohe3/ppt-master) Skill. For the optional HTML-derived branch, install a verified `dom-to-pptx` converter and set one of these variables:

```bash
export PPT_FROM_ZERO_DOM_TO_PPTX="/absolute/path/to/dom-to-pptx"
# or
export DOM_TO_PPTX_BIN="/absolute/path/to/dom-to-pptx"
```

Then ask your agent for a deck from a source file:

```text
Use $ppt-from-zero to turn projects/q3-report/sources/report.pdf into a 10-page presentation.
```

For the explicit dual-output mode:

```text
Use $ppt-from-zero to produce both an HTML-derived PPTX and a PPT Master native PPTX from the same source and compare their editability and visual fidelity.
```

## Output modes

- **Normal:** one editable PPTX through the selected native builder.
- **HTML-derived + native:** one static HTML source, one `*_html_derived.pptx`, and one `*_pptmaster_native.pptx`, all sharing the same fact ledger and page roster.

The HTML-derived branch can flatten unsupported CSS, images, gradients, and complex SVG into fallbacks. The Skill requires that those limits are disclosed rather than described as fully editable.

## Design and provenance rules

- The outline owns facts; design cannot create claims.
- Each slide has one audience-facing communication job.
- Logos are sourced or deterministic derivatives only. They are never generated, stretched, rotated, shadowed, or placed in accidental white boxes.
- Charts use real values, units, dates, benchmarks, and methodology. Missing values become explicit evidence placeholders.
- Images record source, rights status, dimensions, crop, focal area, and page role.
- The final PPTX is rendered and inspected slide by slide. A source file that looks correct is not acceptance evidence.

## Repository map

```text
.
├── SKILL.md                         # Entrypoint and non-negotiable boundaries
├── agents/openai.yaml               # UI metadata and custom icon paths
├── assets/                          # Original mark, wordmark, and workflow visual
├── references/                      # Source, design, dual-output, converter, and QA guidance
└── scripts/dom_to_pptx.sh           # Portable converter wrapper
```

Read the [core Skill](./SKILL.md) first. Then load only the reference that matches the current branch: [source to outline](./references/source-to-outline.md), [design and assets](./references/design-and-assets.md), [PPT Master build](./references/pptmaster-build.md), [HTML to PPT dual output](./references/html-to-ppt-dual-output.md), or [QA and release](./references/qa-and-release.md).

## Attribution

Created and maintained by [Hendrix Chen](https://github.com/chenyuanheng0127-netizen). This standalone Skill is designed to work with the native presentation workflow in [PPT Master](https://github.com/hugohe3/ppt-master). The custom mark and wordmark in `assets/` are original project artwork and are not official PowerPoint, OpenAI, Anthropic, or vendor logos.

The linked deck screenshots and online viewers are reference examples from the MIT-licensed [PPT Master](https://github.com/hugohe3/ppt-master) and [PPT Master Examples](https://github.com/hugohe3/ppt-master-examples) projects. They are loaded from their upstream repositories and are not bundled assets in this repository. See [Third-Party Notices](./THIRD_PARTY_NOTICES.md).

## License

This Skill is released under the [MIT License](./LICENSE). Keep the copyright and license notice when redistributing it.
