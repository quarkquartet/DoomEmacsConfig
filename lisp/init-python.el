;;; lisp/init-python.el -*- lexical-binding: t; -*-

(after! python
  (set-popup-rules!
    '(("^\\*Flycheck errors\\*$" :size 0.22))
    )
  (setq conda-anaconda-home (expand-file-name "~/opt/anaconda3")
        conda-env-home-directory (expand-file-name "~/opt/anaconda3")
        flycheck-disabled-checkers '(python-pylint)
        )
  (conda-env-activate "py37")
  (set-formatter! 'autopep8 "autopep8 -")
  (add-hook! 'before-save-hook 'py-isort-before-save)
  )
(add-hook! python-mode-lsp-ui-hook
  (lambda()
    (flycheck-select-checker 'python-flake8)
    )
  )

(provide 'init-python)
