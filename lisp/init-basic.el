(setq user-full-name "Isaac Wang"
      user-mail-address "isaac.wang.us@gmail.com"
      company-idle-delay 0.05
      company-minimum-prefix-length 2
      flycheck-checker-error-threshold 5000
      org-directory "~/org/"
      org-roam-directory "~/org/"
      display-line-numbers-type t
      confirm-kill-emacs nil
      doom-modeline-major-mode-icon t
      doom-modeline-lsp nil
      +org-roam-open-buffer-on-find-file nil
      lsp-ui-sideline-enable nil
      lsp-ui-doc-enable nil
      lsp-signature-auto-activate nil
      lsp-file-watch-threshold 5000
      lsp-modeline-code-actions-enable nil
      lsp-eldoc-enable-hover nil
      lsp-modeline-diagnostics-enable nil
      frame-title-format "%b"
      treemacs-width 32)
(+global-word-wrap-mode +1)

;; ========================================
;; Font settings, include 中文字体
;; ========================================

(defun +my/better-font()
  (interactive)
;; english font
  (if (display-graphic-p)
      (progn
        (set-face-attribute 'default nil :font (font-spec :family "Menlo" :size 12))
        ;(set-fontset-font t 'unicode (font-spec :family "MesloLGS Nerd Font Mono") nil 'prepend)
        (setq doom-unicode-font (font-spec :family "MesloLGS Nerd Font Mono"))
        (dolist (charset '(kana han symbol cjk-misc bopomofo))
          (set-fontset-font (frame-parameter nil 'font)
                            charset
                            (font-spec :family "STHeiti" :size 13)))
        (dolist (charset '(?\x25C9 ?\x25CB ?\x2738 ?\x273F))
          (set-fontset-font nil charset (font-spec :family "MesloLGS Nerd Font Mono" :size 12)))
        ) ;; 14 16 20 22 28
))


(defun +my|init-font(frame)
  (with-selected-frame frame
    (if (display-graphic-p)
        (+my/better-font))))

(if (and (fboundp 'daemonp) (daemonp))
  (add-hook 'after-make-frame-functions #'+my|init-font)
 (+my/better-font))


;; ========================================
;; Themes
;; ========================================
(use-package! doom-themes
  :config
  ;; Global settings (defaults)
  (setq doom-theme 'doom-dracula)
  (doom-themes-visual-bell-config)
  (doom-themes-org-config)
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
