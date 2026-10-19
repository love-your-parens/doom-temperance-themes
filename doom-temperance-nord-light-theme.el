;;; doom-temperance-nord-light-theme.el --- Nord-inspired light spin on the Temperance template -*- lexical-binding: t; no-byte-compile: t; -*-

;; Copyright (C) 2026 Konrad Wątor <konrad@wator.it>

;; An adaptation of the Nord Light palette for the Temperance framework.
;;
;; Author           : Konrad Wątor
;; Created          : September 2026
;; License          : GNU GPLv3
;; Package-Requires : ((emacs "28") (doom-themes "2"))
;; Version          : 0.1.1
;;
;;; Commentary:
;; This package provides a minimalistic interpretation of Nord Light.
;;
;; Only the base palette lives here.  Faces are derived from it by
;; `doom-temperance-common.el'.  Visit the file for the how & why.
;;
;; The nine accents mirror `doom-temperance-nord-dark-theme.el', picked by role
;; rather than by hue family: Frost blue (nord10, the darker/more saturated
;; step -- nord9 alone is too pale against a light page) for `temperance-salient'
;; (structural text -- keywords, links), a darkened Aurora orange for
;; `temperance-popout' (transient attention), and Aurora red (nord11) for
;; `temperance-critical' (real alerts -- kept a distinct hue from popout).
;; Neutrals come from Nord's own Polar Night/Snow Storm ramp (nord0-6).
;;
;; `temperance-popout' is nord12 darkened ~30% rather than literal nord12: nord12
;; on this background measures ~2.5:1 contrast, too low for the small
;; foreground text it's used as (aw-leading-char, org-tag, hydra, ...).  The
;; darkened value lands at ~4.6:1.
;;
;; The cursor is repainted to `temperance-popout' instead of the template's default
;; (plain foreground) so it stays the single most eye-catching thing on
;; screen, rather than just another patch of dark/`temperance-strong' text.

;;; Code:

;; `load-theme' resolves this file via `custom-theme-load-path', which
;; does not add its directory to `load-path' -- so `require' cannot
;; find a sibling file here unless we add it ourselves first.
(let ((dir (file-name-directory (or load-file-name buffer-file-name))))
  (unless (member dir load-path)
    (add-to-list 'load-path dir)))
(require 'doom-temperance-common)

(def-doom-temperance-theme
 doom-temperance-nord-light
 "A light, Nord-inspired theme for Doom Emacs."
 (;; Colors picked from the Nord palette.
  ;; Nord's own names, for reference: nord0 #2e3440, nord1 #3b4252,
  ;; nord4 #d8dee9, nord5 #e5e9f0, nord6 #eceff4, nord9 #81a1c1,
  ;; nord10 #5e81ac, nord11 #bf616a.
  (temperance-foreground '("#3b4252" "#444444" "brightblack"))
  (temperance-background '("#eceff4" "#eeeeee" "brightwhite"))
  (temperance-highlight  '("#e5e9f0" "#e4e4e4" "brightcyan"))
  (temperance-subtle     '("#d8dee9" "#dadada" "brightcyan"))
  (temperance-faded      '("#4c566a" "#5f5f87" "brightblack"))
  (temperance-salient    '("#5e81ac" "#5f87af" "blue"))
  (temperance-strong     '("#2e3440" "#303030" "black"))
  (temperance-popout     '("#915e4e" "#875f5f" "orange"))
  (temperance-critical   '("#bf616a" "#af5f5f" "red"))

  (base0           '("#ffffff" "#ffffff" "white"))
  (base1           '("#eceff4" "#eeeeee" "brightcyan"))
  (base2           '("#d1d4da" "#d7d7d7" "brightblack"))
  (base3           '("#b6bac1" "#bcbcbc" "brightblack"))
  (base4           '("#9b9fa7" "#9e9e9e" "brightblack"))
  (base5           '("#7f848d" "#878787" "brightblack"))
  (base6           '("#646973" "#6c6c6c" "brightblack"))
  (base7           '("#494f5a" "#4e4e4e" "brightblack"))
  (base8           '("#2e3440" "#303030" "black"))

  (bright-blue     '("#b8c9e0" "#afd7ff" "brightblue"))
  (bright-cyan     '("#b7e1e8" "#afd7d7" "brightcyan"))
  (bright-green    '("#cfe3c1" "#afd7af" "brightgreen"))
  (bright-magenta  '("#dac7dd" "#d7afd7" "brightmagenta"))
  (bright-red      '("#e3b8be" "#d7afaf" "brightred"))
  (bright-violet   '("#c7c9e3" "#d7d7ff" "brightviolet"))
  (bright-white    temperance-background)
  (bright-yellow   '("#f2e7c0" "#d7d7af" "brightyellow"))

  (blue            '("#81a1c1" "#87afd7" "blue"))
  (cyan            '("#88c0d0" "#87afaf" "cyan"))
  (dark-blue       '("#5e81ac" "#5f87af" "blue"))
  (dark-cyan       '("#4c6a6a" "#005f5f" "cyan"))
  (green           '("#a3be8c" "#87af87" "green"))
  (grey            base4)
  (magenta         '("#b48ead" "#af87af" "magenta"))
  (orange          '("#d08770" "#d7875f" "orange"))
  (red             '("#bf616a" "#af5f5f" "red"))
  (teal            '("#8fbcbb" "#87afaf" "teal"))
  (violet          '("#8b8fc0" "#8787af" "violet"))
  (white           temperance-subtle)
  (yellow          '("#ebcb8b" "#ffd787" "yellow"))

  (strings         base6))

 (;; The cursor is too easy to miss. Make it pop.
  (cursor :foreground bg :background temperance-popout)
  ;; Line numbers draw too much attention. Dim them.
  (line-number              :foreground base4)
  (line-number-current-line :foreground fg)))

(provide 'doom-temperance-nord-light-theme)

;;; doom-temperance-nord-light-theme.el ends here
