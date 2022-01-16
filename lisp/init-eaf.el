(use-package! eaf
  :load-path "~/.doom.d/emacs-application-framework/"
  :commands (eaf-open)
  :config
  (require 'eaf-pdf-viewer)
  (require 'eaf-markdown-previewer)
  (setq eaf-pdf-dark-mode nil))


(provide 'init-eaf)
