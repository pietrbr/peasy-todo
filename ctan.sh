#!/bin/sh
# Build the manual and pack a flat peasy-todo.zip for upload to CTAN.
set -eu

NAME="peasy-todo"
ROOT="$(cd "$(dirname "$0")" && pwd)"
BUILD="$(mktemp -d)"
trap 'rm -rf "$BUILD"' EXIT

mkdir "$BUILD/$NAME"
cp "$ROOT/tex/latex/$NAME/$NAME.sty" "$ROOT/doc/latex/$NAME/$NAME.tex" \
  "$ROOT/README.md" "$ROOT/LICENSE" "$BUILD/$NAME/"

(cd "$BUILD/$NAME" && TEXINPUTS=".:" latexmk -pdf -interaction=nonstopmode -halt-on-error "$NAME.tex" >/dev/null && latexmk -c "$NAME.tex" >/dev/null)
rm -f "$BUILD/$NAME/$NAME.lod"
cp "$BUILD/$NAME/$NAME.pdf" "$ROOT/doc/latex/$NAME/$NAME.pdf"

rm -f "$ROOT/$NAME.zip"
(cd "$BUILD" && zip -qr "$ROOT/$NAME.zip" "$NAME")
echo "wrote $ROOT/$NAME.zip"
