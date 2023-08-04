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
      counsel-grep-swiper-limit 1000000
      treemacs-width 32)
(setq-default line-spacing 0.17)
(+global-word-wrap-mode +1)
(set-popup-rules!
  '(("^\\*Flycheck errors\\*$" :size 0.22))
  )
;;;; ========================================
;;;; Font settings, include 中文字体
;;;; ========================================
(defun +my/better-font()
  (interactive)
  ;; english font
  (if (display-graphic-p)
      (progn
        (set-face-attribute 'default nil :font (font-spec :family "MesloLGM Nerd Font" :size 13))
                                        ;(set-fontset-font t 'unicode (font-spec :family "MesloLGS Nerd Font Mono") nil 'prepend)
                                        ;        (setq doom-font (font-spec :family "MesloLGM Nerd Font Mono" :size 13))
        (setq doom-unicode-font (font-spec :family "MesloLGM Nerd Font"))
        (dolist (charset '(kana han symbol cjk-misc bopomofo))
          (set-fontset-font (frame-parameter nil 'font)
                            charset
                            (font-spec :family "STKaiti" :size 15)))
;;;        (dolist (charset '(?\x25C9 ?\x25CB ?\x2738 ?\x273F))
 ;;;         (set-fontset-font nil charset (font-spec :family "MesloLGM Nerd Font Mono" :size 13)))
        ) ;; 14 16 20 22 28
    )
  )


(defun +my|init-font(frame)
  (with-selected-frame frame
    (if (display-graphic-p)
        (+my/better-font))))

(if (and (fboundp 'daemonp) (daemonp))
    (add-hook 'after-make-frame-functions #'+my|init-font)
  (+my/better-font))
;;
;;
;;;; ========================================
;;;; Themes
;;;; ========================================
;;;;(defun my/apply-theme (appearance)
;;;;  "Load theme, taking current system APPEARANCE into consideration."
;;;;  (mapc #'disable-theme custom-enabled-themes)
;;;;  (pcase appearance
;;;;    ('light
;;;;     (load-theme 'doom-solarized-light t))
;;;;    ('dark (load-theme 'doom-one t)
;;;;           )))
;;;;
;; (add-hook 'ns-system-appearance-change-functions #'my/apply-theme)
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
