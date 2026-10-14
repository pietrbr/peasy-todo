#!/bin/sh
# Symlink this package into the personal TEXMF tree so `\usepackage{peasy-todo}` is
# found from any document. Idempotent; pass --uninstall to remove the link.
set -eu

NAME="peasy-todo"
SRC="$(cd "$(dirname "$0")" && pwd)/tex/latex/$NAME"
DEST="$(kpsewhich -var-value TEXMFHOME)/tex/latex/$NAME"

if [ "${1:-}" = "--uninstall" ]; then
  if [ -L "$DEST" ]; then rm "$DEST" && echo "unlinked $DEST"; else echo "nothing to remove at $DEST"; fi
  exit 0
fi

mkdir -p "$(dirname "$DEST")"
ln -sfn "$SRC" "$DEST"
echo "linked $DEST -> $SRC"
