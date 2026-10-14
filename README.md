# peasy-todo

`peasy-todo` is a LaTeX package. It adds numbered, highlighted to-do and done notes
to a document and collects them in a list of to-dos. It is a modified version of
[easy-todo](https://ctan.org/pkg/easy-todo) by Juan Rada-Vilela.

Version 1.0, 2026/10/14.

## Changes from easy-todo

- The notes use `soul` for a highlight.
- `\todoii` takes an optional color as its first argument.
- `\done` prints a blue note.
- The list of to-dos is not a child of `\part`.

## Installation

To link the package into your personal TEXMF tree, run:

```bash
./install.sh              # ./install.sh --uninstall removes the link
```

The link target is `$(kpsewhich -var-value TEXMFHOME)/tex/latex/peasy-todo`.
After that, `\usepackage{peasy-todo}` works from any document.

## Usage

```latex
\usepackage[obeyFinal]{peasy-todo}
...
\listoftodos
\todo{Add the missing figure.}
\done{Fix the caption.}
```

The manual is `doc/latex/peasy-todo/peasy-todo.pdf`. To build the manual and the
CTAN archive `peasy-todo.zip`, run:

```bash
./ctan.sh
```

## License

Copyright (C) 2026 Pietro Brach del Prever.
The package is under the Apache License, Version 2.0. See `LICENSE`.
