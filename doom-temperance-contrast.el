;;; doom-temperance-contrast.el --- WCAG contrast-ratio helper for palette authoring -*- lexical-binding: t; -*-

;; This is a development utility, not part of the shipped theme: nothing in
;; doom-temperance-common.el or any doom-temperance-*-theme.el requires it,
;; and it has no business being loaded by anyone just using the themes.
;; Load it by hand when picking or reviewing palette colors (`M-x load-file',
;; or `eval-buffer' from this file), then call `doom-temperance-contrast'
;; from the REPL, e.g. via `M-x ielm' or `eval-expression':
;;
;;   (doom-temperance-contrast "#a0a8b6" "#2e3440")
;;   (doom-temperance-contrast '("#d8dee9" "#d8dee9" "white") "#2e3440")

;;; Commentary:

;; Computes the WCAG 2.x contrast ratio between two colors, accepting
;; whatever shape they happen to be in:
;; - a hex string ("#rrggbb" or "#rgb"),
;; - a named color ("red", "LightSlateGray", ...),
;; - a `color-values'-style list of three 16-bit integers (0-65535),
;; - a `color-name-to-rgb'-style list of three floats (0.0-1.0), or
;; - this repo's own `doom-themes' display triple (GUI-HEX 256-HEX
;;   TTY-NAME); only the first (GUI) element is used.
;;
;; `color-srgb-to-xyz' (built into Emacs' `color.el') already does the sRGB
;; gamma-decoding WCAG luminance needs -- its Y channel is relative
;; luminance by construction -- so this file only adds input normalization
;; and the ratio formula on top.
;;
;; Hex strings are parsed by hand rather than via `color-name-to-rgb':
;; that function (and `color-values' underneath it) resolves colors
;; against the *selected frame*, and under `emacs --batch' with no
;; frame/display it silently returns (0.0 0.0 0.0) or (1.0 1.0 1.0) for a
;; hex string instead of erroring -- a wrong-answer-not-an-error failure
;; mode that's much worse than it sounds, given hex is the most common
;; shape a color takes in this repo. Only bare named colors ("red", ...)
;; still go through `color-name-to-rgb', since resolving a name at all
;; inherently requires Emacs' color database; that path still needs a
;; live frame.

;;; Code:

(require 'color)
(require 'seq)
(require 'pcase)

(defun doom-temperance--hex-to-rgb (hex)
  "Parse HEX (\"#rgb\" or \"#rrggbb\") into a (R G B) list of floats in [0.0, 1.0]."
  (let* ((digits (substring hex 1)))
    (pcase (length digits)
      (3 (mapcar (lambda (d) (/ (* 17.0 (string-to-number (char-to-string d) 16))
                                 255.0))
                 digits))
      (6 (list (/ (string-to-number (substring digits 0 2) 16) 255.0)
               (/ (string-to-number (substring digits 2 4) 16) 255.0)
               (/ (string-to-number (substring digits 4 6) 16) 255.0)))
      (_ (error "Malformed hex color: %S" hex)))))

(defun doom-temperance--color-to-rgb (color)
  "Normalize COLOR to a (R G B) list of floats in [0.0, 1.0].

See `doom-temperance-contrast' for the color shapes COLOR may take."
  (cond
   ;; A doom-themes display triple: (GUI-HEX 256-HEX TTY-NAME). Recurse on
   ;; just the GUI element.
   ((and (consp color) (= (length color) 3)
         (stringp (car color)) (string-prefix-p "#" (car color)))
    (doom-temperance--color-to-rgb (car color)))
   ;; A color-values-style 16-bit triple, or a color-name-to-rgb-style
   ;; normalized float triple. Distinguished by range: real colors never
   ;; have every channel <= 1 at the 16-bit scale, so treat an all-<=1
   ;; triple as already normalized.
   ((and (consp color) (= (length color) 3) (seq-every-p #'numberp color))
    (if (seq-every-p (lambda (c) (<= 0 c 1.0)) color)
        color
      (mapcar (lambda (c) (/ (float c) 65535)) color)))
   ;; A hex string, parsed by hand -- see the Commentary on why this
   ;; doesn't go through `color-name-to-rgb'.
   ((and (stringp color) (string-prefix-p "#" color))
    (doom-temperance--hex-to-rgb color))
   ;; A named color; this path does need a live frame to resolve.
   ((stringp color)
    (or (color-name-to-rgb color)
        (error "Not a recognized color: %S" color)))
   (t (error "Not a recognized color: %S" color))))

(defun doom-temperance--relative-luminance (color)
  "Return the WCAG relative luminance of COLOR.
COLOR is a value in any shape `doom-temperance-contrast' accepts."
  (pcase-let ((`(,r ,g ,b) (doom-temperance--color-to-rgb color)))
    (nth 1 (color-srgb-to-xyz r g b))))

(defun doom-temperance-contrast (color-a color-b)
  "Return the WCAG contrast ratio between COLOR-A and COLOR-B.

Each of COLOR-A and COLOR-B may be:
- a hex string (\"#rrggbb\" or \"#rgb\"),
- a named color (\"red\", \"LightSlateGray\", ...),
- a `color-values'-style list of three 16-bit integers (0-65535),
- a `color-name-to-rgb'-style list of three floats (0.0-1.0), or
- a `doom-themes' display triple (GUI-HEX 256-HEX TTY-NAME) -- its
  first (GUI) element is used.

The result is a float between 1.0 (no contrast) and 21.0 (black on
white). WCAG AA wants at least 4.5 for normal text (3.0 for large
text, 18pt+ or 14pt+ bold); AAA wants 7.0 (4.5 for large text)."
  (let ((l-a (doom-temperance--relative-luminance color-a))
        (l-b (doom-temperance--relative-luminance color-b)))
    (/ (round (* 100 (/ (+ (max l-a l-b) 0.05)
                        (+ (min l-a l-b) 0.05))))
       100.0)))

(provide 'doom-temperance-contrast)

;;; doom-temperance-contrast.el ends here
