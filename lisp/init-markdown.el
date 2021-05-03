;;; lisp/init-markdown.el -*- lexical-binding: t; -*-
(after! markdown
  (use-package! eaf
    :config
    (eaf-setq eaf-markdown-dark-mode "false")))

(provide 'init-markdown)
