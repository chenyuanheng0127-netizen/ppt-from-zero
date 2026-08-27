#!/bin/sh
set -eu

tool="${PPT_FROM_ZERO_DOM_TO_PPTX:-${DOM_TO_PPTX_BIN:-}}"

if [ -z "$tool" ]; then
  tool="$(command -v dom-to-pptx 2>/dev/null || true)"
fi

if [ ! -x "$tool" ]; then
  echo "dom-to-pptx is unavailable. Set PPT_FROM_ZERO_DOM_TO_PPTX or DOM_TO_PPTX_BIN to an executable path." >&2
  exit 2
fi

exec "$tool" "$@"
