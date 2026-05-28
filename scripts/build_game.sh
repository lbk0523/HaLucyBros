#!/usr/bin/env bash
set -u

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
PROJECT_DIR="$ROOT_DIR/game"

find_godot() {
  for candidate in godot4 godot Godot "/Applications/Godot.app/Contents/MacOS/Godot"; do
    if command -v "$candidate" >/dev/null 2>&1; then
      command -v "$candidate"
      return 0
    fi
    if [ -x "$candidate" ]; then
      printf '%s\n' "$candidate"
      return 0
    fi
  done
  return 1
}

GODOT_BIN="$(find_godot || true)"

if [ -z "$GODOT_BIN" ]; then
  echo "blocked: Godot CLI not found. Install Godot 4.x or add it to PATH." >&2
  exit 2
fi

"$GODOT_BIN" --headless --path "$PROJECT_DIR" --quit

