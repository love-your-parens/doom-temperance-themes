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
;; Homepage         : https://github.com/love-your-parens/doom-temperance-themes
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
  (temperance-foreground '("#37474f" "#444444" "brightblack"))
  (temperance-background '("#ffffff" "#ffffff" "brightwhite"))
  (temperance-highlight  '("#fafafa" "#ffffff" "brightblack"))
  (temperance-subtle     '("#eceff1" "#eeeeee" "brightcyan"))
  (temperance-faded      '("#90a4ae" "#9e9e9e" "cyan"))
  (temperance-salient    '("#673ab7" "#8700d7" "purple"))
  (temperance-strong     '("#263238" "#303030" "brightblack"))
  (temperance-popout     '("#ffab91" "#ffaf87" "yellow"))
  (temperance-critical   '("#ff6f00" "#ff5f00" "brightyellow"))

  (base0          '("#ffffff" "#ffffff" "white"))
  (base1          '("#e0e0e0" "#e4e4e4" "brightblack"))
  (base2          '("#c1c1c1" "#c6c6c6" "brightblack"))
  (base3          '("#a3a3a3" "#a8a8a8" "brightblack"))
  (base4          '("#848484" "#878787" "brightblack"))
  (base5          '("#666666" "#626262" "brightblack"))
  (base6          '("#474747" "#444444" "brightblack"))
  (base7          '("#282828" "#262626" "brightblack"))
  (base8          '("#000000" "#000000" "black"))

  (bright-blue    '("#bbdefb" "#afd7ff" "brightblue"))
  (bright-cyan    '("#b2ebf2" "#afd7d7" "brightcyan"))
  (bright-green   '("#c8e6c9" "#afd7af" "brightgreen"))
  (bright-magenta '("#e1bee7" "#d7afd7" "brightmagenta"))
  (bright-red     '("#ffcdd2" "#ffd7d7" "brightred"))
  (bright-white   temperance-background)
  (bright-yellow  '("#fff9c4" "#ffffd7" "brightyellow"))

  (blue           '("#42a5f5" "#5fafff" "blue"))
  (cyan           '("#26c6da" "#00d7ff" "cyan"))
  (dark-blue      '("#a0bcf8" "#87afff" "blue"))
  (dark-cyan      '("#005478" "#005f87" "cyan"))
  (green          '("#66bb6a" "#5faf5f" "green"))
  (grey           base4)
  (magenta        '("#ab47bc" "#af5faf" "magenta"))
  (orange         '("#da8548" "#d7875f" "brightred"))
  (red            '("#ef5350" "#ff5f5f" "red"))
  (teal           '("#4db5bd" "#5fafaf" "brightgreen"))
  (violet         '("#b751b6" "#af5faf" "brightmagenta"))
  (white           temperance-subtle)
  (yellow         '("#e2c12f" "#d7af00" "yellow"))))

(provide 'doom-temperance-nano-light-theme)

;;; doom-temperance-nano-light-theme.el ends here
