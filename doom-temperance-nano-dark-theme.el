;;; doom-temperance-nano-dark-theme.el --- Dark theme for Doom Emacs based on N Λ N O -*- lexical-binding: t; no-byte-compile: t; -*-

;; Copyright (C) 2026 Konrad Wątor <konrad@wator.it>

;; This package is an interpretation of N Λ N O theme by Nicolas P. Rougier
;; <Nicolas.Rougier@inria.fr> using doom-themes framework, built upon the work
;; of Ronan Arraes Jardim Chagas <https://github.com/ronisbr/doom-nano-themes/>
;;
;; Author           : Konrad Wątor
;; Created          : September 2026
;; License          : GNU GPLv3
;; Package-Requires : ((emacs "28") (doom-themes "2"))
;; Version          : 0.1
;;
;;; Commentary:
;; This package provides a dark theme for Doom Emacs based on N Λ N O.
;;
;; Only the base palette lives here.  Faces are derived from it by
;; `doom-temperance-common.el'.  Visit the file for the how & why.
;;
;;; Code:

;; `load-theme' resolves this file via `custom-theme-load-path', which
;; does not add its directory to `load-path' -- so `require' cannot
;; find a sibling file here unless we add it ourselves first.
(let ((dir (file-name-directory (or load-file-name buffer-file-name))))
  (unless (member dir load-path)
    (add-to-list 'load-path dir)))
(require 'doom-temperance-common)

(def-doom-temperance-theme
 doom-temperance-nano-dark
 "A dark theme for Doom Emacs based on N Λ N O."
 (;; Colors defined by N Λ N O theme.
  ;; Some colors for the 256 and 16 modes were obtained from the Doom Nord theme.
  (temperance-foreground '("#eceff4" "#ececec" "white"))
  (temperance-background '("#2e3440" "#2e2e2e" "black"))
  (temperance-highlight  '("#3b4252" "#262626" "brightblack"))
  (temperance-subtle     '("#434c5e" "#3f3f3f" "brightblack"))
  (temperance-faded      '("#8a9ab4" "#677691" "cyan"))
  (temperance-salient    '("#81a1c1" "#51afef" "brightblue"))
  (temperance-strong     '("#f0f0f4" "#ffffff" "brightwhite"))
  (temperance-popout     '("#d08770" "#dd8844" "brightred"))
  (temperance-critical   '("#ebcb8b" "#ecbe7b" "yellow"))

  (base0           '("#191c25" "black"   "black"))
  (base1           '("#242832" "#1e1e1e" "brightblack"))
  (base2           '("#2c333f" "#2e2e2e" "brightblack"))
  (base3           '("#373e4c" "#262626" "brightblack"))
  (base4           '("#434c5e" "#3f3f3f" "brightblack"))
  (base5           '("#4c566a" "#525252" "brightblack"))
  (base6           '("#9099ab" "#6b6b6b" "brightblack"))
  (base7           '("#d8dee9" "#979797" "brightblack"))
  (base8           '("#f0f4fc" "#dfdfdf" "white"))

  (bright-blue     '("#bbdefb" "#bbdefb" "brightblue"))
  (bright-cyan     '("#b2ebf2" "#b2ebf2" "brightcyan"))
  (bright-green    '("#c8e6c9" "#c8e6c9" "brightgreen"))
  (bright-magenta  '("#e1bee7" "#e1bee7" "brightmagenta"))
  (bright-red      '("#ffcdd2" "#ffcdd2" "brightred"))
  (bright-violet   '("#cdc5dd" "#cdc5dd" "brightviolet"))
  (bright-white    temperance-background)
  (bright-yellow   '("#fff9c4" "#fff9c4" "brightyellow"))

  (blue            '("#81a1c1" "#42a5f5" "blue"))
  (cyan            '("#88c0d0" "#26c6da" "cyan"))
  (dark-blue       '("#5e81ac" "#a0bcf8" "blue"))
  (dark-cyan       '("#5699af" "#005478" "cyan"))
  (green           '("#a3be8c" "#66bb6a" "green"))
  (grey            base4)
  (magenta         '("#b48ead" "#ab47bc" "magenta"))
  (orange          '("#d08770" "#dd8844" "orange"))
  (red             '("#bf616a" "#ef5350" "red"))
  (teal            '("#8fbcbb" "#44b9b1" "teal"))
  (violet          '("#9e8eb4" "#b751b6" "violet"))
  (white           temperance-foreground)
  (yellow          '("#ebcb8b" "#ffee58" "yellow"))

  ;; Local overrides - the spice.
  (strings         bright-blue)))

(provide 'doom-temperance-nano-dark-theme)

;;; doom-temperance-nano-dark-theme.el ends here
