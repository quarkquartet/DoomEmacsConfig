;;; lisp/init-lsp.el -*- lexical-binding: t; -*-

;;(use-package! lsp-ui
;;  :hook (lsp-mode . lsp-ui-mode)
;;  :config
;;  (setq
;;   lsp-ui-sideline-enable nil
;;   lsp-completion-enable t
;;   lsp-ui-doc-position 'at-point
;;   lsp-ui-doc-header nil
;;   lsp-ui-doc-include-signature t)
;;)
;;(after! lsp-ui
;;  (add-hook! 'lsp-ui-mode-hook
;;    (run-hooks (intern (format "%s-lsp-ui-hook" major-mode)))))

(use-package! lsp-ui
  :hook (lsp-mode . lsp-ui-mode)
  :init
  ;; (setq-default lsp-ui-doc-frame-parameters
  ;;               '((left . -1)
  ;;                 (top . -1)
  ;;                 (no-accept-focus . t)
  ;;                 (min-width . 0)
  ;;                 (width . 0)
  ;;                 (min-height . 0)
  ;;                 (height . 0)
  ;;                 (internal-border-width . 5)
  ;;                 (vertical-scroll-bars)
  ;;                 (horizontal-scroll-bars)
  ;;                 (left-fringe . 0)
  ;;                 (right-fringe . 0)
  ;;                 (menu-bar-lines . 0)
  ;;                 (tool-bar-lines . 0)
  ;;                 (line-spacing . 0.1)
  ;;                 (unsplittable . t)
  ;;                 (undecorated . t)
  ;;                 (minibuffer . nil)
  ;;                 (visibility . nil)
  ;;                 (mouse-wheel-frame . nil)
  ;;                 (no-other-frame . t)
  ;;                 (cursor-type)
  ;;                 (no-special-glyphs . t)))
  :config
  (setq
   lsp-ui-flycheck-enable t
   lsp-ui-sideline-enable nil
   lsp-ui-sideline-ignore-duplicate t
   lsp-completion-enable t
   lsp-ui-doc-position 'at-point
   lsp-ui-doc-header nil
   lsp-ui-doc-enable t
   lsp-ui-doc-include-signature t
   lsp-ui-doc-border (doom-color 'fg))
  (defun +my/hover-or-signature-help ()
    (if (evil-insert-state-p)
      (lsp-hover)))
  (setq lsp-eldoc-hook '(lsp-document-highlight +my/hover-or-signature-help)))
(provide 'init-lsp)
