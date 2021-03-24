;;; lisp/init-basic.el -*- lexical-binding: t; -*-

(setq user-full-name "Isaac Wang"
      user-mail-address "hepisaacf@gmail.com"
      company-idle-delay 0.01
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
(defun +my/better-font()
  (interactive)
  ;; english font
  (if (display-graphic-p)
      (progn
        (set-face-attribute 'default nil :font (format "%s:pixelsize=%d" "Fira Code" 13)) ;; 11 13 17 19 23
        ;; chinese font 中文字体
        (dolist (charset '(kana han symbol cjk-misc bopomofo))
          (set-fontset-font (frame-parameter nil 'font)
                            charset
                            (font-spec :family "STKaiti" :size 14)))) ;; 14 16 20 22 28
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
  (load-theme 'doom-one t)
  (doom-themes-visual-bell-config)
  (doom-themes-org-config)
  )
(use-package! kaolin-themes
  :config
  (kaolin-treemacs-theme))


(global-set-key (kbd "M-0") 'treemacs-select-window)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

(provide 'init-basic)
