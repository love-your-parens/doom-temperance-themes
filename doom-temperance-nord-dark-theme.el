;;; doom-temperance-nord-dark-theme.el --- Nord-inspired dark spin on the Temperance template -*- lexical-binding: t; no-byte-compile: t; -*-

;; Copyright (C) 2026 Konrad Wątor <konrad@wator.it>

;; An adaptation of the Nord Dark palette for the Temperance framework.
;;
;; Author           : Konrad Wątor
;; Created          : September 2026
;; License          : GNU GPLv3
;; Package-Requires : ((emacs "28") (doom-themes "2"))
;; Version          : 0.1
;;
;;; Commentary:
;; This package provides a minimalistic interpretation of Nord Dark.
;;
;; Only the base palette lives here.  Faces are derived from it by
;; `doom-temperance-common.el'.  Visit the file for the how & why.
;;
;; The nine accents draw on Nord's full range, picked by role rather than by
;; hue family: Frost blue (nord9) for `temperance-salient' (structural text --
;; keywords, links), Aurora orange (nord12) for `temperance-popout' (transient
;; attention), and Aurora red (nord11) for `temperance-critical' (real alerts --
;; kept a distinct hue from popout so an actual error doesn't read as just
;; another accent).  Neutrals come from Nord's own Polar Night/Snow Storm
;; ramp (nord0-6).
;;
;; `temperance-faded' (comments, and everything else muted) is not literal nord3:
;; nord3 on nord0 measures ~1.7:1 contrast, well under legible.  It is nord3
;; blended 60% toward nord4 instead, landing at a comfortable ~5.2:1.  Line
;; numbers inherit this via the shared template, so they stay visibly dimmer
;; than body text without dropping below legible.
;;
;; The cursor is repainted to `temperance-popout' instead of the template's default
;; (plain foreground) so it stays the single most eye-catching thing on
;; screen, rather than just another patch of bright/`temperance-strong' text.

;;; Code:

;; `load-theme' resolves this file via `custom-theme-load-path', which
;; does not add its directory to `load-path' -- so `require' cannot
;; find a sibling file here unless we add it ourselves first.
(let ((dir (file-name-directory (or load-file-name buffer-file-name))))
  (unless (member dir load-path)
    (add-to-list 'load-path dir)))
(require 'doom-temperance-common)

(def-doom-temperance-theme
 doom-temperance-nord-dark
 "A dark, Nord-inspired theme for Doom Emacs."
 (;; Colors picked from the Nord palette.
  ;; Nord's own names, for reference: nord0 #2e3440, nord1 #3b4252,
  ;; nord2 #434c5e, nord3 #4c566a, nord4 #d8dee9, nord6 #eceff4,
  ;; nord8 #88c0d0, nord9 #81a1c1, nord11 #bf616a.
  (temperance-foreground '("#d8dee9" "#d8dee9" "white"))
  (temperance-background '("#2e3440" "#2e2e2e" "black"))
  (temperance-highlight  '("#3b4252" "#262626" "brightblack"))
  (temperance-subtle     '("#434c5e" "#3f3f3f" "brightblack"))
  (temperance-faded      '("#a0a8b6" "#9e9e9e" "brightblack"))
  (temperance-salient    '("#81a1c1" "#51afef" "brightblue"))
  (temperance-strong     '("#eceff4" "#ffffff" "brightwhite"))
  (temperance-popout     '("#d08770" "#d78700" "orange"))
  (temperance-critical   '("#bf616a" "#d75f5f" "red"))

  (base0           '("#191c25" "black"   "black"))
  (base1           '("#242832" "#1e1e1e" "brightblack"))
  (base2           '("#2c333f" "#2e2e2e" "brightblack"))
  (base3           '("#373e4c" "#262626" "brightblack"))
  (base4           '("#434c5e" "#3f3f3f" "brightblack"))
  (base5           '("#4c566a" "#525252" "brightblack"))
  (base6           '("#9099ab" "#6b6b6b" "brightblack"))
  (base7           '("#d8dee9" "#979797" "brightblack"))
  (base8           '("#f0f4fc" "#dfdfdf" "white"))

  (bright-blue     '("#b8c9e0" "#b8c9e0" "brightblue"))
  (bright-cyan     '("#b7e1e8" "#b7e1e8" "brightcyan"))
  (bright-green    '("#cfe3c1" "#cfe3c1" "brightgreen"))
  (bright-magenta  '("#dac7dd" "#dac7dd" "brightmagenta"))
  (bright-red      '("#e3b8be" "#e3b8be" "brightred"))
  (bright-violet   '("#c7c9e3" "#c7c9e3" "brightviolet"))
  (bright-white    temperance-background)
  (bright-yellow   '("#f2e7c0" "#f2e7c0" "brightyellow"))

  (blue            '("#81a1c1" "#5fafd7" "blue"))
  (cyan            '("#88c0d0" "#5fd7d7" "cyan"))
  (dark-blue       '("#5e81ac" "#5f87af" "blue"))
  (dark-cyan       '("#4c6a6a" "#5f8787" "cyan"))
  (green           '("#a3be8c" "#87af87" "green"))
  (grey            base4)
  (magenta         '("#b48ead" "#af87af" "magenta"))
  (orange          '("#d08770" "#d78700" "orange"))
  (red             '("#bf616a" "#d75f5f" "red"))
  (teal            '("#8fbcbb" "#87afaf" "teal"))
  (violet          '("#8b8fc0" "#8787d7" "violet"))
  (white           temperance-foreground)
  (yellow          '("#ebcb8b" "#d7d787" "yellow")))

 ;; The cursor is too easy to miss. Make it pop.
 ((cursor :foreground bg :background temperance-popout)))

(provide 'doom-temperance-nord-dark-theme)

;;; doom-temperance-nord-dark-theme.el ends here
