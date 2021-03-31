;;; lisp/init-latex.el -*- lexical-binding: t; -*-
(map! :after cdlatex
      :map cdlatex-mode-map
      "TAB" 'cdlatex-tab)
(use-package! reftex
  :config
  (setq reftex-plug-into-AUCTeX '(nil nil t t t))
  )
(provide 'init-latex)
