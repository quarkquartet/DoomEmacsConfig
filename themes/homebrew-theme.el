;;; homebrew-theme.el --- Homebrew Color Theme


;; Author: Ruoquan Isaac Wang <hepisaacf@gmail.com>
;; Keywords: color theme homebrew

;; This theme is based on cyberpunk theme. Some adjustment
;; has been made to get another color style. The framework
;; of cyberpunk theme was kept, cause this is the main reason
;; to choose cyberpunk theme as an origin. Thanks a lot to
;; the author of cyberpunk theme.

;; Due to the author's poor ability, this theme is still
;; under construction. Changes will be made once some
;; ugly colors appear during working. Consistency of color
;; is the aim of this theme, but not garanteed. If you
;; found inconsistency of color in any environment, do not
;; hesitate to contact with the author.



(deftheme homebrew "The Homebrew color theme")

(defcustom homebrew-transparent-background nil
  "Make transparent background in terminal. (Workaround)")

(let ((class '((class color) (min-colors 89)))
      ;; Homebrew palette
      (homebrew-fg "#dcdccc")
      (homebrew-bg-1 "#2b2b2b")
      (homebrew-bg-05 "#383838")
      (homebrew-bg "#000000")
      (homebrew-bg+1 "#4f4f4f")
      (homebrew-bg+2 "#5f5f5f")
      (homebrew-bg+3 "#6f6f6f")
      (homebrew-red+1 "#dca3a3")
      (homebrew-dark-red "#8a0f00")
      (homebrew-red "#ff0000")
      (homebrew-red-1 "#8b0000")
      (homebrew-red-2 "#8b0000")
      (homebrew-red-3 "#9c6363")
      (homebrew-red-4 "#8c5353")
      (homebrew-red-5 "#7F073F")
      (homebrew-pink "#ff69b4")
      (homebrew-pink-1 "#ff1493")
      (homebrew-pink-2 "#cd1076")
      (homebrew-orange-2 "#FF6400")
      (homebrew-orange-1 "#ff8c00") ;; DarkOrange
      (homebrew-orange "#ffa500")
      (homebrew-yellow "#ffff00")
      (homebrew-yellow-1 "#FBDE2D")
      (homebrew-yellow-2 "#d0bf8f")
      (homebrew-yellow-3 "#D8FA3C")
      (homebrew-yellow-4 "#E9C062")
      (homebrew-yellow-5 "#ffd700")
      (homebrew-dark-green "#006400")
      (homebrew-green-1 "#2e8b57")
      (homebrew-green-4 "#008b00")
      (homebrew-green-3 "#00cd00")
      (homebrew-green "#31ef5b")
      (homebrew-green+1 "#61CE3C")
      (homebrew-green+2 "#9fc59f")
      (homebrew-green+3 "#afd8af")
      (homebrew-green+4 "#bfebbf")
      (homebrew-forest-green "#228b22")
      (homebrew-pale-green "#548b54")
      (homebrew-spring-green-4 "#008b45")
      (homebrew-cyan "#93e0e3")
      (homebrew-blue+1 "#94bff3")
      (homebrew-blue "#0432ff")    ;; blue
      (homebrew-blue-1 "#7b68ee")  ;; medium slate blue
      (homebrew-blue-2 "#6a5acd")  ;; slate blue
      (homebrew-blue-3 "#0226cc")
      (homebrew-light-blue "#add8e6")  ;; light blue
      (homebrew-light-blue-2 "#b2dfee")  ;; LightBlue2
      (homebrew-blue-5 "#4c83ff")
      (homebrew-blue-6 "#96CBFE")
      (homebrew-blue-7 "#00ffff")
      (homebrew-blue-8 "#4F94CD")
      (homebrew-blue-4 "#01168a")
      (homebrew-medium-blue "#0226cc")
      (homebrew-sky-bule-1 "#87ceff")
      (homebrew-purple-4 "#5d478b")
      (homebrew-dodger-blue "#1e90ff")
      (homebrew-dodger-blue-3 "#1874cd")
      (homebrew-dodger-blue-4 "#104e8b")
      (homebrew-dark-blue "#01168a")
      (homebrew-magenta "#dc8cc3")
      (homebrew-black (if (and homebrew-transparent-background
                                (not (display-graphic-p))
                                (eq system-type 'darwin))
                           "ARGBBB000000"
                         "#000000"))
      (homebrew-black-2 "#0C1021")
      (homebrew-black-3 "#0A0A0A")
      (homebrew-gray "#d3d3d3")
      (homebrew-gray-2 "#8B8989")
      (homebrew-gray-3 "#919191")
      (homebrew-gray-4 "#999999")
      (homebrew-gray-5 "#333333")
      (homebrew-gray-6 "#1A1A1A")
      (homebrew-gray-7 "#4D4D4D")
      (homebrew-gray-8 "#262626")
      (homebrew-gray-9 "#f7f7f7")
      (homebrew-white "#ffffff")
      (homebrew-white-2 "#F8F8F8")
      (homebrew-white-3 "#fffafa"))

 (custom-theme-set-faces
   'homebrew
   '(button ((t (:underline t))))
   `(link ((,class (:foreground ,homebrew-blue-3 :underline t :weight bold))))
   `(link-visited ((,class (:foreground ,homebrew-purple-4 :underline t :weight normal))))
   `(blue ((,class (:foreground ,homebrew-blue))))
   `(bold ((,class (:bold t))))
   `(border-glyph ((,class (nil))))
   `(buffers-tab ((,class (:background ,homebrew-black-2 :foreground ,homebrew-white-2))))

   ;;; basic coloring
   
   `(default ((,class (:foreground ,homebrew-green-3
                                   ;:background ,homebrew-bg
                                   ))))
   `(cursor ((,class (:background ,homebrew-fg))))
   `(escape-glyph-face ((,class (:foreground ,homebrew-red))))
   ;; `(fringe ((,class (:foreground ,homebrew-fg :background ,homebrew-bg+1))))
   `(header-line ((,class (:foreground ,homebrew-blue
                                       :background ,homebrew-bg-1
                                       :box (:line-width -1 :style released-button)))))
   `(highlight ((,class (:background ,homebrew-gray-5))))

   ;;; compilation
   `(compilation-column-face ((,class (:foreground ,homebrew-yellow))))
   `(compilation-enter-directory-face ((,class (:foreground ,homebrew-green))))
   `(compilation-error-face ((,class (:foreground ,homebrew-red-1 :weight bold :underline t))))
   `(compilation-face ((,class (:foreground ,homebrew-fg))))
   `(compilation-info-face ((,class (:foreground ,homebrew-blue))))
   `(compilation-info ((,class (:foreground ,homebrew-green+4 :underline t))))
   `(compilation-leave-directory-face ((,class (:foreground ,homebrew-green))))
   `(compilation-line-face ((,class (:foreground ,homebrew-yellow))))
   `(compilation-line-number ((,class (:foreground ,homebrew-yellow))))
   `(compilation-message-face ((,class (:foreground ,homebrew-blue))))
   `(compilation-warning-face ((,class (:foreground ,homebrew-yellow-1 :weight bold :underline t))))

   ;;; grep
   `(grep-context-face ((,class (:foreground ,homebrew-black :background ,homebrew-pink-1))))
   `(grep-error-face ((,class (:foreground ,homebrew-red :weight bold :underline t))))
   `(grep-hit-face ((,class (:foreground ,homebrew-black :background ,homebrew-red))))
   `(grep-match-face ((,class (:foreground ,homebrew-black :background ,homebrew-pink-1))))
   `(match ((,class (:background ,homebrew-black :foreground ,homebrew-pink-1))))

  

  
   
   ;;; ivy
   `(ivy-current-match ((t (:background "dark red" :foreground "black")))) 


   ;;; multiple-cursors
   `(mc/cursor-face ((,class (:inverse-video nil, :background ,homebrew-pink :foreground ,homebrew-black))))

   ;; faces used by isearch
   `(isearch ((,class (:foreground ,homebrew-dark-green :background ,homebrew-dark-blue))))
   `(isearch-fail ((,class (:background ,homebrew-red-1))))
   
   `(lazy-highlight ((,class (:foreground ,homebrew-black :background ,homebrew-yellow))))
   `(query-replace ((,class (:background ,homebrew-gray-5))))
   `(Highline-face ((,class (:background ,homebrew-green-1))))
   `(left-margin ((,class (nil))))
   `(toolbar ((,class (nil))))
   `(text-cursor ((,class (:background ,homebrew-yellow :foreground ,homebrew-black))))

   ;`(menu ((,class (:foreground ,homebrew-fg :background ,homebrew-bg))))
   `(minibuffer-prompt ((,class (:foreground ,homebrew-dark-green :background ,homebrew-black))))
   `(mode-line
     ((,class (:foreground ,homebrew-gray-9
                           :background ,homebrew-dark-red
                           :box (:line-width 1 :color ,homebrew-dark-red)))))
   ;; `(mode-line-buffer-id ((,class (:foreground ,homebrew-gray-9 :weight bold))))
   `(doom-modeline-buffer-modified ((,class (:foreground ,homebrew-dark-green, :bold t))))
   `(mode-line-inactive
     ((,class (:foreground ,homebrew-dark-green
                           :background ,homebrew-bg
                           :box (:line-width 1 :color ,homebrew-dark-green)))))
   `(region ((,class (:foreground ,homebrew-green-4
                                  :background ,homebrew-dark-blue))))
   `(secondary-selection ((,class (:background ,homebrew-bg+2))))
   `(trailing-whitespace ((,class (:background ,homebrew-red))))
   `(vertical-border ((,class (:foreground ,homebrew-dark-green :background ,homebrew-bg))))
   

   ;;; font lock
   `(font-lock-builtin-face ((,class (:foreground ,homebrew-blue))))
   `(font-lock-comment-face ((,class (:foreground ,homebrew-gray-2 :italic t))))
   ;; `(font-lock-comment-delimiter-face ((,class (:foreground ,homebrew-green)))) 
   `(font-lock-constant-face ((,class (:foreground ,homebrew-purple-4))))
   ;; `(font-lock-doc-face ((,class (:foreground ,homebrew-green+1))))
   `(font-lock-doc-face ((,class (:foreground ,homebrew-forest-green))))
   `(font-lock-function-name-face ((,class (:foreground ,homebrew-blue))))
   `(font-lock-keyword-face ((,class (:foreground ,homebrew-medium-blue))))
   ;; `(font-lock-negation-char-face ((,class (:foreground ,homebrew-fg))))
   `(font-lock-preprocessor-face ((,class (:foreground ,homebrew-gray-3))))
   `(font-lock-string-face ((,class (:foreground ,homebrew-dark-green))))
   `(font-lock-type-face ((,class (:foreground ,homebrew-medium-blue))))
   `(font-lock-variable-name-face ((,class (:foreground ,homebrew-green-1))))
   `(font-lock-warning-face ((,class (:foreground ,homebrew-dark-red))))
   `(font-lock-reference-face ((,class (:foreground ,homebrew-gray))))
   `(font-lock-regexp-grouping-backslash ((,class (:foreground ,homebrew-yellow-4))))
   `(font-lock-regexp-grouping-construct ((,class (:foreground ,homebrew-red))))

   `(c-annotation-face ((,class (:inherit font-lock-constant-face))))

   `(gui-element ((,class (:background ,homebrew-gray-5 :foreground ,homebrew-blue-6))))

   ;;; newsticker
   ;; These are currently placeholders that probably look terrible.
   ;; Someone who uses newsticker is welcome to change these
   `(newsticker-date-face ((,class (:foreground ,homebrew-fg))))
   `(newsticker-default-face ((,class (:foreground ,homebrew-fg))))
   `(newsticker-enclosure-face ((,class (:foreground ,homebrew-green+3))))
   `(newsticker-extra-face ((,class (:foreground ,homebrew-bg+2 :height 0.8))))
   `(newsticker-feed-face ((,class (:foreground ,homebrew-fg))))
   `(newsticker-immortal-item-face ((,class (:foreground ,homebrew-green))))
   `(newsticker-new-item-face ((,class (:foreground ,homebrew-blue))))
   `(newsticker-obsolete-item-face ((,class (:foreground ,homebrew-red))))
   `(newsticker-old-item-face ((,class (:foreground ,homebrew-bg+3))))
   `(newsticker-statistics-face ((,class (:foreground ,homebrew-fg))))
   `(newsticker-treeview-face ((,class (:foreground ,homebrew-fg))))
   `(newsticker-treeview-immortal-face ((,class (:foreground ,homebrew-green))))
   `(newsticker-treeview-listwindow-face ((,class (:foreground ,homebrew-fg))))
   `(newsticker-treeview-new-face ((,class (:foreground ,homebrew-blue :weight bold))))
   `(newsticker-treeview-obsolete-face ((,class (:foreground ,homebrew-red))))
   `(newsticker-treeview-old-face ((,class (:foreground ,homebrew-bg+3))))
   `(newsticker-treeview-selection-face ((,class (:foreground ,homebrew-yellow))))

   ;;; external

   ;; full-ack
   `(ack-separator ((,class (:foreground ,homebrew-fg))))
   `(ack-file ((,class (:foreground ,homebrew-blue))))
   `(ack-line ((,class (:foreground ,homebrew-yellow))))
   `(ack-match ((,class (:foreground ,homebrew-orange :background ,homebrew-bg-1 :weigth bold))))

   ;; auctex
   `(font-latex-bold ((,class (:inherit bold))))
   `(font-latex-warning ((,class (:inherit font-lock-warning))))
   `(font-latex-sedate ((,class (:foreground ,homebrew-yellow :weight bold))))
   `(font-latex-string ((,class (:foreground ,homebrew-green))))
   `(font-latex-title-4 ((,class (:inherit variable-pitch :weight bold))))
   `(font-latex-sectioning-0 ((,class (:foreground ,homebrew-blue :background ,homebrew-black :scale 1.5))))
   `(font-latex-sectioning-1 ((,class (:foreground ,homebrew-blue :background ,homebrew-black :scale 1.5))))
   `(font-latex-sectioning-2-face ((,class (:foreground ,homebrew-green+2))))
   `(font-latex-math-face ((,class (:foreground ,homebrew-sky-bule-1))))
   `(font-latex-warning-face ((,class (:foreground ,homebrew-dark-red))))

   ;; auto-complete
   `(ac-completion-face ((,class (:background ,homebrew-gray-2 :underline t))))
   `(ac-candidate-face ((,class (:background ,homebrew-gray-2 :foreground ,homebrew-dark-green))))
   `(ac-selection-face ((,class (:background ,homebrew-dark-blue :foreground ,homebrew-green-3))))
   `(popup-tip-face ((,class (:background ,homebrew-gray-5 :foreground ,homebrew-white))))
   `(popup-scroll-bar-foreground-face ((,class (:background ,homebrew-black-3))))
   `(popup-scroll-bar-background-face ((,class (:background ,homebrew-gray-5))))
   `(popup-isearch-match ((,class (:background ,homebrew-black :foreground ,homebrew-pink-1))))
   `(popup-menu-selection-face ((,class (:background ,homebrew-dark-blue :foreground ,homebrew-green-3))))
   `(popup-menu-face ((,class (:background ,homebrew-gray-2 :foreground ,homebrew-dark-green))))

   `(window-number-face ((,class (:background ,homebrew-gray-6 :foreground ,homebrew-blue-5))))

   ;; company-mode
   `(company-tooltip ((,class (:background ,homebrew-gray-2 :foreground ,homebrew-dark-green)))) 
   `(company-tooltip-common ((,class (:inherit company-tooltip :foreground ,homebrew-blue))))
   `(company-tooltip-common-selection ((,class (:inherit company-tooltip-selection :foreground ,homebrew-green-3))))
   `(company-tooltip-selection ((,class (:foreground ,homebrew-green-3 :background ,homebrew-dark-blue))))
   `(company-tooltip-annotation ((,class (:inherit company-tooltip :foreground ,homebrew-black-3))))
   `(company-scrollbar-fg ((,class (:background ,homebrew-black-3))))
   `(company-scrollbar-bg ((,class (:background ,homebrew-gray-5))))
   `(company-preview ((,class (:foreground ,homebrew-gray :background ,homebrew-dark-blue))))
   `(company-preview-common ((,class (:foreground ,homebrew-gray :background ,homebrew-dark-blue)))) 
   
   ;; diff
   `(diff-added ((,class (:foreground ,homebrew-green))))
   `(diff-changed ((,class (:foreground ,homebrew-yellow))))
   `(diff-removed ((,class (:foreground ,homebrew-red))))
   `(diff-header ((,class (:background ,homebrew-bg+2))))
   `(diff-file-header ((,class (:background ,homebrew-bg+2 :foreground ,homebrew-fg :bold t))))

   ;; ediff
   `(ediff-current-diff-Ancestor ((,class (:foreground ,homebrew-fg :background ,homebrew-pink))))
   `(ediff-current-diff-A ((,class (:foreground ,homebrew-fg :background ,homebrew-bg-05))))
   `(ediff-current-diff-B ((,class (:foreground ,homebrew-fg :background ,homebrew-bg+1))))
   `(ediff-current-diff-C ((,class (:foreground ,homebrew-fg :background ,homebrew-bg+2))))
   `(ediff-even-diff-Ancestor ((,class (:foreground ,homebrew-white :background ,homebrew-bg-05))))
   `(ediff-even-diff-A ((,class (:foreground ,homebrew-white :background ,homebrew-bg+1))))
   `(ediff-even-diff-B ((,class (:foreground ,homebrew-white :background ,homebrew-bg+2))))
   `(ediff-even-diff-C ((,class (:foreground ,homebrew-white :background ,homebrew-bg+3))))
   `(ediff-fine-diff-Ancestor ((,class (:foreground ,homebrew-black :background ,homebrew-pink))))
   `(ediff-fine-diff-A ((,class (:foreground ,homebrew-black :background ,homebrew-blue-5))))
   `(ediff-fine-diff-B ((,class (:foreground ,homebrew-black :background ,homebrew-blue-5))))
   `(ediff-fine-diff-C ((,class (:foreground ,homebrew-black :background ,homebrew-blue-5))))
   `(ediff-odd-diff-Ancestor ((,class (:foreground ,homebrew-black :background ,homebrew-gray-2))))
   `(ediff-odd-diff-A ((,class (:foreground ,homebrew-black :background ,homebrew-gray-3))))
   `(ediff-odd-diff-B ((,class (:foreground ,homebrew-black :background ,homebrew-gray-4))))
   `(ediff-odd-diff-C ((,class (:foreground ,homebrew-black :background ,homebrew-gray))))

   ;; ert
   `(ert-test-result-expected ((,class (:foreground ,homebrew-green+4 :background ,homebrew-bg))))
   `(ert-test-result-unexpected ((,class (:foreground ,homebrew-red :background ,homebrew-bg))))

   ;; eshell
   `(eshell-prompt ((,class (:foreground ,homebrew-blue-5 :weight bold))))
   `(eshell-ls-archive ((,class (:foreground ,homebrew-magenta :weight bold))))
   `(eshell-ls-backup ((,class (:inherit font-lock-comment))))
   `(eshell-ls-clutter ((,class (:inherit font-lock-comment))))
   `(eshell-ls-directory ((,class (:foreground ,homebrew-blue+1 :weight bold))))
   `(eshell-ls-executable ((,class (:foreground ,homebrew-red+1 :weight bold))))
   `(eshell-ls-unreadable ((,class (:foreground ,homebrew-fg))))
   `(eshell-ls-missing ((,class (:inherit font-lock-warning))))
   `(eshell-ls-product ((,class (:inherit font-lock-doc))))
   `(eshell-ls-special ((,class (:foreground ,homebrew-yellow :weight bold))))
   `(eshell-ls-symlink ((,class (:foreground ,homebrew-cyan :weight bold))))

   ;; flymake
   `(flymake-errline ((,class (:foreground ,homebrew-red-1 :weight bold :underline t))))
   `(flymake-warnline ((,class (:foreground ,homebrew-yellow-1 :weight bold :underline t))))
   ;; flycheck
   `(flycheck-warning ((,class (:underline t))))
   `(flycheck-error ((,class (:foreground ,homebrew-dark-red :weight bold :underline t))))
   ;; flyspell
   `(flyspell-duplicate ((,class (:foreground ,homebrew-dark-red :weight bold :underline t))))
   `(flyspell-incorrect ((,class (:foreground ,homebrew-dark-red :weight bold :underline t))))

   ;; erc
   `(erc-action-face ((,class (:inherit erc-default-face))))
   `(erc-bold-face ((,class (:weight bold))))
   `(erc-current-nick-face ((,class (:foreground ,homebrew-blue :weight bold))))
   `(erc-dangerous-host-face ((,class (:inherit font-lock-warning))))
   `(erc-default-face ((,class (:foreground ,homebrew-fg))))
   `(erc-direct-msg-face ((,class (:inherit erc-default))))
   `(erc-error-face ((,class (:inherit font-lock-warning))))
   `(erc-fool-face ((,class (:inherit erc-default))))
   `(erc-highlight-face ((,class (:inherit hover-highlight))))
   `(erc-input-face ((,class (:foreground ,homebrew-yellow))))
   `(erc-keyword-face ((,class (:foreground ,homebrew-blue :weight bold))))
   `(erc-nick-default-face ((,class (:foreground ,homebrew-yellow :weight bold))))
   `(erc-my-nick-face ((,class (:foreground ,homebrew-red :weigth bold))))
   `(erc-nick-msg-face ((,class (:inherit erc-default))))
   `(erc-notice-face ((,class (:foreground ,homebrew-green))))
   `(erc-pal-face ((,class (:foreground ,homebrew-orange :weight bold))))
   `(erc-prompt-face ((,class (:foreground ,homebrew-orange :background ,homebrew-bg :weight bold))))
   `(erc-timestamp-face ((,class (:foreground ,homebrew-green+1))))
   `(erc-underline-face ((t (:underline t))))

   ;; gnus
   `(gnus-group-mail-1 ((,class (:bold t :inherit gnus-group-mail-1-empty))))
   `(gnus-group-mail-1-empty ((,class (:inherit gnus-group-news-1-empty))))
   `(gnus-group-mail-2 ((,class (:bold t :inherit gnus-group-mail-2-empty))))
   `(gnus-group-mail-2-empty ((,class (:inherit gnus-group-news-2-empty))))
   `(gnus-group-mail-3 ((,class (:bold t :inherit gnus-group-mail-3-empty))))
   `(gnus-group-mail-3-empty ((,class (:inherit gnus-group-news-3-empty))))
   `(gnus-group-mail-4 ((,class (:bold t :inherit gnus-group-mail-4-empty))))
   `(gnus-group-mail-4-empty ((,class (:inherit gnus-group-news-4-empty))))
   `(gnus-group-mail-5 ((,class (:bold t :inherit gnus-group-mail-5-empty))))
   `(gnus-group-mail-5-empty ((,class (:inherit gnus-group-news-5-empty))))
   `(gnus-group-mail-6 ((,class (:bold t :inherit gnus-group-mail-6-empty))))
   `(gnus-group-mail-6-empty ((,class (:inherit gnus-group-news-6-empty))))
   `(gnus-group-mail-low ((,class (:bold t :inherit gnus-group-mail-low-empty))))
   `(gnus-group-mail-low-empty ((,class (:inherit gnus-group-news-low-empty))))
   `(gnus-group-news-1 ((,class (:bold t :inherit gnus-group-news-1-empty))))
   `(gnus-group-news-2 ((,class (:bold t :inherit gnus-group-news-2-empty))))
   `(gnus-group-news-3 ((,class (:bold t :inherit gnus-group-news-3-empty))))
   `(gnus-group-news-4 ((,class (:bold t :inherit gnus-group-news-4-empty))))
   `(gnus-group-news-5 ((,class (:bold t :inherit gnus-group-news-5-empty))))
   `(gnus-group-news-6 ((,class (:bold t :inherit gnus-group-news-6-empty))))
   `(gnus-group-news-low ((,class (:bold t :inherit gnus-group-news-low-empty))))
   `(gnus-header-content ((,class (:inherit message-header-other))))
   `(gnus-header-from ((,class (:inherit message-header-from))))
   `(gnus-header-name ((,class (:inherit message-header-name))))
   `(gnus-header-newsgroups ((,class (:inherit message-header-other))))
   `(gnus-header-subject ((,class (:inherit message-header-subject))))
   `(gnus-summary-cancelled ((,class (:foreground ,homebrew-orange))))
   `(gnus-summary-high-ancient ((,class (:foreground ,homebrew-blue))))
   `(gnus-summary-high-read ((,class (:foreground ,homebrew-green :weight bold))))
   `(gnus-summary-high-ticked ((,class (:foreground ,homebrew-orange :weight bold))))
   `(gnus-summary-high-unread ((,class (:foreground ,homebrew-fg :weight bold))))
   `(gnus-summary-low-ancient ((,class (:foreground ,homebrew-blue))))
   `(gnus-summary-low-read ((t (:foreground ,homebrew-green))))
   `(gnus-summary-low-ticked ((,class (:foreground ,homebrew-orange :weight bold))))
   `(gnus-summary-low-unread ((,class (:foreground ,homebrew-fg))))
   `(gnus-summary-normal-ancient ((,class (:foreground ,homebrew-blue+1))))
   `(gnus-summary-normal-read ((,class (:foreground ,homebrew-green))))
   `(gnus-summary-normal-ticked ((,class (:foreground ,homebrew-orange :weight bold))))
   `(gnus-summary-normal-unread ((,class (:foreground ,homebrew-fg))))
   `(gnus-summary-selected ((,class (:foreground ,homebrew-yellow :weight bold))))
   `(gnus-cite-1 ((,class (:foreground ,homebrew-yellow-2))))
   `(gnus-cite-10 ((,class (:foreground ,homebrew-yellow-1))))
   `(gnus-cite-11 ((,class (:foreground ,homebrew-yellow))))
   `(gnus-cite-2 ((,class (:foreground ,homebrew-blue-1))))
   `(gnus-cite-3 ((,class (:foreground ,homebrew-blue-2))))
   `(gnus-cite-4 ((,class (:foreground ,homebrew-green+2))))
   `(gnus-cite-5 ((,class (:foreground ,homebrew-green+1))))
   `(gnus-cite-6 ((,class (:foreground ,homebrew-green))))
   `(gnus-cite-7 ((,class (:foreground ,homebrew-red))))
   `(gnus-cite-8 ((,class (:foreground ,homebrew-red-1))))
   `(gnus-cite-9 ((,class (:foreground ,homebrew-red-2))))
   `(gnus-group-news-1-empty ((,class (:foreground ,homebrew-yellow))))
   `(gnus-group-news-2-empty ((,class (:foreground ,homebrew-green+3))))
   `(gnus-group-news-3-empty ((,class (:foreground ,homebrew-green+1))))
   `(gnus-group-news-4-empty ((,class (:foreground ,homebrew-blue-2))))
   `(gnus-group-news-5-empty ((,class (:foreground ,homebrew-light-blue))))
   `(gnus-group-news-6-empty ((,class (:foreground ,homebrew-bg+2))))
   `(gnus-group-news-low-empty ((,class (:foreground ,homebrew-bg+2))))
   `(gnus-signature ((,class (:foreground ,homebrew-yellow))))
   `(gnus-x ((,class (:background ,homebrew-fg :foreground ,homebrew-bg))))

   ;; helm
   `(helm-header
     ((,class (:foreground ,homebrew-green
                           :background ,homebrew-bg
                           :underline nil
                           :box nil))))
   `(helm-source-header
     ((,class (:foreground ,homebrew-yellow
                           :background ,homebrew-bg-1
                           :underline nil
                           :weight bold
                           :box (:line-width -1 :style released-button)))))
   `(helm-selection ((,class (:background ,homebrew-bg-1 :underline nil))))
   `(helm-selection-line ((,class (:background ,homebrew-bg+1))))
   `(helm-visible-mark ((,class (:foreground ,homebrew-bg :background ,homebrew-yellow-2))))
   `(helm-candidate-number ((,class (:foreground ,homebrew-green+4 :background ,homebrew-bg-1))))
   `(helm-ff-directory ((,class (:foreground ,homebrew-pink :background ,homebrew-bg))))
   `(helm-ff-dotted-directory ((,class (:foreground ,homebrew-pink :background ,homebrew-bg))))

   ;; hl-line-mode
   `(hl-sexp-face ((,class (:background ,homebrew-gray-5))))
   `(hl-line-face ((,class (:background ,homebrew-gray-5))))

   ;; ido-mode
   `(ido-first-match ((,class (:foreground ,homebrew-pink-1 :background ,homebrew-black))))
   `(ido-only-match ((,class (:foreground ,homebrew-pink-1 :background ,homebrew-black))))
   `(ido-subdir ((,class (:foreground ,homebrew-gray-4 :backgroun ,homebrew-black))))
   `(ido-indicator ((,class (:foreground ,homebrew-black :background ,homebrew-pink-1))))

   ;; js2-mode
   `(js2-warning-face ((,class (:underline ,homebrew-orange))))
   `(js2-error-face ((,class (:foreground ,homebrew-red :weight bold))))
   `(js2-jsdoc-tag-face ((,class (:foreground ,homebrew-green-1))))
   `(js2-jsdoc-type-face ((,class (:foreground ,homebrew-green+2))))
   `(js2-jsdoc-value-face ((,class (:foreground ,homebrew-green+3))))
   `(js2-function-param-face ((,class (:foreground ,homebrew-green+3))))
   `(js2-external-variable-face ((,class (:foreground ,homebrew-orange))))

   ;; jabber-mode
   `(jabber-roster-user-away ((,class (:foreground ,homebrew-green+2))))
   `(jabber-roster-user-online ((,class (:foreground ,homebrew-blue-1))))
   `(jabber-roster-user-dnd ((,class (:foreground ,homebrew-red+1))))
   `(jabber-rare-time-face ((,class (:foreground ,homebrew-green+1))))
   `(jabber-chat-prompt-local ((,class (:foreground ,homebrew-blue-1))))
   `(jabber-chat-prompt-foreign ((,class (:foreground ,homebrew-red+1))))
   `(jabber-activity-face((,class (:foreground ,homebrew-red+1))))
   `(jabber-activity-personal-face ((,class (:foreground ,homebrew-blue+1))))
   `(jabber-title-small ((,class (:height 1.1 :weight bold))))
   `(jabber-title-medium ((,class (:height 1.2 :weight bold))))
   `(jabber-title-large ((,class (:height 1.3 :weight bold))))

   ;; linum-mode
   `(linum ((,class (:foreground ,homebrew-green-4 :background ,homebrew-bg))))

   ;;linum-relative
   `(linum-relative-current-face ((,class (:inherit linum :foreground ,homebrew-white :weight bold))))

   ;; magit
   ;; magit headings and diffs
   `(magit-section-highlight ((t (:background ,homebrew-bg+1))))
   `(magit-section-heading ((t (:foreground ,homebrew-blue+1 :weight bold))))
   `(magit-section-heading-selection ((t (:foreground ,homebrew-red+1 :weight bold))))
   `(magit-diff-file-heading           ((t (:weight bold))))
   `(magit-diff-file-heading-highlight ((t (:background ,homebrew-bg+2  :weight bold))))
   `(magit-diff-file-heading-selection ((t (:background ,homebrew-bg+2
                                            :foreground ,homebrew-blue-6 :weight bold))))
   `(magit-diff-hunk-heading           ((t (:background ,homebrew-bg))))
   `(magit-diff-hunk-heading-highlight ((t (:background ,homebrew-bg+1))))
   `(magit-diff-hunk-heading-selection ((t (:background ,homebrew-bg+1
                                            :foreground ,homebrew-blue-6))))
   `(magit-diff-lines-heading          ((t (:background ,homebrew-blue-6
                                            :foreground ,homebrew-bg+1))))
   `(magit-diff-added                  ((t (:foreground ,homebrew-blue-5))))
   `(magit-diff-added-highlight        ((t (:inherit magit-diff-added :weight bold))))
   `(magit-diff-removed                ((t (:foreground ,homebrew-magenta))))
   `(magit-diff-removed-highlight      ((t (:inherit magit-diff-removed :weight bold))))
   `(magit-diff-context                ((t (:foreground ,homebrew-gray))))
   `(magit-diff-context-highlight      ((t (:inherit magit-diff-context :weight bold))))
   `(magit-diffstat-added   ((t (:inherit magit-diff-added))))
   `(magit-diffstat-removed ((t (:inherit magit-diff-removed))))
   ;; magit popup
   `(magit-popup-heading             ((t (:foreground ,homebrew-pink-1  :weight bold))))
   `(magit-popup-key                 ((t (:foreground ,homebrew-blue+1 :weight bold))))
   `(magit-popup-argument            ((t (:foreground ,homebrew-light-blue-2   :weight bold))))
   `(magit-popup-disabled-argument   ((t (:foreground ,homebrew-fg    :weight normal))))
   `(magit-popup-option-value        ((t (:foreground ,homebrew-blue-2  :weight bold))))
   ;; ;; magit process
   `(magit-process-ok    ((t (:foreground ,homebrew-green+1  :weight bold))))
   `(magit-process-ng    ((t (:foreground ,homebrew-pink-2    :weight bold))))
   ;; ;; magit log
   `(magit-log-author    ((t (:foreground ,homebrew-pink))))
   `(magit-log-date      ((t (:foreground ,homebrew-gray))))
   `(magit-log-graph     ((t (:foreground ,homebrew-white-2))))
   ;; ;; magit sequence
   `(magit-sequence-pick ((t (:foreground ,homebrew-magenta))))
   `(magit-sequence-stop ((t (:foreground ,homebrew-green+1))))
   `(magit-sequence-part ((t (:foreground ,homebrew-pink-1))))
   `(magit-sequence-head ((t (:foreground ,homebrew-blue+1))))
   `(magit-sequence-drop ((t (:foreground ,homebrew-orange))))
   `(magit-sequence-done ((t (:foreground ,homebrew-gray-2))))
   `(magit-sequence-onto ((t (:foreground ,homebrew-gray-2))))
   ;; ;; magit bisect
   `(magit-bisect-good ((t (:foreground ,homebrew-green+1))))
   `(magit-bisect-skip ((t (:foreground ,homebrew-pink-1))))
   `(magit-bisect-bad  ((t (:foreground ,homebrew-orange))))
   ;; ;; magit blame
   `(magit-blame-heading ((t (:background ,homebrew-bg+1 :foreground ,homebrew-green))))
   `(magit-blame-hash    ((t (:background ,homebrew-bg+1 :foreground ,homebrew-green))))
   `(magit-blame-name    ((t (:background ,homebrew-bg+1 :foreground ,homebrew-pink-1))))
   `(magit-blame-date    ((t (:background ,homebrew-bg+1 :foreground ,homebrew-yellow-1))))
   `(magit-blame-summary ((t (:background ,homebrew-bg+1 :foreground ,homebrew-light-blue-2
                                          :weight bold))))
   ;; ;; magit references etc
   `(magit-dimmed         ((t (:foreground ,homebrew-bg+3))))
   `(magit-hash           ((t (:foreground ,homebrew-bg+1))))
   `(magit-tag            ((t (:foreground ,homebrew-pink-1 :weight bold))))
   `(magit-branch-remote  ((t (:foreground ,homebrew-green+2  :weight bold))))
   `(magit-branch-local   ((t (:foreground ,homebrew-blue+1   :weight bold))))
   `(magit-branch-current ((t (:foreground ,homebrew-green   :weight bold :box t))))
   `(magit-head           ((t (:foreground ,homebrew-blue   :weight bold))))
   `(magit-refname        ((t (:background ,homebrew-bg+2 :foreground ,homebrew-fg :weight bold))))
   `(magit-refname-stash  ((t (:background ,homebrew-bg+2 :foreground ,homebrew-fg :weight bold))))
   `(magit-refname-wip    ((t (:background ,homebrew-bg+2 :foreground ,homebrew-fg :weight bold))))
   `(magit-signature-good      ((t (:foreground ,homebrew-green))))
   `(magit-signature-bad       ((t (:foreground ,homebrew-red))))
   `(magit-signature-untrusted ((t (:foreground ,homebrew-yellow))))
   `(magit-cherry-unmatched    ((t (:foreground ,homebrew-cyan))))
   `(magit-cherry-equivalent   ((t (:foreground ,homebrew-magenta))))
   `(magit-reflog-commit       ((t (:foreground ,homebrew-green))))
   `(magit-reflog-amend        ((t (:foreground ,homebrew-magenta))))
   `(magit-reflog-merge        ((t (:foreground ,homebrew-green))))
   `(magit-reflog-checkout     ((t (:foreground ,homebrew-blue))))
   `(magit-reflog-reset        ((t (:foreground ,homebrew-red))))
   `(magit-reflog-rebase       ((t (:foreground ,homebrew-magenta))))
   `(magit-reflog-cherry-pick  ((t (:foreground ,homebrew-green))))
   `(magit-reflog-remote       ((t (:foreground ,homebrew-cyan))))
   `(magit-reflog-other        ((t (:foreground ,homebrew-cyan))))
   
   `(eval-sexp-fu-flash ((,class (:background ,homebrew-gray-8 :foreground ,homebrew-pink-2))))

   ;; message-mode
   `(message-cited-text ((,class (:inherit font-lock-comment))))
   `(message-header-name ((,class (:foreground ,homebrew-blue-5))))
   `(message-header-other ((,class (:foreground ,homebrew-green))))
   `(message-header-to ((,class (:foreground ,homebrew-pink-1 :weight bold))))
   `(message-header-from ((,class (:foreground ,homebrew-yellow :weight bold))))
   `(message-header-cc ((,class (:foreground ,homebrew-yellow :weight bold))))
   `(message-header-newsgroups ((,class (:foreground ,homebrew-yellow :weight bold))))
   `(message-header-subject ((,class (:foreground ,homebrew-orange :weight bold))))
   `(message-header-xheader ((,class (:foreground ,homebrew-green))))
   `(message-mml ((,class (:foreground ,homebrew-yellow :weight bold))))
   `(message-separator ((,class (:inherit font-lock-comment))))

   ;; mew
   `(mew-face-header-subject ((,class (:foreground ,homebrew-orange))))
   `(mew-face-header-from ((,class (:foreground ,homebrew-yellow))))
   `(mew-face-header-date ((,class (:foreground ,homebrew-green))))
   `(mew-face-header-to ((,class (:foreground ,homebrew-red))))
   `(mew-face-header-key ((,class (:foreground ,homebrew-green))))
   `(mew-face-header-private ((,class (:foreground ,homebrew-green))))
   `(mew-face-header-important ((,class (:foreground ,homebrew-blue))))
   `(mew-face-header-marginal ((,class (:foreground ,homebrew-fg :weight bold))))
   `(mew-face-header-warning ((,class (:foreground ,homebrew-red))))
   `(mew-face-header-xmew ((,class (:foreground ,homebrew-green))))
   `(mew-face-header-xmew-bad ((,class (:foreground ,homebrew-red))))
   `(mew-face-body-url ((,class (:foreground ,homebrew-orange))))
   `(mew-face-body-comment ((,class (:foreground ,homebrew-fg :slant italic))))
   `(mew-face-body-cite1 ((,class (:foreground ,homebrew-green))))
   `(mew-face-body-cite2 ((,class (:foreground ,homebrew-blue))))
   `(mew-face-body-cite3 ((,class (:foreground ,homebrew-orange))))
   `(mew-face-body-cite4 ((,class (:foreground ,homebrew-yellow))))
   `(mew-face-body-cite5 ((,class (:foreground ,homebrew-red))))
   `(mew-face-mark-review ((,class (:foreground ,homebrew-blue))))
   `(mew-face-mark-escape ((,class (:foreground ,homebrew-green))))
   `(mew-face-mark-delete ((,class (:foreground ,homebrew-red))))
   `(mew-face-mark-unlink ((,class (:foreground ,homebrew-yellow))))
   `(mew-face-mark-refile ((,class (:foreground ,homebrew-green))))
   `(mew-face-mark-unread ((,class (:foreground ,homebrew-red-2))))
   `(mew-face-eof-message ((,class (:foreground ,homebrew-green))))
   `(mew-face-eof-part ((,class (:foreground ,homebrew-yellow))))

   ;; mic-paren
   `(paren-face-match ((,class (:foreground ,homebrew-cyan :background ,homebrew-bg :weight bold))))
   `(paren-face-mismatch ((,class (:foreground ,homebrew-bg :background ,homebrew-magenta :weight bold))))
   `(paren-face-no-match ((,class (:foreground ,homebrew-bg :background ,homebrew-red :weight bold))))

   ;; nav
   `(nav-face-heading ((,class (:foreground ,homebrew-yellow))))
   `(nav-face-button-num ((,class (:foreground ,homebrew-cyan))))
   `(nav-face-dir ((,class (:foreground ,homebrew-green))))
   `(nav-face-hdir ((,class (:foreground ,homebrew-red))))
   `(nav-face-file ((,class (:foreground ,homebrew-fg))))
   `(nav-face-hfile ((,class (:foreground ,homebrew-red-4))))

   ;; mumamo
   `(mumamo-background-chunk-major ((,class (:background ,homebrew-black))))
   `(mumamo-background-chunk-submode1 ((,class (:background ,homebrew-black))))
   `(mumamo-background-chunk-submode2 ((,class (:background ,homebrew-bg+2))))
   `(mumamo-background-chunk-submode3 ((,class (:background ,homebrew-bg+3))))
   `(mumamo-background-chunk-submode4 ((,class (:background ,homebrew-bg+1))))

   ;; org-mode
   `(org-document-title ((,class (:foreground ,homebrew-light-blue :background ,homebrew-black :weight bold :height 1.5))))
   `(org-document-info ((,class (:foreground ,homebrew-light-blue :background ,homebrew-black :weight bold))))
   `(org-document-info-keyword ((,class (:foreground ,homebrew-gray-2 :background ,homebrew-black))))
   `(org-agenda-date-today
     ((,class (:foreground ,homebrew-orange-2 :slant italic :weight bold))) t)
   `(org-agenda-structure
     ((,class (:inherit font-lock-comment-face))))
   `(org-archived ((,class (:slant italic))))
   `(org-checkbox ((,class (:background ,homebrew-gray-2 :foreground ,homebrew-black
                                   :box (:line-width 1 :style released-button)))))
   `(org-date ((,class (:foreground ,homebrew-blue-7 :underline t))))
   `(org-done ((,class (:bold t :weight bold :foreground ,homebrew-green
                              :box (:line-width 1 :style none)))))
   `(org-todo ((,class (:bold t :foreground ,homebrew-orange :weight bold
                              :box (:line-width 1 :style none)))))
   `(org-level-1 ((,class (:foreground ,homebrew-green-4 :height 1.3))))
   `(org-level-2 ((,class (:foreground ,homebrew-spring-green-4 :height 1.2))))
   `(org-level-3 ((,class (:foreground ,homebrew-forest-green :height 1.1))))
   `(org-level-4 ((,class (:foreground ,homebrew-dark-green))))
   `(org-level-5 ((,class (:foreground ,homebrew-orange))))
   `(org-level-6 ((,class (:foreground ,homebrew-pink))))
   `(org-level-7 ((,class (:foreground ,homebrew-green-1))))
   `(org-level-8 ((,class (:foreground ,homebrew-blue-1))))
   `(org-link ((,class (:foreground ,homebrew-blue-6 :underline t))))
   `(org-tag ((,class (:bold t :weight bold))))
   `(org-column ((,class (:background ,homebrew-yellow-3 :foreground ,homebrew-black))))
   `(org-column-title ((,class (:background ,homebrew-bg-1 :underline t :weight bold))))
   ;`(org-block ((,class (:foreground ,homebrew-fg :background ,homebrew-bg-05))))
   `(org-block-begin-line 
     ((,class (:foreground ,homebrew-blue
                                        ;:background ,homebrew-bg-1
                           )))
     )
  ; `(org-block-background ((,class (:background ,homebrew-gray-5))))
   `(org-block-end-line 
     ((,class (:foreground ,homebrew-blue
                                        ;:background ,homebrew-bg-1
                           )))
     )

   ;; `(org-deadline-announce ((,class (:foreground ,homebrew-red-1))))
   ;; `(org-scheduled ((,class (:foreground ,homebrew-green+4))))
   ;; `(org-scheduled-previously ((,class (:foreground ,homebrew-red-4))))
   ;; `(org-scheduled-today ((,class (:foreground ,homebrew-blue+1))))
   ;; `(org-special-keyword ((,class (:foreground ,homebrew-yellow-1))))
   ;; `(org-table ((,class (:foreground ,homebrew-green+2))))
   ;; `(org-time-grid ((,class (:foreground ,homebrew-orange))))
   ;; `(org-upcoming-deadline ((,class (:inherit font-lock-keyword-face))))
   ;; `(org-warning ((,class (:bold t :foreground ,homebrew-red :weight bold :underline nil))))
   ;; `(org-formula ((,class (:foreground ,homebrew-yellow-2))))
   ;; `(org-headline-done ((,class (:foreground ,homebrew-green+3))))
   ;; `(org-hide ((,class (:foreground ,homebrew-bg-1))))

   ;; outline
   `(outline-8 ((,class (:inherit default))))
   `(outline-7 ((,class (:inherit outline-8 :height 1.0))))
   `(outline-6 ((,class (:inherit outline-7 :height 1.0))))
   `(outline-5 ((,class (:inherit outline-6 :height 1.0))))
   `(outline-4 ((,class (:inherit outline-5 :height 1.0))))
   `(outline-3 ((,class (:inherit outline-4 :height 1.0))))
   `(outline-2 ((,class (:inherit outline-3 :height 1.0))))
   `(outline-1 ((,class (:inherit outline-2 :height 1.0))))

   ;; emms
   `(emms-browser-year/genre-face ((,class (:foreground ,homebrew-light-blue :height 1.0))))
   `(emms-browser-artist-face ((,class (:foreground ,homebrew-pink-1 :height 1.0))))
   `(emms-browser-composer-face ((,class (:foreground ,homebrew-light-blue :height 1.0))))
   `(emms-browser-performer-face ((,class (:foreground ,homebrew-light-blue :height 1.0))))
   `(emms-browser-album-face ((,class (:foreground ,homebrew-yellow :height 1.0))))
   `(emms-browser-track-face ((,class (:foreground ,homebrew-blue-5 :height 1.0))))

   ;; Calfw
   `(cfw:face-title ((,class (:foreground ,homebrew-pink-1 :weight bold :height 1.8))))
   `(cfw:face-header ((,class (:foreground ,homebrew-yellow-5 :weight bold))))
   `(cfw:face-sunday ((,class (:foreground ,homebrew-red :weight bold))))
   `(cfw:face-saturday ((,class (:foreground ,homebrew-green :weight bold))))
   `(cfw:face-holiday ((,class (:foreground ,homebrew-pink-2 :weight bold))))
   `(cfw:face-grid ((,class (:foreground ,homebrew-gray-3))))
   `(cfw:face-default-content ((,class (:foreground ,homebrew-cyan))))
   `(cfw:face-periods ((,class (:foreground ,homebrew-cyan :weight bold))))
   `(cfw:face-day-title ((,class (:foreground ,homebrew-fg))))
   `(cfw:face-default-day ((,class (:foreground ,homebrew-fg :weight bold))))
   `(cfw:face-annotation ((,class (:foreground ,homebrew-gray))))
   `(cfw:face-disable ((,class (:foreground ,homebrew-gray-2 :weight bold))))
   `(cfw:face-today-title ((,class (:foreground ,homebrew-blue :background ,homebrew-magenta))))
   `(cfw:face-today ((,class (:foreground ,homebrew-fg :weight bold))))
   `(cfw:face-select ((,class (:background ,homebrew-bg+2))))
   `(cfw:face-toolbar ((,class (:background ,homebrew-blue-8))))
   `(cfw:face-toolbar-button-off ((,class (:foreground ,homebrew-white :background ,homebrew-blue-8 :weight bold))))
   `(cfw:face-toolbar-button-on ((,class (:foreground ,homebrew-white :background ,homebrew-orange-1 :weight bold))))

   ;; racket-mode
   `(racket-keyword-argument-face ((t (:inherit font-lock-constant-face))))
   `(racket-selfeval-face ((t (:inherit font-lock-type-face))))

   ;; rainbow-delimiters
   `(rainbow-delimiters-depth-1-face ((,class (:foreground ,homebrew-red-1))))
   `(rainbow-delimiters-depth-2-face ((,class (:foreground ,homebrew-dark-green))))
   `(rainbow-delimiters-depth-3-face ((,class (:foreground ,homebrew-pink-1))))
   `(rainbow-delimiters-depth-4-face ((,class (:foreground ,homebrew-yellow))))
   `(rainbow-delimiters-depth-5-face ((,class (:foreground ,homebrew-green))))
   `(rainbow-delimiters-depth-6-face ((,class (:foreground ,homebrew-light-blue))))
   `(rainbow-delimiters-depth-7-face ((,class (:foreground ,homebrew-orange))))
   `(rainbow-delimiters-depth-8-face ((,class (:foreground ,homebrew-blue-2))))
   `(rainbow-delimiters-depth-9-face ((,class (:foreground ,homebrew-gray))))
   `(rainbow-delimiters-depth-10-face ((,class (:foreground ,homebrew-white))))
   `(rainbow-delimiters-depth-11-face ((,class (:foreground ,homebrew-blue+1))))
   `(rainbow-delimiters-depth-12-face ((,class (:foreground ,homebrew-red-4))))

   ;; rpm-mode
   `(rpm-spec-dir-face ((,class (:foreground ,homebrew-green))))
   `(rpm-spec-doc-face ((,class (:foreground ,homebrew-green))))
   `(rpm-spec-ghost-face ((,class (:foreground ,homebrew-red))))
   `(rpm-spec-macro-face ((,class (:foreground ,homebrew-yellow))))
   `(rpm-spec-obsolete-tag-face ((,class (:foreground ,homebrew-red))))
   `(rpm-spec-package-face ((,class (:foreground ,homebrew-red))))
   `(rpm-spec-section-face ((,class (:foreground ,homebrew-yellow))))
   `(rpm-spec-tag-face ((,class (:foreground ,homebrew-blue))))
   `(rpm-spec-var-face ((,class (:foreground ,homebrew-red))))

   ;; rst-mode
   `(rst-level-1-face ((,class (:foreground ,homebrew-orange))))
   `(rst-level-2-face ((,class (:foreground ,homebrew-green+1))))
   `(rst-level-3-face ((,class (:foreground ,homebrew-blue-1))))
   `(rst-level-4-face ((,class (:foreground ,homebrew-yellow-2))))
   `(rst-level-5-face ((,class (:foreground ,homebrew-cyan))))
   `(rst-level-6-face ((,class (:foreground ,homebrew-green-1))))

   ;; show-paren
   `(show-paren-mismatch ((,class (:foreground ,homebrew-red-3 :background ,homebrew-black))))
   `(show-paren-match ((,class (:foreground ,homebrew-black :background ,homebrew-pink-1))))

   `(naeu-green-face ((,class (:foreground ,homebrew-green :background ,homebrew-black))))
   `(naeu-pink-face ((,class (:foreground ,homebrew-pink-1 :background ,homebrew-black))))
   `(naeu-blue-face ((,class (:foreground ,homebrew-blue-1 :background ,homebrew-black))))
   `(naeu-orange-face ((,class (:foreground ,homebrew-yellow-1 :background ,homebrew-black))))
   `(naeu-red-face ((,class (:foreground ,homebrew-orange :background ,homebrew-black))))
   `(naeu-grey-face ((,class (:foreground ,homebrew-gray-7 :background ,homebrew-black))))

   ;; SLIME
   `(slime-repl-inputed-output-face ((,class (:foreground ,homebrew-red))))

  ;;; ansi-term
   `(term-color-black ((,class (:foreground ,homebrew-bg
                                            :background ,homebrew-bg-1))))
   `(term-color-red ((,class (:foreground ,homebrew-red-2
                                          :background ,homebrew-red-4))))
   `(term-color-green ((,class (:foreground ,homebrew-green
                                            :background ,homebrew-green+2))))
   `(term-color-yellow ((,class (:foreground ,homebrew-orange
                                             :background ,homebrew-yellow))))
   `(term-color-blue ((,class (:foreground ,homebrew-blue-1
                                           :background ,homebrew-light-blue-2))))
   `(term-color-magenta ((,class (:foreground ,homebrew-magenta
                                              :background ,homebrew-red))))
   `(term-color-cyan ((,class (:foreground ,homebrew-cyan
                                           :background ,homebrew-blue))))
   `(term-color-white ((,class (:foreground ,homebrew-fg
                                            :background ,homebrew-bg-1))))
   `(term-default-fg-color ((,class (:inherit term-color-white))))
   `(term-default-bg-color ((,class (:inherit term-color-black))))

   ;; volatile-highlights
   `(vhl/default-face ((,class (:background ,homebrew-gray-5))))

   `(undo-tree-visualizer-active-branch-face ((,class (:foreground ,homebrew-pink-1 :background ,homebrew-black))))

   ;; whitespace-mode
   `(whitespace-space ((,class (:background ,homebrew-bg :foreground ,homebrew-bg+1))))
   `(whitespace-hspace ((,class (:background ,homebrew-bg :foreground ,homebrew-bg+1))))
   `(whitespace-tab ((,class (:background ,homebrew-bg :foreground ,homebrew-red))))
   `(whitespace-newline ((,class (:foreground ,homebrew-bg+1))))
   `(whitespace-trailing ((,class (:foreground ,homebrew-red :background ,homebrew-bg))))
   `(whitespace-line ((,class (:background ,homebrew-bg-05 :foreground ,homebrew-magenta))))
   `(whitespace-space-before-tab ((,class (:background ,homebrew-orange :foreground ,homebrew-orange))))
   `(whitespace-indentation ((,class (:background ,homebrew-yellow :foreground ,homebrew-red))))
   `(whitespace-empty ((,class (:background ,homebrew-yellow :foreground ,homebrew-red))))
   `(whitespace-space-after-tab ((,class (:background ,homebrew-yellow :foreground ,homebrew-red))))

   ;; wanderlust
   `(wl-highlight-folder-few-face ((,class (:foreground ,homebrew-red-2))))
   `(wl-highlight-folder-many-face ((,class (:foreground ,homebrew-red-1))))
   `(wl-highlight-folder-path-face ((,class (:foreground ,homebrew-orange))))
   `(wl-highlight-folder-unread-face ((,class (:foreground ,homebrew-blue))))
   `(wl-highlight-folder-zero-face ((,class (:foreground ,homebrew-fg))))
   `(wl-highlight-folder-unknown-face ((,class (:foreground ,homebrew-blue))))
   `(wl-highlight-message-citation-header ((,class (:foreground ,homebrew-red-1))))
   `(wl-highlight-message-cited-text-1 ((,class (:foreground ,homebrew-red))))
   `(wl-highlight-message-cited-text-2 ((,class (:foreground ,homebrew-green+2))))
   `(wl-highlight-message-cited-text-3 ((,class (:foreground ,homebrew-blue))))
   `(wl-highlight-message-cited-text-4 ((,class (:foreground ,homebrew-blue+1))))
   `(wl-highlight-message-header-contents-face ((,class (:foreground ,homebrew-green))))
   `(wl-highlight-message-headers-face ((,class (:foreground ,homebrew-red+1))))
   `(wl-highlight-message-important-header-contents ((,class (:foreground ,homebrew-green+2))))
   `(wl-highlight-message-header-contents ((,class (:foreground ,homebrew-green+1))))
   `(wl-highlight-message-important-header-contents2 ((,class (:foreground ,homebrew-green+2))))
   `(wl-highlight-message-signature ((,class (:foreground ,homebrew-green))))
   `(wl-highlight-message-unimportant-header-contents ((,class (:foreground ,homebrew-fg))))
   `(wl-highlight-summary-answered-face ((,class (:foreground ,homebrew-blue))))
   `(wl-highlight-summary-disposed-face ((,class (:foreground ,homebrew-fg
                                                         :slant italic))))
   `(wl-highlight-summary-new-face ((,class (:foreground ,homebrew-blue))))
   `(wl-highlight-summary-normal-face ((,class (:foreground ,homebrew-fg))))
   `(wl-highlight-summary-thread-top-face ((,class (:foreground ,homebrew-yellow))))
   `(wl-highlight-thread-indent-face ((,class (:foreground ,homebrew-magenta))))
   `(wl-highlight-summary-refiled-face ((,class (:foreground ,homebrew-fg))))
   `(wl-highlight-summary-displaying-face ((,class (:underline t :weight bold))))

   ;; which-func-mode
   `(which-func ((,class (:foreground ,homebrew-green+4))))

  
   ;; yasnippet
   `(yas/field-highlight-face ((,class (:background ,homebrew-pink-1 :foreground ,homebrew-black))))

   ;; enh-ruby-mode enh-ruby-op-face
   `(enh-ruby-op-face ((,class (:foreground ,homebrew-blue-7))))
   `(enh-ruby-heredoc-delimiter-face ((,class (:foreground ,homebrew-green+2))))
   `(enh-ruby-string-delimiter-face ((,class (:foreground ,homebrew-green+2))))
   `(enh-ruby-regexp-delimiter-face ((,class (:foreground ,homebrew-blue-1))))

   ;; yascroll
   `(yascroll:thumb-text-area ((,class (:background ,homebrew-bg-1))))
   `(yascroll:thumb-fringe ((,class (:background ,homebrew-bg-1 :foreground ,homebrew-bg-1))))
   )

  ;;; custom theme variables
  (custom-theme-set-variables
   'homebrew
   `(ansi-color-names-vector [,homebrew-bg ,homebrew-red-2 ,homebrew-green ,homebrew-orange
                                          ,homebrew-blue-1 ,homebrew-magenta ,homebrew-cyan ,homebrew-fg])
   ;; fill-column-indicator
   `(fci-rule-color ,homebrew-bg-05)))

;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'homebrew)

;; Local Variables:
;; no-byte-compile: t
;; indent-tabs-mode: nil
;; eval: (when (fboundp 'rainbow-mode) (rainbow-mode +1))
;; End:

;;; homebrew-theme.el ends here.
