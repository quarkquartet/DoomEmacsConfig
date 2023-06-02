;;; lisp/init-python.el -*- lexical-binding: t; -*-

(after! python

  ;(setq-default flycheck-disabled-checkers '(python-pylint lsp))
  ;;(set-formatter! 'autopep8 "autopep8 -")
  (add-hook! 'before-save-hook 'py-isort-before-save)
  (setq conda-env-home-directory (expand-file-name "~/opt/anaconda3"))
 )
(defun my-python-checker ()
    (flycheck-select-checker 'python-flake8))
(add-hook! 'python-mode-local-vars-hook #'my-python-checker)


(provide 'init-python)
