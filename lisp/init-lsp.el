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
  :config
  (setq
   lsp-ui-sideline-enable nil
   lsp-completion-enable t
   lsp-ui-doc-header nil
   lsp-ui-sideline-show-hover nil)
  )
(provide 'init-lsp)
