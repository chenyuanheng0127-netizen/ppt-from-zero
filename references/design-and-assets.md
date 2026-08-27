# Design System and Asset Planning

Read this reference for branded, investor-facing, image-led, high-aesthetic, or otherwise visually consequential decks.

## 1. Choose a single art direction

Write a one-sentence direction combining audience, domain, mood, and composition method. Example shape:

> Professional investor briefing with editorial restraint, material photography, asymmetric composition, and data-journalism discipline.

Then define:

- 5–9 color tokens with semantic roles;
- title, body, data, annotation, and footer type roles;
- safe margins, grid, and spacing rhythm;
- image lighting, material, crop, and negative-space behavior;
- chart line, fill, grid, label, and annotation behavior;
- logo variants, placement rules, and clear space;
- forbidden patterns.

Do not create several competing themes inside one deck.

## 2. Avoid presentation slop

Reject these defaults unless the content genuinely requires them:

- repeated equal-width card grids;
- pills, badges, buttons, tabs, and dashboard chrome;
- generic three-column process pages;
- decorative icons that repeat the adjacent text;
- arbitrary gradients, neon glows, particles, chips, robot/brain imagery, and cyberpunk motifs;
- a different visual language on every page;
- sparse pages padded with slogans;
- dense pages made fit through tiny text.

Use one strong composition per page. Vary neighboring silhouettes through photography, typography, data evidence, continuous geometry, editorial lists, and controlled breathing pages.

## 3. Typography

- Use a small, deliberate font family set.
- Prefer presentation-safe fonts and verify the actual exported render.
- Define role anchors before authoring; treat size as hierarchy, not decoration.
- One-line titles must not wrap accidentally.
- Check Latin and CJK optical weight together.
- A source file looking correct does not prove the PowerPoint render is correct; font fallback can change width and cause collisions.

## 4. Brand and logo handling

Prepare approved variants before layout:

- full-color for light backgrounds;
- reversed or monochrome-light for dark backgrounds;
- optional icon-only variant when the full lockup is illegible at the required size.

For deterministic derivatives, preserve geometry, proportions, alpha, and approved brand colors. Do not stretch, rotate, shadow, outline, crop, rearrange, or generate a logo.

For co-branding:

- align optically, not by equal container width;
- compare visible area, mark height, wordmark density, and baseline;
- preserve clear space for both marks;
- use a divider only when the layout needs an explicit relationship;
- avoid two unrelated white sticker boxes on a dark page;
- if reversed assets are impossible, use one intentional full-width co-brand bar rather than floating patches.

If the user requires a logo on every page, audit every final render—not only the source—for visibility, contrast, overlap, and consistency.

## 5. Asset plan per page

Choose the asset source before acquisition:

| Source | Appropriate use |
| --- | --- |
| User | logos, real screenshots, products, people, proprietary evidence |
| Official web | institutions, public facilities, leaders, verified context |
| Generated | conceptual hero art, physical metaphors, textures, non-factual scenes |
| Native chart/table | real quantitative evidence |
| Placeholder | missing evidence that must not be simulated |

Specify target aspect ratio, crop policy, focal area, and text-safe negative space before searching or prompting.

Generated images should normally avoid embedded text, fake interfaces, charts, numbers, and official marks. Generate to the page's intended composition: if copy sits left, place the visual focus right.

## 6. Data visuals

- Select a chart from the analytical question, not from visual novelty.
- Label methodology, dates, units, benchmark, and data state.
- Rebuild charts from real values where possible.
- Never draw an invented curve merely to make a placeholder look finished.
- A missing-data page can still be designed: show the evidence schema, required inputs, and evaluation criteria clearly.

## 7. Design preflight

Before authoring, confirm:

- the title page is minimal and distinctive;
- adjacent page silhouettes vary;
- the palette has one primary accent and controlled neutrals;
- type roles remain legible at projection distance;
- logo variants match their backgrounds;
- every image has a source, role, and crop plan;
- every chart has real data or an explicit placeholder state;
- no decorative device competes with the primary claim.
