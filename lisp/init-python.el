;;; lisp/init-python.el -*- lexical-binding: t; -*-

(after! python
  (set-popup-rules!
    '(("^\\*Flycheck errors\\*$" :size 0.22))
    )
  ;(setq-default flycheck-disabled-checkers '(python-pylint lsp))
  ;;(set-formatter! 'autopep8 "autopep8 -")
  (add-hook! 'before-save-hook 'py-isort-before-save)

(use-package! lsp-pyright
 :config
 (setq lsp-pyright-venv-path '(expand-file-name "~/envs/py37"))
 )
 )
(defun my-python-checker ()
    (flycheck-select-checker 'python-flake8))
(add-hook! 'python-mode-local-vars-hook #'my-python-checker)


(provide 'init-python)
