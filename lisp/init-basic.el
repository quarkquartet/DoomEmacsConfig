(setq user-full-name "Isaac Wang"
      user-mail-address "isaac.wang.us@gmail.com"
      company-idle-delay 0.05
      company-minimum-prefix-length 2
      flycheck-checker-error-threshold 5000
      display-line-numbers-type t
      confirm-kill-emacs nil
      doom-modeline-major-mode-icon t
      doom-modeline-lsp nil
      lsp-ui-sideline-enable nil
      lsp-ui-doc-enable nil
      lsp-signature-auto-activate nil
      lsp-file-watch-threshold 5000
      lsp-modeline-code-actions-enable nil
      lsp-eldoc-enable-hover nil
      lsp-modeline-diagnostics-enable nil
      frame-title-format "%b"
      doom-font (font-spec :family "Monaco" :size 13)
      treemacs-width 32)
(+global-word-wrap-mode +1)
;; ========================================
;; Themes
;; ========================================
(use-package! doom-themes
  :config
  ;; Global settings (defaults)
  (setq doom-theme 'doom-one)
  (doom-themes-visual-bell-config)
  (setq doom-themes-treemacs-theme "doom-colors")
  (doom-themes-treemacs-config)
  )
;(setq org-hide-leading-stars t)

;; ========================================
;; Highlight-indent guide
;; ========================================
(use-package! highlight-indent-guides
  :config
  (defun +indent-guides-for-all-but-first-column (level responsive display)
    (unless (< level 1)
      (highlight-indent-guides--highlighter-default level responsive display)))
  (setq highlight-indent-guides-highlighter-function #'+indent-guides-for-all-but-first-column)
  )
;; ========================================
;; stop completing english word
;; ========================================
(set-company-backend! 'text-mode '(:separate company-yasnippet))
(after! company
  (add-to-list 'company-backends 'company-files))

;; ========================================
;; Treemacs
;; ========================================
(map! :desc "Switch cursor between treemacs and other window" :g "M-0" #'treemacs-select-window)



(provide 'init-basic)
