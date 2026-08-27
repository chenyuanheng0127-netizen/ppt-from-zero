# Visual QA and Release

Read this reference before every final delivery.

## 1. Static gates

Run the selected builder's project and source checks first. For PPT Master this normally includes project validation and the final SVG quality checker with zero blocking errors.

Treat warnings according to evidence. A warning about an intentional independent title or list item may remain; a warning that predicts clipping, font substitution, or illegible contrast needs investigation.

## 2. Render the actual PPTX

Render all slides from the final PPTX with the available presentation renderer or Office application. The render candidate must come from the same file intended for delivery.

Create a montage for:

- narrative rhythm;
- color balance across the deck;
- repeated silhouettes;
- section transitions;
- dark/light page cadence;
- logo consistency.

The montage is not sufficient for acceptance.

## 3. Inspect every slide at full size

Check each slide for:

- title wrapping and actual font fallback;
- text collisions, clipped glyphs, awkward line breaks, and baseline drift;
- logo presence, variant, contrast, clear space, optical weight, and background integration;
- image sharpness, crop, focal point, and text-safe negative space;
- chart labels, values, units, legends, baselines, and data-state disclosures;
- connector order, direction, and intersections;
- placeholder honesty and absence of simulated trends;
- page number, footer, source credit, and notes alignment;
- whether the most prominent element matches the page's core message;
- whether the page looks like part of the same deck without repeating the same template.

Common failures that static checks may miss:

- two text frames touch because the exported font is wider than the SVG estimate;
- a logo is technically present but hidden under a title or busy image;
- co-brand marks have equal boxes but unequal visual weight;
- white logo rectangles look pasted onto dark cinematic pages;
- a crop removes the image's intended focal point;
- the page passes overflow checks but still feels visually unbalanced;
- an intentional large watermark becomes the dominant message after export.

## 4. Repair loop

For every material issue:

1. identify the owning source;
2. edit the source, not the rendered PNG or final PPTX;
3. rerun the builder's final gate;
4. export a new PPTX;
5. rerender and inspect the affected slide;
6. rebuild the montage when the change affects brand, color, type, or page rhythm.

Do not stop after checking only the page that triggered the repair; global changes can shift other pages.

## 5. Release validation

Before handoff, require:

- expected slide count;
- one-to-one notes coverage when notes are enabled;
- zero blocking builder errors;
- no presentation-canvas overflow from the final PPTX;
- successful OpenXML validation with `officecli validate` when OfficeCLI is available;
- final file exists at the user-facing destination;
- final render was generated from that exact file or an identical byte-for-byte copy.

Disclose only material warnings. Internal QA logs and intermediate exports are not user deliverables unless requested.

### Dual-output acceptance

When the request explicitly asks for HTML → PPT plus a native PPT Master version, run the full validation independently for both files. Then compare their rendered slides on visual fidelity to the HTML, text wrapping, chart/image treatment, notes, and native editability. Deliver both only after both pass; do not silently choose one or merge them.

## 6. Handoff summary

State briefly:

- what the deck is for and its slide count;
- the dominant narrative and visual direction;
- the important asset/source treatments;
- which validations passed;
- the final output file.
