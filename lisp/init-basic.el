;;; lisp/init-basic.el -*- lexical-binding: t; -*-

(setq user-full-name "Isaac Wang"
      user-mail-address "hepisaacf@gmail.com"
      company-idle-delay 0.1
      company-minimum-prefix-length 2
      flycheck-checker-error-threshold 5000
      org-directory "~/org/"
      org-roam-directory "~/org/"
      org-roam-v2-ack t
      display-line-numbers-type t
      confirm-kill-emacs nil
      doom-modeline-major-mode-icon t
      doom-modeline-lsp nil
      +org-roam-open-buffer-on-find-file nil
      lsp-signature-auto-activate nil
      lsp-file-watch-threshold 5000
      lsp-modeline-code-actions-enable nil
      lsp-eldoc-enable-hover nil
      lsp-modeline-diagnostics-enable nil
      git-gutter-fringe t
      treemacs-width 32)
(setq-default cursor-type 'bar)
(+global-word-wrap-mode +1)

;; ========================================
;; font 中文字体
;; ========================================
(defun +my/better-font()
  (interactive)
;; english font
  (if (display-graphic-p)
      (progn
        (set-face-attribute 'default nil :font (font-spec :family "MonacoB" :size 12))
        ;(set-fontset-font t 'unicode (font-spec :family "MesloLGS Nerd Font Mono") nil 'prepend)
        (setq doom-unicode-font (font-spec :family "Monaco Nerd Font Mono"))
        (dolist (charset '(kana han symbol cjk-misc bopomofo))
          (set-fontset-font (frame-parameter nil 'font)
                            charset
                            (font-spec :family "STHeiti" :size 13)))
        (dolist (charset '(?\x25C9 ?\x25CB ?\x2738 ?\x273F))
          (set-fontset-font nil charset (font-spec :family "Monaco Nerd Font Mono" :size 12)))) ;; 14 16 20 22 28
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
  (setq doom-themes-enable-bold t)
  (if (display-graphic-p)
      (load-theme 'doom-one t)
    (load-theme 'doom-molokai t))
  (doom-themes-visual-bell-config)
  (doom-themes-org-config)
  (setq doom-themes-treemacs-theme "doom-colors")
  (doom-themes-treemacs-config)
  )
(setq org-hide-leading-stars t)
;;(use-package! kaolin-themes
;;  :config
;;  (kaolin-treemacs-theme))

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
;; Treemacs
;; ========================================

(global-set-key (kbd "M-0") 'treemacs-select-window)

;; ========================================
;; PDF View Mode
;; ========================================
;;add-hook 'pdf-view-mode-hook 'pdf-continuous-scroll-mode)
;;map! :after pdf-sync
;;     "C-c j" 'pdf-sync-forward-search)
;; ========================================
;; stop completing english word
;; ========================================
(set-company-backend! 'text-mode '(:separate company-yasnippet))
(after! company
  (add-to-list 'company-backends 'company-files))


(provide 'init-basic)
