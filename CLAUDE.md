# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this is

A Doom Emacs theme package (`doom-themes` framework): Temperance, a family of
restrained, book-typography-inspired themes. Each spin is a different
origin/palette atop the same shared template; naming ties a spin back to its
origin — `nano` spins implement Nicolas Rougier's N Λ N O theme design (forked
from `ronisbr/doom-nano-themes` adaptation), `nord` spins recolor the same
template with the Nord palette. The design goal across every spin is restraint:
only a handful of semantic roles are ever drawn in a color other than the body
text, not typical syntax-highlighting editors.

Load a variant in Doom Emacs with `(setq doom-theme 'doom-temperance-nano-dark)`
(or `doom-temperance-nano-light`, `doom-temperance-nord-dark`,
`doom-temperance-nord-light`). Outside Doom, select it via a normal
`use-package`/`load-theme` call per the `doom-themes` package's own
instructions.

## Architecture

`doom-temperance-common.el` is the shared template every variant is built
from — this is the file to read first. It defines:

- `doom-temperance-common-defs`: the ~25 "required" `doom-themes` slots
  (`comments`, `constants`, `region`, `vc-added`, ...) expressed purely in
  terms of nine semantic accents: `temperance-foreground`/`temperance-background`,
  `temperance-highlight`, `temperance-subtle`, `temperance-faded`, `temperance-salient`,
  `temperance-strong`, `temperance-popout`, `temperance-critical`. Most syntax categories
  intentionally collapse onto `temperance-salient` or `temperance-strong` — this theme
  does not color code by token type, only by how much attention a token
  deserves. Rougier's own N Λ N O vocabulary names these roles with bare
  terms (`salient`, `faded`, `popout`, ...); they're prefixed here only
  because a bare name would occasionally collide with a derived
  `doom-themes` slot of the same name (`highlight` is both an accent and a
  slot it feeds), and the prefix used is the package's own name rather than
  `nano-`, since every spin shares this vocabulary regardless of origin
  (including the Nord ones) — it names a role, not one spin's origin.
- `doom-temperance-common-faces`: the full multi-hundred-line per-package
  face list (magit, org, dired, vterm, modeline, ...), also written only in
  terms of those nine accents (plus the `base0`-`base8` grey ramp and a few
  ANSI accent colors where a package genuinely needs more than nine hues,
  e.g. vterm's 16-color model).
- `def-doom-temperance-theme`: a macro wrapping `doom-themes`' own
  `def-doom-theme`. It splices a variant's own palette (`defs`) with
  `doom-temperance-common-defs`, and `doom-temperance-common-faces` with any
  variant-specific `extra-faces`, before calling `def-doom-theme`. Because
  `defs` are spliced in as sequential `let*` bindings and `doom-color`
  resolves a name via `assq` (first match wins), a binding in a variant's
  own `defs`/`extra-faces` overrides the shared default for that variant
  alone — e.g. `doom-temperance-nano-dark-theme.el` overrides `strings`
  back to `bright-blue` instead of the shared `temperance-faded`, and the two
  Nord variants each override `cursor` to use `temperance-popout`.

Each `doom-temperance-*-theme.el` file is therefore just: the nine `temperance-*`
accents, the `base0`-`base8` ramp, and the small set of extra accent colors
ANSI/vterm faces need (`blue`, `green`, `orange`, ...) — no face specs, and
no need to restate the shared architecture commentary (that lives in
`doom-temperance-common.el`). Adding a new variant means writing one of
these palette files, named `doom-temperance-<origin>-<light|dark>-theme.el`,
and calling `def-doom-temperance-theme`; it never requires touching
`doom-temperance-common.el` unless a genuinely new face needs mapping for
every variant at once.

### The `load-path` bootstrap

`load-theme` resolves a theme file via `custom-theme-load-path`, which is *not*
added to `load-path` — so a plain `(require 'doom-temperance-common)` inside a
theme file can silently fail to find its sibling depending on where Doom's
theme search path points. Every `doom-temperance-*-theme.el` file works
around this with a small snippet before the `require`, adding its own
directory (via `load-file-name`) to `load-path` first. Keep this snippet in
any new variant file; without it, `doom-temperance-common.el` must live
somewhere already on `load-path` (fragile) rather than next to the theme
files (correct).

## Verifying changes

There is no build system, linter config, or test suite in this repo. Verification
is done by loading the theme(s) in batch Emacs. From this directory:

```sh
DOOM_THEMES=/path/to/straight/build-*/doom-themes   # wherever doom-themes.el lives
emacs --batch \
  --eval "(add-to-list 'load-path \"$DOOM_THEMES\")" \
  --eval "(add-to-list 'custom-theme-load-path \"$(pwd)\")" \
  --eval "(require 'doom-themes)" \
  --eval "(load-theme 'doom-temperance-nano-dark t)" \
  --eval "(load-theme 'doom-temperance-nano-light t)" \
  --eval "(load-theme 'doom-temperance-nord-dark t)" \
  --eval "(load-theme 'doom-temperance-nord-light t)"
```

A clean run with no errors is the pass/fail signal. To inspect a specific
resolved color or face after loading a theme, use `(doom-color 'slot-name)` or
walk `(get 'theme-name 'theme-settings)` (each entry is
`(theme-face FACE-NAME THEME-NAME SPEC)`).

Byte-compiling any `doom-temperance-*-theme.el` variant file fails with
"Bytecode overflow" — this is a pre-existing `doom-themes` limitation (the
merged face-list `let*` is too large for one compiled function), not a
regression to chase. This is why those files carry `no-byte-compile: t` in
their file-local variables line, matching the same workaround upstream's
`doom-homage-white-theme.el` uses. `doom-temperance-common.el` itself
compiles fine (it's data + a macro, not the giant `let*`).

## Formatting standard

Keep `.el` files indentation/checkdoc-clean:

- Indent with `indent-region` under `emacs-lisp-mode`, `indent-tabs-mode` nil
  (spaces only). Load `doom-themes` first when checking files using
  `def-doom-theme`/`def-doom-temperance-theme` — those macros carry
  `(declare (indent ...))` specs that `calculate-lisp-indent` needs loaded to
  indent their call bodies correctly; without it, indent-region misindents
  macro-call bodies and looks like a false positive.
- Run `checkdoc-file` and fix what it flags. Common ones in this codebase:
  a single space after a sentence-ending period in a comment/docstring (Emacs
  convention wants two — `sentence-end-double-space`), and a macro/function
  docstring not referencing one of its formal parameters in uppercase
  somewhere in the body.
- No trailing whitespace.
