;;; lisp/init-basic.el -*- lexical-binding: t; -*-

(setq user-full-name "Isaac Wang"
      user-mail-address "hepisaacf@gmail.com"
      company-idle-delay 0.1
      flycheck-checker-error-threshold 50000
      org-directory "~/org/"
      display-line-numbers-type t
      confirm-kill-emacs nil
      lsp-file-watch-threshold 50000
      treemacs-width 28)
(setq-default cursor-type 'bar)
;; ========================================
;; font
;; ========================================

(when (display-graphic-p)
  (defun set-font (english chinese english-size chinese-size)
    (set-face-attribute 'default nil :font
                        (format   "%s:pixelsize=%d"  english english-size))
    (dolist (charset '(kana han symbol cjk-misc bopomofo))
      (set-fontset-font (frame-parameter nil 'font) charset
                        (font-spec :family chinese :size chinese-size))))
  (set-font "Monaco" "STKaiti" 12 14)
  )

;; ========================================
;; Themes
;; ========================================
(use-package! doom-themes
  :config
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t)
  (load-theme 'doom-one t)
  (doom-themes-visual-bell-config)
  (doom-themes-org-config)
  )
(use-package! kaolin-themes
  :config
  (kaolin-treemacs-theme))

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

(global-set-key (kbd "M-0") 'treemacs-select-window)

(provide 'init-basic)
