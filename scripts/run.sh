#!/bin/sh
set -eu

ROOT=${HERDR_PLUGIN_ROOT:-$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)}
BIN="$ROOT/bin/herdr-tab-title"

if [ -x "$BIN" ]; then
  exec "$BIN" "$@"
fi

if command -v cargo >/dev/null 2>&1; then
  cd "$ROOT"
  exec cargo run --quiet --release -- "$@"
fi

echo "herdr-tab-title binary is missing and cargo is not available" >&2
echo "Run scripts/install-binary.sh from the plugin directory." >&2
exit 127
