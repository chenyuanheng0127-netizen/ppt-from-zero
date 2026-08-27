# Contributing

Issues and pull requests are welcome. Keep changes scoped to the source-first presentation workflow and preserve its factual, provenance, brand, and rendered-deck QA boundaries.

Before opening a pull request:

1. Run the Skill validator against the repository root.
2. Run `sh -n scripts/dom_to_pptx.sh`.
3. Run `xmllint --noout assets/*.svg` when modifying artwork.
4. Confirm that documentation contains no machine-specific paths, credentials, or private source material.
5. Keep English and Chinese README content aligned when user-facing behavior changes.

By contributing, you agree that your contribution is licensed under the repository's MIT License.
