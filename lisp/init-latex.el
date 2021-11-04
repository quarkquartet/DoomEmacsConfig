;;; lisp/init-latex.el -*- lexical-binding: t; -*-
(map! :after cdlatex
      :map cdlatex-mode-map
      "TAB" 'cdlatex-tab)
(add-hook! 'latex-mode-hook
  (setq-local line-spacing 0.35))
(after! latex
(use-package! reftex
  :config
  (setq reftex-plug-into-AUCTeX '(nil nil t t t))
  ))
(setq +latex-viewers '(skim))
(setq LaTeX-clean-intermediate-suffixes '("\\.aux" "\\.blg" "\\.brf" "\\.fot" "\\.glo"
"\\.gls"  "\\.idx" "\\.ilg" "\\.ind" "\\.lof" "\\.log"
"\\.lot"  "\\.nav" "\\.out" "\\.snm" "\\.toc" "\\.url"
 "\\.bcf" "\\.run\\.xml"    "\\.fls"
      "\\.acn" "\\.acr" "\\.alg" "\\.glg" "\\.ist"))
(provide 'init-latex)
