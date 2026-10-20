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
;; Version          : 0.1.1
;; Homepage         : https://github.com/love-your-parens/doom-temperance-themes
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
  ;; Some colors for the 16-color mode were obtained from the Doom Nord theme.
  (temperance-foreground '("#eceff4" "#eeeeee" "white"))
  (temperance-background '("#2e3440" "#303030" "black"))
  (temperance-highlight  '("#3b4252" "#444444" "brightblack"))
  (temperance-subtle     '("#434c5e" "#4e4e4e" "brightblack"))
  (temperance-faded      '("#8a9ab4" "#87afd7" "cyan"))
  (temperance-salient    '("#81a1c1" "#87afd7" "brightblue"))
  (temperance-strong     '("#f0f0f4" "#eeeeee" "brightwhite"))
  (temperance-popout     '("#d08770" "#d7875f" "brightred"))
  (temperance-critical   '("#ebcb8b" "#ffd787" "yellow"))

  (base0           '("#191c25" "#1c1c1c" "black"))
  (base1           '("#242832" "#262626" "brightblack"))
  (base2           '("#2c333f" "#303030" "brightblack"))
  (base3           '("#373e4c" "#3a3a3a" "brightblack"))
  (base4           '("#434c5e" "#4e4e4e" "brightblack"))
  (base5           '("#4c566a" "#5f5f87" "brightblack"))
  (base6           '("#9099ab" "#949494" "brightblack"))
  (base7           '("#d8dee9" "#dadada" "brightblack"))
  (base8           '("#f0f4fc" "#eeeeee" "white"))

  (blue            temperance-salient)
  (cyan            '("#88c0df" "#87d7ff" "cyan"))
  (green           base6)
  (grey            base4)
  (magenta         base6)
  (orange          temperance-critical)
  (red             temperance-popout)
  (teal            base6)
  (violet          base6)
  (white           temperance-foreground)
  (yellow          temperance-critical)

  (bright-blue     '("#bbdefb" "#afd7ff" "brightblue"))
  (bright-cyan     '("#b2e0fa" "#afd7ff" "brightcyan"))
  (bright-green    base7)
  (bright-magenta  base7)
  (bright-red      '("#ffcda2" "#ffd7af" "brightred"))
  (bright-violet   base7)
  (bright-white    base8)
  (bright-yellow   '("#fff0ba" "#ffffd7" "brightyellow"))

  (dark-blue       '("#5e81ac" "#5f87af" "blue"))
  (dark-cyan       '("#5699bf" "#5fafd7" "cyan"))

  ;; Give distinction to strings.
  (strings         bright-blue))

 (;; Line numbers draw too much attention. Dim them.
  (line-number              :foreground base5)
  (line-number-current-line :foreground fg)
  (magit-tag                :foreground bright-blue)))

(provide 'doom-temperance-nano-dark-theme)

;;; doom-temperance-nano-dark-theme.el ends here
