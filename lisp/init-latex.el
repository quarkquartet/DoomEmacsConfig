;;; lisp/init-latex.el -*- lexical-binding: t; -*-
(map! :after cdlatex
      :map cdlatex-mode-map
      "TAB" 'cdlatex-tab)
(after! latex
(use-package! reftex
  :config
  (setq reftex-plug-into-AUCTeX '(nil nil t t t))
  ))
(setq +latex-viewers '(skim))
(provide 'init-latex)
