;;; lisp/init-python.el -*- lexical-binding: t; -*-


  (defun my-flycheck-setup ()
    (flycheck-add-next-checker 'python-flake8))
  (add-hook 'python-mode-local-vars-hook #'my-flycheck-setup)
(after! python
  (set-popup-rules!
    '(("^\\*Flycheck errors\\*$" :size 0.22))
    )
  ;(setq-default flycheck-disabled-checkers '(python-pylint lsp))
  ;;(set-formatter! 'autopep8 "autopep8 -")
  (add-hook! 'before-save-hook 'py-isort-before-save)

  (use-package! lsp-pyright
    :hook (python-mode . (lambda ()
                          (require 'lsp-pyright)
                          (lsp)))
    :config
    (setq lsp-pyright-venv-path '(expand-file-name "~/envs/py37"))
    )
  )

(provide 'init-python)
