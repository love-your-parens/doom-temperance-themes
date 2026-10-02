;;; doom-temperance-common.el --- Shared face template for Temperance Doom themes -*- lexical-binding: t; no-byte-compile: t; -*-

;; Copyright (C) 2026 Konrad Wątor <konrad@wator.it>

;; This package is a collection of minimalistic Doom Emacs themes with reduced
;; semantic embellishments, and a limited colour palette.
;;
;; Author           : Konrad Wątor
;; Created          : September 2026
;; License          : GNU GPLv3
;; Package-Requires : ((emacs "28") (doom-themes "2"))
;; Version          : 0.1
;;
;;; Acknowledgements:
;;
;; Originally an adaptation of the N Λ N O theme by Nicolas P. Rougier
;; <Nicolas.Rougier@inria.fr> using the `doom-themes' framework, built upon the
;; work of Ronan Arraes Jardim Chagas <https://github.com/ronisbr/doom-nano-themes/>
;;
;;; AI disclaimer:
;;
;; This package was *not* AI-generated, but AI *was* employed to assist in its development.
;;
;;; Commentary:
;;
;; The chief principle applied throughout the suite is restraint: a page of text
;; should read more like typeset prose, and less like an attention-grabbing piece
;; of advertisement, which popular syntax-highlighting systems often resemble.
;; Only a handful of roles are ever drawn in a color other than the body text.
;;
;; Rougier's NANO suite names those roles `default', `subtle', `faded',
;; `salient', `strong', `popout' and `critical'.
;;
;; Here, we use:
;; `temperance-foreground'/`temperance-background', `temperance-highlight',
;; `temperance-subtle', `temperance-faded', `temperance-salient',
;; `temperance-strong', `temperance-popout' and `temperance-critical'.
;; This framework is not absolute and I will apply discretion. Code is not prose.
;;
;; This file is the shared template behind every doom-temperance-* variant.
;;
;; A concrete variant (doom-temperance-nano-dark, doom-temperance-nord-light
;; etc) therefore only has to define colors: those nine accents, the
;; `base0'-`base8' grey ramp, and the small set of extra accent colors (`blue',
;; `green', `orange', ...) needed to satisfy ANSI/vterm's fixed 16-color model.
;;
;; Every "required" doom-themes slot (`comments', `constants', `region',
;; `vc-added', ...) and the entire multi-hundred line package face list are
;; derived from those nine accents once, here, via `doom-temperance-common-defs'
;; and `doom-temperance-common-faces'.
;;
;; `def-doom-temperance-theme' below splices the two in automatically, so a new
;; variant is just a palette plus one macro call, see: `doom-temperance-nano-dark-theme.el'
;; or `doom-temperance-nano-light-theme.el' for the minimal shape this produces.
;;
;; TODO support ghostel
;;
;;; Code:

(require 'doom-themes)

;;
;;; Customization

(defgroup doom-temperance-theme nil
  "Options for the `doom-temperance' theme family."
  :group 'doom-themes)

(defcustom doom-temperance-theme-highlight-tab-whitespaces nil
  "If non-nil, the tab whitespaces will be highlighted."
  :group 'doom-temperance-theme
  :type 'boolean)


;;
;;; Derived semantic slots

(defconst doom-temperance-common-defs
  '(;; `bg'/`fg' and their solaire-mode "-alt" companions are just
    ;; renamed views of three of the nine accents.
    (bg           temperance-background)
    (fg           temperance-foreground)
    (bg-alt       temperance-highlight)
    (fg-alt       temperance-foreground)

    ;; The ~20 slots `doom-themes-base.el' expects every theme to
    ;; supply, collapsed onto the nine accents. Most syntax categories
    ;; fold onto `temperance-salient' or `temperance-strong' on purpose: N Λ N O
    ;; does not color code by token type, only by how much attention a
    ;; token deserves.
    (highlight    temperance-highlight)
    (vertical-bar temperance-background)
    (selection    temperance-subtle)
    (builtin      temperance-salient)
    (comments     temperance-faded)
    (doc-comments temperance-faded)
    (constants    temperance-salient)
    (functions    temperance-strong)
    (keywords     temperance-salient)
    (methods      temperance-strong)
    (operators    temperance-salient)
    (type         temperance-salient)
    (strings      temperance-faded)
    (variables    temperance-salient)
    (numbers      temperance-salient)
    (region       temperance-subtle)
    (error        temperance-critical)
    (warning      temperance-popout)
    (success      temperance-salient)
    (vc-modified  temperance-popout)
    (vc-added     temperance-salient)
    (vc-deleted   temperance-faded)

    (-modeline-pad
     (when doom-themes-padded-modeline
       (if (integerp doom-themes-padded-modeline) doom-themes-padded-modeline 4))))

  "Semantic doom-themes slots, expressed in terms of the nine `temperance-*' accents.
Appended after a variant's own palette so every name here is already bound by
the time it's used.")


;;
;;; Package face list

(defconst doom-temperance-common-faces
  '(;; === Base =================================================================

    (cursor :foreground bg :background fg)
    (mouse  :foreground fg :background bg)

    ;; === General ==============================================================

    (buffer-menu-buffer           :foreground temperance-strong :weight 'bold)
    (completions-annotations      :foreground temperance-faded)
    (completions-common-part      :foreground temperance-strong :weight 'bold)
    (completions-first-difference :foreground fg)
    (fill-column-indicator        :foreground temperance-subtle)
    (help-argument-name           :foreground temperance-faded)
    (isearch                      :foreground temperance-strong :weight 'bold)
    (isearch-fail                 :foreground temperance-faded)
    (lazy-highlight               :background temperance-subtle)
    (minibuffer-prompt            :foreground temperance-strong :weight 'bold)
    (nobreak-hyphen               :foreground temperance-popout)
    (nobreak-space                :foreground temperance-popout)
    (read-multiple-choice-face    :foreground temperance-strong :weight 'bold)
    (secondary-selection          :background temperance-subtle)
    (show-paren-match             :foreground temperance-popout :weight 'bold)
    (show-paren-mismatch          :foreground temperance-critical)
    (tabulated-list-fake-header   :foreground temperance-strong :weight 'bold)
    (tool-bar                     :foreground bg :background temperance-faded)
    (tooltip                      :background temperance-subtle)
    (trailing-whitespace          :background temperance-subtle)
    (doom-dashboard-menu-title    :foreground temperance-salient)
    (doom-dashboard-menu-desc     :foreground temperance-foreground)
    (doom-dashboard-footer-icon   :foreground temperance-faded)
    (+dashboard-menu-title        :foreground temperance-salient)
    (+dashboard-menu-desc         :foreground temperance-foreground)
    (+dashboard-footer-icon       :foreground temperance-faded)
    (header-line                  :inherit 'mode-line :background bg :box `(:line-width 3 :color ,bg) :height 0.8)
    (solaire-header-line-face     :inherit 'solaire-default-face :box `(:line-width 3 :style flat-button) :height 0.8)

    (whitespace-tab :background
                    (if doom-temperance-theme-highlight-tab-whitespaces
                        temperance-subtle
                      bg))

    ;; === Ace window ===========================================================

    (aw-leading-char-face :foreground temperance-popout)
    (aw-background-face   :foreground temperance-faded :background bg)

    ;; === ANSI colors ==========================================================

    (ansi-color-black          :foreground fg)
    (ansi-color-bold           :foreground temperance-strong :weight 'bold)
    (ansi-color-bright-black   :foreground temperance-faded :weight 'bold)
    (ansi-color-faint          :foreground temperance-faded)
    (ansi-color-fast-blink     :foreground temperance-faded)
    (ansi-color-slow-blink     :foreground temperance-faded)
    (ansi-color-inverse        :foreground bg :background fg)
    (ansi-color-italic         :foreground fg :slant 'italic)
    (ansi-color-underline      :foreground temperance-faded)
    (ansi-color-blue           :foreground blue)
    (ansi-color-bright-blue    :foreground bright-blue)
    (ansi-color-cyan           :foreground cyan)
    (ansi-color-bright-cyan    :foreground bright-cyan)
    (ansi-color-green          :foreground green)
    (ansi-color-bright-green   :foreground bright-green)
    (ansi-color-magenta        :foreground magenta)
    (ansi-color-bright-magenta :foreground bright-magenta)
    (ansi-color-red            :foreground red)
    (ansi-color-bright-red     :foreground bright-red)
    (ansi-color-white          :foreground white)
    (ansi-color-bright-white   :foreground bright-white)
    (ansi-color-yellow         :foreground yellow)
    (ansi-color-bright-yellow  :foreground bright-yellow)

    ;; === Buttons ==============================================================

    (button                             :foreground temperance-faded :background temperance-highlight :box nil)
    ((custom-button &override)          :foreground temperance-faded :background temperance-highlight :box nil)
    ((custom-button-unraised &override) :foreground temperance-faded :background temperance-highlight :box nil)
    ((custom-button-mouse &override)    :foreground fg :background temperance-subtle :box nil)
    ((custom-button-pressed &override)  :foreground bg :background fg :box nil)

    ;; === Custom edit ==========================================================

    (custom-changed           :foreground temperance-salient)
    (custom-comment           :foreground temperance-faded)
    (custom-comment-tag       :foreground temperance-faded)
    (custom-face-tag          :foreground temperance-strong :weight 'bold)
    (custom-group-subtitle    :foreground temperance-strong :weight 'bold)
    (custom-group-tag         :foreground temperance-strong :weight 'bold)
    (custom-group-tag-1       :foreground temperance-strong :weight 'bold)
    (custom-invalid           :foreground temperance-popout)
    (custom-link              :foreground temperance-salient)
    (custom-modified          :foreground temperance-salient)
    (custom-state             :foreground temperance-salient)
    (custom-variable-obsolete :foreground temperance-faded)
    (custom-variable-tag      :foreground temperance-strong :weight 'bold)
    (custom-visibility        :foreground temperance-salient)
    (widget-button            :foreground temperance-strong :weight 'bold)
    (widget-field             :background base2)
    (widget-single-line-field :background base2)

    ;; === Company tooltip ======================================================

    (company-scrollbar-bg                 :foreground bg :background temperance-faded)
    (company-scrollbar-fg                 :foreground bg :background fg)
    (company-tooltip                      :background temperance-subtle)
    (company-tooltip-annotation           :foreground fg)
    (company-tooltip-annotation-selection :background temperance-salient)
    (company-tooltip-common               :foreground temperance-strong :weight 'bold)
    (company-tooltip-common-selection     :foreground bg :background temperance-salient :weight 'normal)
    (company-tooltip-mouse                :foreground bg :background temperance-faded)
    (company-tooltip-scrollbar-thumb      :foreground bg :background fg)
    (company-tooltip-scrollbar-track      :foreground bg :foreground temperance-faded)
    (company-tooltip-selection            :foreground bg :background temperance-salient)

    ;; === Diff =================================================================

    (diff-header         :foreground temperance-faded)
    (diff-file           :foreground temperance-strong :weight 'bold)
    (diff-context        :foreground fg)
    (diff-removed        :foreground temperance-faded)
    (diff-changed        :foreground temperance-popout)
    (diff-added          :foreground temperance-salient)
    (diff-refine-added   :foreground temperance-salient :weight 'bold)
    (diff-refine-changed :foreground temperance-popout)
    (diff-refine-removed :foreground temperance-faded :strike-through t)

    ;; === Dired ================================================================

    (diredfl-dir-name :foreground temperance-salient)
    (diredfl-date-time :foreground temperance-strong)
    (diredfl-number :foreground fg :weight 'bold)
    (diredfl-read-priv :foreground fg)
    (diredfl-write-priv :foreground temperance-critical)
    (diredfl-exec-priv :foreground temperance-popout)
    (diredfl-dir-priv :foreground temperance-salient)
    (dired-header :foreground fg :weight 'bold :height 1.25)

    ;; === Dirvish ==============================================================

    (dirvish-hl-line :foreground fg :background temperance-highlight)

    ;; === Doom NANO modeline ===================================================

    (doom-nano-modeline-evil-emacs-state-face    :foreground bg :background temperance-faded)
    (doom-nano-modeline-evil-insert-state-face   :foreground bg :background temperance-popout)
    (doom-nano-modeline-evil-motion-state-face   :foreground bg :background temperance-faded)
    (doom-nano-modeline-evil-normal-state-face   :foreground bg :background temperance-faded)
    (doom-nano-modeline-evil-operator-state-face :foreground bg :background temperance-faded)
    (doom-nano-modeline-evil-replace-state-face  :foreground bg :background temperance-critical)
    (doom-nano-modeline-evil-visual-state-face   :foreground bg :background temperance-salient)
    (doom-nano-modeline-inactive-face            :foreground temperance-faded :background temperance-highlight)

    ;; === Eww mode =============================================================
    (eww-valid-certificate :foreground temperance-salient)

    ;; === Evil mode ============================================================

    (evil-snipe-first-match-face :background temperance-highlight :weight 'bold)
    (evil-snipe-matches-face     :background temperance-subtle)
    (evil-ex-search              :foreground temperance-popout)

    ;; === Flycheck =============================================================

    (flycheck-posframe-background-face :background temperance-subtle)

    ;; === Font lock ============================================================

    (font-lock-variable-name-face :weight 'bold)
    (font-lock-function-name-face :foreground temperance-strong :weight 'bold)

    ;; === Info =================================================================

    (Info-quoted      :foreground temperance-faded)
    (info-header-node :foreground fg)
    (info-index-match :foreground temperance-salient)
    (info-menu-header :foreground temperance-strong :weight 'bold)
    (info-menu-star   :foreground fg)
    (info-node        :foreground temperance-strong :weight 'bold)
    (info-title-1     :foreground temperance-strong :weight 'bold)
    (info-title-2     :foreground temperance-strong :weight 'bold)
    (info-title-3     :foreground temperance-strong :weight 'bold)
    (info-title-4     :foreground temperance-strong :weight 'bold)

    ;; === Helpful ==============================================================

    (helpful-heading :foreground temperance-strong :weight 'bold)

    ;; === Highlight indent guides ==============================================

    (highlight-indent-guides-f)

    ;; === Hydra ================================================================

    (hydra-face-red :foreground temperance-popout :weight 'bold)

    ;; === Line numbers =========================================================

    (line-number              :foreground temperance-faded)
    (line-number-current-line :foreground fg)
    (line-number-major-tick   :foreground temperance-faded)
    (line-number-minor-tick   :foreground temperance-faded)

    ;; === LSP ==================================================================

    (lsp-face-highlight-textual :background base1)

    ;; === Markdown =============================================================

    (markdown-blockquote-face         :foreground fg)
    (markdown-bold-face               :foreground temperance-strong :weight 'bold)
    (markdown-code-face               :foreground fg)
    (markdown-comment-face            :foreground temperance-faded)
    (markdown-footnote-marker-face    :foreground fg)
    (markdown-footnote-text-face      :foreground fg)
    (markdown-gfm-checkbox-face       :foreground fg)
    (markdown-header-delimiter-face   :foreground temperance-faded)
    (markdown-header-face             :foreground temperance-strong :weight 'bold)
    (markdown-header-face-1           :foreground temperance-strong :weight 'bold)
    (markdown-header-face-2           :foreground temperance-strong :weight 'bold)
    (markdown-header-face-3           :foreground temperance-strong :weight 'bold)
    (markdown-header-face-4           :foreground temperance-strong :weight 'bold)
    (markdown-header-face-5           :foreground temperance-strong :weight 'bold)
    (markdown-header-face-6           :foreground temperance-strong :weight 'bold)
    (markdown-header-rule-face        :foreground fg)
    (markdown-highlight-face          :foreground fg)
    (markdown-hr-face                 :foreground fg)
    (markdown-html-attr-name-face     :foreground fg)
    (markdown-html-attr-value-face    :foreground fg)
    (markdown-html-entity-face        :foreground fg)
    (markdown-html-tag-delimiter-face :foreground fg)
    (markdown-html-tag-name-face      :foreground fg)
    (markdown-inline-code-face        :foreground temperance-popout)
    (markdown-italic-face             :foreground temperance-faded :slant 'italic)
    (markdown-language-info-face      :foreground fg)
    (markdown-language-keyword-face   :foreground fg)
    (markdown-line-break-face         :foreground fg)
    (markdown-link-face               :foreground temperance-salient)
    (markdown-link-title-face         :foreground fg)
    (markdown-list-face               :foreground temperance-faded)
    (markdown-markup-face             :foreground temperance-faded)
    (markdown-math-face               :foreground fg)
    (markdown-metadata-key-face       :foreground temperance-faded)
    (markdown-metadata-value-face     :foreground temperance-faded)
    (markdown-missing-link-face       :foreground fg)
    (markdown-plain-url-face          :foreground fg)
    (markdown-pre-face                :foreground temperance-popout)
    (markdown-reference-face          :foreground temperance-salient)
    (markdown-strike-through-face     :foreground temperance-faded)
    (markdown-table-face              :foreground fg)
    (markdown-url-face                :foreground temperance-salient)

    ;; === Magit ================================================================

    (magit-bisect-bad                      :foreground fg)
    (magit-bisect-good                     :foreground fg)
    (magit-bisect-skip                     :foreground fg)
    (magit-blame-date                      :foreground fg)
    (magit-blame-dimmed                    :foreground fg)
    (magit-blame-hash                      :foreground temperance-faded)
    (magit-blame-heading                   :background temperance-subtle :weight 'bold)
    (magit-blame-highlight                 :background highlight)
    (magit-blame-margin                    :foreground fg)
    (magit-blame-name                      :foreground fg)
    (magit-blame-summary                   :foreground fg)
    (magit-branch-current                  :foreground temperance-salient :weight 'bold)
    (magit-branch-local                    :foreground temperance-salient)
    (magit-branch-remote                   :foreground temperance-salient)
    (magit-branch-remote-head              :foreground temperance-salient)
    (magit-branch-upstream                 :foreground temperance-salient)
    (magit-cherry-equivalent               :foreground fg)
    (magit-cherry-unmatched                :foreground fg)
    (magit-diff-added                      :foreground temperance-salient :weight 'bold)
    (magit-diff-added-highlight            :foreground temperance-salient :weight 'bold)
    (magit-diff-base                       :foreground fg)
    (magit-diff-base-highlight             :background highlight)
    (magit-diff-conflict-heading           :background temperance-subtle :weight 'bold)
    (magit-diff-context                    :foreground temperance-faded)
    (magit-diff-context-highlight          :foreground temperance-faded)
    (magit-diff-file-heading               :foreground temperance-strong :weight 'bold)
    (magit-diff-file-heading-highlight     :background highlight :weight 'bold)
    (magit-diff-file-heading-selection     :foreground fg)
    (magit-diff-hunk-heading               :background temperance-subtle)
    (magit-diff-hunk-heading-highlight     :foreground fg)
    (magit-diff-hunk-heading-selection     :foreground fg)
    (magit-diff-hunk-region                :foreground fg)
    (magit-diff-lines-boundary             :foreground fg)
    (magit-diff-lines-heading              :background temperance-subtle :weight 'bold)
    (magit-diff-our                        :foreground fg)
    (magit-diff-our-highlight              :background highlight)
    (magit-diff-removed                    :foreground temperance-popout :weight 'bold)
    (magit-diff-removed-highlight          :foreground temperance-popout :weight 'bold)
    (magit-diff-revision-summary           :foreground temperance-popout)
    (magit-diff-revision-summary-highlight :foreground fg)
    (magit-diff-their                      :foreground fg)
    (magit-diff-their-highlight            :background highlight)
    (magit-diff-whitespace-warning         :background temperance-subtle)
    (magit-diffstat-added                  :foreground fg)
    (magit-diffstat-removed                :foreground fg)
    (magit-dimmed                          :foreground temperance-faded)
    (magit-filename                        :foreground fg)
    (magit-hash                            :foreground temperance-faded)
    (magit-head                            :foreground fg)
    (magit-header-line                     :foreground fg)
    (magit-header-line-key                 :foreground fg)
    (magit-header-line-log-select          :foreground fg)
    (magit-keyword                         :foreground temperance-salient)
    (magit-keyword-squash                  :foreground temperance-salient)
    (magit-log-author                      :foreground fg)
    (magit-log-date                        :foreground fg)
    (magit-log-graph                       :foreground fg)
    (magit-mode-line-process               :foreground fg)
    (magit-mode-line-process-error         :foreground temperance-critical)
    (magit-process-ng                      :foreground fg)
    (magit-process-ok                      :foreground fg)
    (magit-reflog-amend                    :foreground fg)
    (magit-reflog-checkout                 :foreground fg)
    (magit-reflog-cherry-pick              :foreground fg)
    (magit-reflog-commit                   :foreground fg)
    (magit-reflog-merge                    :foreground fg)
    (magit-reflog-other                    :foreground fg)
    (magit-reflog-rebase                   :foreground fg)
    (magit-reflog-remote                   :foreground fg)
    (magit-reflog-reset                    :foreground fg)
    (magit-refname                         :foreground fg)
    (magit-refname-pullreq                 :foreground fg)
    (magit-refname-stash                   :foreground fg)
    (magit-refname-wip                     :foreground fg)
    (magit-section-heading                 :foreground temperance-salient :weight 'bold)
    (magit-section-heading-selection       :foreground fg)
    (magit-section-highlight               :background highlight)
    (magit-section-secondary-heading       :foreground fg)
    (magit-sequence-done                   :foreground fg)
    (magit-sequence-drop                   :foreground fg)
    (magit-sequence-exec                   :foreground fg)
    (magit-sequence-head                   :foreground fg)
    (magit-sequence-onto                   :foreground fg)
    (magit-sequence-part                   :foreground fg)
    (magit-sequence-pick                   :foreground fg)
    (magit-sequence-stop                   :foreground fg)
    (magit-signature-bad                   :foreground fg)
    (magit-signature-error                 :foreground fg)
    (magit-signature-expired               :foreground fg)
    (magit-signature-expired-key           :foreground fg)
    (magit-signature-good                  :foreground fg)
    (magit-signature-revoked               :foreground fg)
    (magit-signature-untrusted             :foreground fg)
    (magit-tag                             :foreground temperance-strong)
    (git-commit-comment-heading            :foreground fg :weight 'bold)
    (git-commit-comment-file               :foreground fg)
    (git-commit-comment-branch-local       :foreground temperance-salient)
    (git-commit-comment-branch-remote      :foreground temperance-salient)

    ;; === Marginalia ===========================================================

    (marginalia-archive         :foreground temperance-faded)
    (marginalia-char            :foreground temperance-faded)
    (marginalia-date            :foreground temperance-faded)
    (marginalia-documentation   :foreground temperance-faded)
    (marginalia-file-name       :foreground temperance-faded)
    (marginalia-file-owner      :foreground temperance-faded)
    (marginalia-file-priv-dir   :foreground temperance-faded)
    (marginalia-file-priv-exec  :foreground temperance-faded)
    (marginalia-file-priv-link  :foreground temperance-faded)
    (marginalia-file-priv-no    :foreground temperance-faded)
    (marginalia-file-priv-other :foreground temperance-faded)
    (marginalia-file-priv-rare  :foreground temperance-faded)
    (marginalia-file-priv-read  :foreground temperance-faded)
    (marginalia-file-priv-write :foreground temperance-faded)
    (marginalia-function        :foreground temperance-faded)
    (marginalia-installed       :foreground temperance-faded)
    (marginalia-key             :foreground temperance-faded)
    (marginalia-lighter         :foreground temperance-faded)
    (marginalia-list            :foreground temperance-faded)
    (marginalia-mode            :foreground temperance-faded)
    (marginalia-modified        :foreground temperance-faded)
    (marginalia-null            :foreground temperance-faded)
    (marginalia-number          :foreground temperance-faded)
    (marginalia-off             :foreground temperance-faded)
    (marginalia-on              :foreground temperance-faded)
    (marginalia-size            :foreground temperance-faded)
    (marginalia-string          :foreground temperance-faded)
    (marginalia-symbol          :foreground temperance-faded)
    (marginalia-true            :foreground temperance-faded)
    (marginalia-type            :foreground temperance-faded)
    (marginalia-value           :foreground temperance-faded)
    (marginalia-version         :foreground temperance-faded)

    ;; === Message ==============================================================

    (message-cited-text        :foreground temperance-faded)
    (message-cited-text-1      :foreground temperance-faded)
    (message-cited-text-2      :foreground temperance-faded)
    (message-cited-text-3      :foreground temperance-faded)
    (message-cited-text-4      :foreground temperance-faded)
    (message-header-cc         :foreground fg)
    (message-header-name       :foreground temperance-strong :weight 'bold)
    (message-header-newsgroups :foreground fg)
    (message-header-other      :foreground fg)
    (message-header-subject    :foreground temperance-salient)
    (message-header-to         :foreground temperance-salient)
    (message-header-xheader    :foreground fg)
    (message-mml               :foreground temperance-popout)
    (message-separator         :foreground temperance-faded)

    ;; === Modeline =============================================================

    (mode-line          :foreground temperance-faded :background temperance-subtle :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,temperance-subtle)))
    (mode-line-inactive :foreground temperance-faded :background temperance-highlight :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,temperance-highlight)))
    (mode-line-emphasis :foreground temperance-strong :weight 'bold)
    (mode-line-highlight :foreground temperance-strong :background temperance-highlight)

    ;; === Doom modeline ========================================================
    (doom-modeline-project-dir                :foreground temperance-salient :background temperance-subtle)
    (doom-modeline-buffer-file                :foreground fg           :background temperance-subtle    :weight 'bold)
    (doom-modeline-buffer-path                :foreground fg           :background temperance-subtle)
    (doom-modeline-highlight                  :foreground temperance-strong  :background temperance-highlight)
    (lsp-modeline-code-actions-face           :foreground temperance-salient)
    (lsp-modeline-code-actions-preferred-face :foreground temperance-critical)

    ;; === Packages =============================================================

    (package-description       :foreground fg)
    (package-help-section-name :foreground fg)
    (package-name              :foreground temperance-salient)
    (package-status-avail-obso :foreground temperance-faded)
    (package-status-available  :foreground fg)
    (package-status-built-in   :foreground temperance-salient)
    (package-status-dependency :foreground temperance-salient)
    (package-status-disabled   :foreground temperance-faded)
    (package-status-external   :foreground fg)
    (package-status-held       :foreground fg)
    (package-status-incompat   :foreground temperance-faded)
    (package-status-installed  :foreground temperance-salient)
    (package-status-new        :foreground fg)
    (package-status-unsigned   :foreground fg)

    ;; === Orderless ============================================================

    (orderless-match-face-0 :foreground temperance-salient :weight 'bold)
    (orderless-match-face-1 :foreground temperance-strong :weight 'bold)
    (orderless-match-face-2 :foreground temperance-strong :weight 'bold)
    (orderless-match-face-3 :foreground temperance-strong :weight 'bold)

    ;; === Org mode =============================================================

    (org-archived                 :foreground temperance-faded)
    (org-block                    :background highlight)
    (org-block-begin-line         :background temperance-subtle :foreground temperance-faded)
    (org-block-end-line           :background temperance-subtle :foreground temperance-faded)
    (org-checkbox                 :foreground temperance-faded)
    (org-checkbox-statistics-done :foreground temperance-faded)
    (org-checkbox-statistics-todo :foreground temperance-faded)
    (org-clock-overlay            :foreground temperance-faded)
    (org-code                     :foreground temperance-foreground :background temperance-subtle)
    (org-column                   :foreground temperance-faded)
    (org-column-title             :foreground temperance-faded)
    (org-date                     :foreground temperance-faded)
    (org-date-selected            :foreground temperance-popout)
    (org-default                  :foreground temperance-faded)
    (org-document-info            :foreground temperance-faded)
    (org-document-info-keyword    :foreground temperance-faded)
    (org-document-title           :foreground temperance-faded)
    (org-done                     :foreground temperance-faded)
    (org-drawer                   :foreground temperance-faded)
    (org-ellipsis                 :foreground temperance-faded)
    (org-footnote                 :foreground temperance-faded)
    (org-formula                  :foreground temperance-faded)
    (org-headline-done            :foreground temperance-faded)
    (org-latex-and-related        :foreground temperance-faded)
    (org-level-1                  :foreground temperance-strong :weight 'bold)
    (org-level-2                  :foreground temperance-strong :weight 'bold)
    (org-level-3                  :foreground temperance-strong :weight 'bold)
    (org-level-4                  :foreground temperance-strong :weight 'bold)
    (org-level-5                  :foreground temperance-strong :weight 'bold)
    (org-level-6                  :foreground temperance-strong :weight 'bold)
    (org-level-7                  :foreground temperance-strong :weight 'bold)
    (org-level-8                  :foreground temperance-strong :weight 'bold)
    (org-link                     :foreground temperance-salient)
    (org-list-dt                  :foreground temperance-faded)
    (org-macro                    :foreground temperance-faded)
    (org-meta-line                :foreground temperance-faded)
    (org-mode-line-clock          :foreground temperance-faded)
    (org-mode-line-clock-overrun  :foreground temperance-faded)
    (org-priority                 :foreground temperance-faded)
    (org-property-value           :foreground temperance-faded)
    (org-quote                    :foreground temperance-faded)
    (org-scheduled                :foreground temperance-faded)
    (org-scheduled-previously     :foreground temperance-faded)
    (org-scheduled-today          :foreground temperance-faded)
    (org-sexp-date                :foreground temperance-faded)
    (org-special-keyword          :foreground temperance-faded)
    (org-table                    :foreground temperance-faded)
    (org-tag                      :foreground temperance-popout)
    (org-tag-group                :foreground temperance-faded)
    (org-target                   :foreground temperance-faded)
    (org-time-grid                :foreground temperance-faded)
    (org-todo                     :foreground temperance-salient)
    (org-upcoming-deadline        :foreground temperance-popout)
    (org-verbatim                 :foreground temperance-salient)
    (org-verse                    :foreground temperance-faded)
    (org-warning                  :foreground temperance-popout)

    ;; === Org-agenda ===========================================================

    (org-agenda-calendar-event       :foreground fg)
    (org-agenda-calendar-sexp        :foreground temperance-salient)
    (org-agenda-clocking             :foreground temperance-faded)
    (org-agenda-column-dateline      :foreground temperance-faded)
    (org-agenda-current-time         :foreground temperance-salient :weight 'bold)
    (org-agenda-date                 :foreground temperance-strong  :weight 'bold)
    (org-agenda-date-today           :foreground temperance-salient :weight 'bold)
    (org-agenda-date-weekend         :foreground temperance-faded)
    (org-agenda-diary                :foreground temperance-faded)
    (org-agenda-dimmed-todo-face     :foreground temperance-faded)
    (org-agenda-done                 :foreground temperance-faded)
    (org-agenda-filter-category      :foreground temperance-faded)
    (org-agenda-filter-effort        :foreground temperance-faded)
    (org-agenda-filter-regexp        :foreground temperance-faded)
    (org-agenda-filter-tags          :foreground temperance-faded)
    (org-agenda-property-face        :foreground temperance-faded)
    (org-agenda-restriction-lock     :foreground temperance-faded)
    (org-agenda-structure            :foreground temperance-strong  :weight 'bold)
    (org-journal-calendar-entry-face :foreground temperance-critical  :weight 'bold)

    ;; === Popup ================================================================

    (popup-face                       :foreground highlight)
    (popup-isearch-match              :foreground temperance-popout)
    (popup-menu-face                  :foreground temperance-subtle)
    (popup-menu-mouse-face            :foreground bg :background temperance-faded)
    (popup-menu-selection-face        :foreground bg :background temperance-salient)
    (popup-menu-summary-face          :foreground temperance-faded)
    (popup-scroll-bar-background-face :foreground temperance-subtle)
    (popup-scroll-bar-foreground-face :foreground temperance-subtle)
    (popup-summary-face               :foreground temperance-faded)
    (popup-tip-face                   :foreground bg :background temperance-popout)

    ;; === Semantics ============================================================

    (match  :foreground temperance-popout)
    (shadow :foreground temperance-faded)

    ;; === smerge ===============================================================

    (smerge-lower           :background bg)
    (smerge-markers         :background temperance-subtle :weight 'bold :distant-foreground 'unspecified)
    (smerge-refined-added   :foreground temperance-salient :weight 'bold)
    (smerge-refined-changed :foreground temperance-popout)
    (smerge-refined-removed :foreground temperance-faded :strike-through t)
    (smerge-upper           :background bg)

    ;; === Structural ===========================================================

    (bold              :foreground temperance-strong :weight 'bold)
    (bold-italic       :foreground temperance-strong :weight 'bold)
    (fixed-pitch       :foreground fg)
    (fixed-pitch-serif :foreground fg)
    (fringe            :foreground temperance-faded)
    (hl-line           :background highlight)
    (italic            :foreground temperance-faded :slant 'italic)
    (link              :foreground temperance-salient)
    (region            :background temperance-subtle :distant-foreground 'unspecified)

    ;; === Terminal =============================================================

    (term-bold          :foreground temperance-strong :weight 'bold)
    (term-color-black   :foreground fg)
    (term-color-blue    :foreground blue :background bright-blue)
    (term-color-cyan    :foreground cyan :background bright-cyan)
    (term-color-green   :foreground green :background bright-green)
    (term-color-magenta :foreground magenta :background bright-magenta)
    (term-color-red     :foreground red :background bright-red)
    (term-color-yellow  :foreground yellow :background bright-yellow)

    ;; === Transient ============================================================

    ;; Set only faces that influence Magit.
    (transient-value :foreground fg)

    ;; === Vertico ==============================================================

    (vertico-current         :background temperance-subtle :weight 'bold)
    (vertico-group-separator :foreground temperance-faded)
    (vertico-group-title     :foreground temperance-faded)
    (vertico-multiline       :foreground temperance-faded)

    ;;; === Vterm ===============================================================

    (vterm-color-black          :foreground base0                 :background base3)
    (vterm-color-blue           :foreground temperance-salient    :background bright-blue)
    (vterm-color-cyan           :foreground blue                  :background bright-blue)
    (vterm-color-green          :foreground base6                 :background base4)
    (vterm-color-magenta        :foreground temperance-faded      :background temperance-salient)
    (vterm-color-red            :foreground temperance-popout     :background temperance-highlight)
    (vterm-color-yellow         :foreground bright-blue           :background blue)
    (vterm-color-white          :foreground temperance-foreground :background temperance-highlight)
    (vterm-color-bright-black   :foreground temperance-faded      :background base4)
    (vterm-color-bright-blue    :foreground bright-blue           :background blue)
    (vterm-color-bright-cyan    :foreground bright-cyan           :background cyan)
    (vterm-color-bright-green   :foreground base8                 :background base6)
    (vterm-color-bright-magenta :foreground temperance-critical   :background orange)
    (vterm-color-bright-red     :foreground temperance-popout     :background red)
    (vterm-color-bright-yellow  :foreground bright-cyan           :background cyan)
    (vterm-color-bright-white   :foreground temperance-strong     :background temperance-highlight)
    (vterm-color-underline      :underline t)

    ;; === Workspaces ===========================================================

    (+workspace-tab-selected-face :foreground temperance-salient :weight 'bold)

    ;; === Which key ============================================================

    (which-key-command-description-face   :foreground fg)
    (which-key-key-face                   :foreground temperance-strong :weight 'bold)
    (which-key-local-map-description-face :foreground temperance-salient)
    (which-key-group-description-face     :foreground temperance-salient)

    ;; === Ediff ================================================================
    (ediff-current-diff-A :foreground temperance-faded :background base1)
    (ediff-current-diff-C :foreground temperance-faded :background base1)

    ;; === Eglot ================================================================
    (eglot-semantic-variable :weight 'normal)
    (eglot-highlight-symbol-face :background temperance-subtle)

    ;; === CIDER ================================================================
    (cider-result-overlay-face :foreground fg :background temperance-faded :box `(:line-width -1 :color ,base4)))

  "The full package face list, shared by every doom-temperance-* variant.
Written purely in terms of the nine `temperance-*' accents (plus a few of the plain
`base0'-`base8'/ANSI accent colors, where a package genuinely needs more than
nine hues, e.g. vterm's fixed 16-color model).")


;;
;;; Theme definition template

(defmacro def-doom-temperance-theme (name docstring defs &optional extra-faces extra-vars)
  "Define NAME, a Doom Temperance theme with DOCSTRING, from its palette alone.

DEFS need only supply the variant's own palette: the nine `temperance-*'
accents, the `base0'-`base8' ramp, and any extra accent colors its
ANSI/vterm faces need.  Every \"required\" doom-themes slot and the
whole package face list are derived automatically from
`doom-temperance-common-defs' and `doom-temperance-common-faces', which are
appended after DEFS and before EXTRA-FACES respectively -- so a variant
never has to touch a face spec directly.

EXTRA-FACES and EXTRA-VARS are spliced in after the shared ones, so a
variant can still override the shared template for itself alone, same
as the identically-named arguments to `def-doom-theme'."
  (declare (doc-string 2) (indent defun))
  `(def-doom-theme ,name ,docstring
     ,(append defs doom-temperance-common-defs)
     ,(append doom-temperance-common-faces extra-faces)
     ,extra-vars))

(provide 'doom-temperance-common)

;;; doom-temperance-common.el ends here
