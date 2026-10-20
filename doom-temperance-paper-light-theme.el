;;; doom-temperance-paper-light-theme.el --- Warm white, paper-like theme with blue accents -*- lexical-binding: t; no-byte-compile: t; -*-

;; Copyright (C) 2026 Konrad Wątor <konrad@wator.it>

;; Author           : Konrad Wątor
;; Created          : October 2026
;; License          : GNU GPLv3
;; Package-Requires : ((emacs "28") (doom-themes "2"))
;; Version          : 0.1
;; Homepage         : https://github.com/love-your-parens/doom-temperance-themes
;;
;;; Commentary:
;; The package provides a minimalistic, off-white theme meant to evoke the feeling of graph paper.
;; Colours first inspired by the landing page for the Paper Mono open source font: paper.design

;;; Code:

;; `load-theme' resolves this file via `custom-theme-load-path', which
;; does not add its directory to `load-path' -- so `require' cannot
;; find a sibling file here unless we add it ourselves first.
(let ((dir (file-name-directory (or load-file-name buffer-file-name))))
  (unless (member dir load-path)
    (add-to-list 'load-path dir)))
(require 'doom-temperance-common)

(def-doom-temperance-theme
 doom-temperance-paper-light
 "A warm-leaning light theme for Doom Emacs with blue accents."
 ((temperance-foreground '("#181818" "#1c1c1c" "brightblack"))
  (temperance-background '("#f6f6f3" "#eeeeee" "brightwhite"))
  (temperance-highlight  '("#eeeeeb" "#e4e4e4" "brightcyan"))
  (temperance-subtle     '("#e5e6e3" "#e4e4e4" "brightcyan"))
  (temperance-faded      '("#909090" "#949494" "brightblack"))
  (temperance-salient    '("#4a8bea" "#0087ff" "brightblue"))
  (temperance-strong     '("#111111" "#121212" "black"))
  (temperance-popout     '("#df9a00" "#d78700" "orange"))
  (temperance-critical   '("#cf304f" "#d7005f" "red"))

  (base0           '("#ffffff" "#ffffff" "white"))
  (base1           '("#ecefef" "#eeeeee" "brightcyan"))
  (base2           '("#d1d4d4" "#d0d0d0" "brightblack"))
  (base3           '("#b6baba" "#bcbcbc" "brightblack"))
  (base4           '("#9b9f9f" "#9e9e9e" "brightblack"))
  (base5           '("#7f8484" "#808080" "brightblack"))
  (base6           '("#646970" "#6c6c6c" "brightblack"))
  (base7           '("#494f51" "#4e4e4e" "brightblack"))
  (base8           '("#2e3436" "#303030" "black"))

  (bright-blue     '("#81acec" "#87afff" "brightblue"))
  (bright-cyan     '("#81bfec" "#87afd7" "brightcyan"))
  (bright-green    base3)
  (bright-magenta  base3)
  (bright-red      '("#ffa0a0" "#ffafaf" "brightred"))
  (bright-violet   base3)
  (bright-white    temperance-background)
  (bright-yellow   '("#f2e7c0" "#d7d7af" "brightyellow"))

  (blue            '("#4a8bea" "#0087ff" "blue"))
  (cyan            '("#4aabea" "#00afff" "cyan"))
  (dark-blue       '("#394f6f" "#005f87" "blue"))
  (dark-cyan       '("#40585f" "#585858" "cyan"))
  (green           '("#494f5a" "#4e4e4e" "green"))
  (grey            base3)
  (magenta         base3)
  (orange          temperance-popout)
  (red             temperance-critical)
  (teal            base3)
  (violet          base3)
  (white           temperance-subtle)
  (yellow          '("#e0b000" "#d7af00" "yellow"))

  (strings         base6))

 (;; The cursor is too easy to miss. Make it pop.
  (cursor :foreground bg :background bright-blue)
  ;; Line numbers draw too much attention. Dim them.
  (line-number              :foreground base4)
  (line-number-current-line :foreground fg)))

(provide 'doom-temperance-paper-light-theme)

;;; doom-temperance-paper-light-theme.el ends here
