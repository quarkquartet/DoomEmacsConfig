;;; lisp/init-lsp.el -*- lexical-binding: t; -*-


(after! lsp
  ;(use-package! company-lsp)
  (use-package! lsp-ui
    :hook (lsp-mode . lsp-ui-mode)
    :config
    (setq
     lsp-ui-sideline-enable nil
     lsp-completion-enable t
     lsp-ui-doc-position 'at-point
     lsp-ui-doc-header nil
     lsp-ui-doc-include-signature t)
    (lsp-register-client
     (make-lsp-client :new-connection (lsp-tramp-connection "ssh:wh302@one.cs.rutgers.edu:/common/home/wh302/node_modules/pyright")
                      :major-modes '(python-mode)
                      :remote? t
                      :server-id 'pyright))
  ))
(after! lsp-ui
  (add-hook! 'lsp-ui-mode-hook
    (run-hooks (intern (format "%s-lsp-ui-hook" major-mode)))))


(provide 'init-lsp)
