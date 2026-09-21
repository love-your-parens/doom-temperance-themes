;;; doom-temperance-nano-light-theme.el --- Light theme for Doom Emacs based on N Λ N O -*- lexical-binding: t; no-byte-compile: t; -*-

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
;; This package provides a light theme for Doom Emacs based on N Λ N O.
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
 doom-temperance-nano-light
 "A light theme for Doom Emacs based on N Λ N O."
 (;; Colors defined by N Λ N O theme.
  (temperance-foreground '("#37474f" "#37474f" "brightblack"))
  (temperance-background '("#ffffff" "#ffffff" "brightwhite"))
  (temperance-highlight  '("#fafafa" "#fafafa" "brightblack"))
  (temperance-subtle     '("#eceff1" "#eceff1" "brightcyan"))
  (temperance-faded      '("#90a4ae" "#90a4ae" "cyan"))
  (temperance-salient    '("#673ab7" "#673ab7" "purple"))
  (temperance-strong     '("#263238" "#263238" "brightblack"))
  (temperance-popout     '("#ffab91" "#ffab91" "yellow"))
  (temperance-critical   '("#ff6f00" "#ff6f00" "brightyellow"))

  (base0          '("#ffffff" "#ffffff" "white"))
  (base1          '("#e0e0e0" "#e0e0e0" "brightblack"))
  (base2          '("#c1c1c1" "#c1c1c1" "brightblack"))
  (base3          '("#a3a3a3" "#a3a3a3" "brightblack"))
  (base4          '("#848484" "#848484" "brightblack"))
  (base5          '("#666666" "#666666" "brightblack"))
  (base6          '("#474747" "#474747" "brightblack"))
  (base7          '("#282828" "#282828" "brightblack"))
  (base8          '("#000000" "#000000" "black"))

  (bright-blue    '("#bbdefb" "#bbdefb" "brightblue"))
  (bright-cyan    '("#b2ebf2" "#b2ebf2" "brightcyan"))
  (bright-green   '("#c8e6c9" "#c8e6c9" "brightgreen"))
  (bright-magenta '("#e1bee7" "#e1bee7" "brightmagenta"))
  (bright-red     '("#ffcdd2" "#ffcdd2" "brightred"))
  (bright-white   temperance-background)
  (bright-yellow  '("#fff9c4" "#fff9c4" "brightyellow"))

  (blue           '("#42a5f5" "#42a5f5" "blue"))
  (cyan           '("#26c6da" "#26c6da" "cyan"))
  (dark-blue      '("#a0bcf8" "#a0bcf8" "blue"))
  (dark-cyan      '("#005478" "#005478" "cyan"))
  (green          '("#66bb6a" "#66bb6a" "green"))
  (grey           base4)
  (magenta        '("#ab47bc" "#ab47bc" "magenta"))
  (orange         '("#da8548" "#dd8844" "brightred"))
  (red            '("#ef5350" "#ef5350" "red"))
  (teal           '("#4db5bd" "#44b9b1" "brightgreen"))
  (violet         '("#b751b6" "#b751b6" "brightmagenta"))
  (white           temperance-subtle)
  (yellow         '("#e2c12f" "#e2c12f" "yellow"))))

(provide 'doom-temperance-nano-light-theme)

;;; doom-temperance-nano-light-theme.el ends here
