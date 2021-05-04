;;; lisp/init-basic.el -*- lexical-binding: t; -*-

(setq user-full-name "Isaac Wang"
      user-mail-address "hepisaacf@gmail.com"
      company-idle-delay 0.1
      flycheck-checker-error-threshold 50000
      org-directory "~/org/"
      display-line-numbers-type t
      confirm-kill-emacs nil
      lsp-file-watch-threshold 50000
      company-minimum-prefix-length 1
      treemacs-width 28)
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
        (set-face-attribute 'default nil :font (format "%s:pixelsize=%d" "Fira Code" 13)) ;; 11 13 17 19 23
        ;; chinese font 中文字体
        (dolist (charset '(kana han symbol cjk-misc bopomofo))
          (set-fontset-font (frame-parameter nil 'font)
                            charset
                            (font-spec :family "STKaiti" :size 15)))) ;; 14 16 20 22 28
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
    (load-theme 'doom-one t))
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



;; ========================================
;; Grammarly
;; ========================================
(if (display-graphic-p)
    (progn
      (load-file "~/.doom.d/plugins/send-to-osx-grammarly/send-to-osx-grammarly.el")
      (call-process-shell-command "osascript ~/.emacs.d/plugins/send-to-osx-grammarly/pull.scpt")
      (define-key global-map (kbd "C-c C-g h") #'send-to-osx-grammarly-push)
      (define-key global-map (kbd "C-c C-g l") #'send-to-osx-grammarly-pull)))

;; ========================================
;; Treemacs
;; ========================================

(global-set-key (kbd "M-0") 'treemacs-select-window)

;; ========================================
;; PDF View Mode
;; ========================================
(add-hook 'pdf-view-mode-hook 'pdf-continuous-scroll-mode)
(map! :after pdf-sync
      "C-c j" 'pdf-sync-forward-search)


;; ========================================
;; stop completing english word
;; ========================================
(set-company-backend! 'text-mode '(:separate company-yasnippet))
(after! company
  (add-to-list 'company-backends 'company-files))

;; ========================================
;; eaf
;; ========================================
;;(use-package! eaf
;;  :config
;;  (eaf-setq eaf-browser-dark-mode "true")
;;  (eaf-setq eaf-terminal-dark-mode "false")
;;  (eaf-setq eaf-mindmap-dark-mode "follow") ; default option
;;  (eaf-setq eaf-pdf-dark-mode "false")
;;  (eaf-setq eaf-browser-enable-adblocker "true")
;;  (eaf-bind-key scroll_up "C-n" eaf-pdf-viewer-keybinding)
;;  (eaf-bind-key scroll_down "C-p" eaf-pdf-viewer-keybinding)
;;  )
(use-package! eaf
  :config
  (eaf-setq eaf-browser-dark-mode "false")
  (setq browse-url-browser-function 'eaf-open-browser)
  (defalias 'browse-web #'eaf-open-browser))


(provide 'init-basic)
