# Doom Temperance Themes

**Temperance** is a small family of restrained, minimalist themes for the [`doom-themes`](https://github.com/doomemacs/themes) framework, with reduced semantic embellishments, and a limited colour palette.

The chief principle applied throughout the suite is restraint: a page of text should read more like typeset prose, and less like an attention-grabbing piece of advertisement, which popular syntax-highlighting systems often resemble. Only a handful of roles are ever drawn in a color other than the body text - in accordance to the system laid out by Nicolas Rougier, as implemented in his [N Λ N O Theme](https://github.com/rougier/nano-theme).

Internally, each spin builds atop the base template (`doom-temperance-common.el`) and differs only in its individual, limited palette. This makes it very easy to produce entirely new variations.

### Available flavours

| Theme                         | Palette                                         |
| ----------------------------- | ----------------------------------------------- |
| `doom-temperance-nano-dark`   | N Λ N O palette, dark                           |
| `doom-temperance-nano-light`  | N Λ N O palette, light                          |
| `doom-temperance-nord-dark`   | Nord palette, dark                              |
| `doom-temperance-nord-light`  | Nord palette, light                             |

## Origin and attributions

The suite borrows heavily from [ronisbr/doom-nano-themes](https://github.com/ronisbr/doom-nano-themes), which I generalised to procure a framework capable of supporting any arbitrary colour system.

The `nano` spins are an interpretation of Nicolas P. Rougier's [N Λ N O theme](https://github.com/rougier/nano-emacs), derived from my personal fork of the [ronisbr/doom-nano-themes](https://github.com/ronisbr/doom-nano-themes)' `doom-themes` adaptation.

The `nord` spins adapt the [Nord](https://www.nordtheme.com/) to fit into Temperance's assumptions.

## Usage

In Doom Emacs:

```elisp
(setq doom-theme 'doom-temperance-nano-dark)
;; or: doom-temperance-nano-light, doom-temperance-nord-dark, doom-temperance-nord-light
```

Outside Doom, put this directory on `custom-theme-load-path` and load a theme as usual:

```elisp
(add-to-list 'custom-theme-load-path "/path/to/doom-temperance-themes")
(load-theme 'doom-temperance-nano-dark t)
```

`doom-themes` itself must be installed either way, since every variant relies on its `def-doom-theme` machinery.

## AI disclaimer

This package **is not** AI-generated. AI **has been** employed to assist in its development.

## License

GNU GPLv3.
