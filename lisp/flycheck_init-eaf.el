(use-package! eaf
  :load-path "~/.doom.d/emacs-application-framework/"
  :commands (eaf-open)
  :config
  (require 'eaf-pdf-viewer)
  (require 'eaf-markdown-previewer)
  (setq eaf-pdf-dark-mode nil))
(map! :leader :desc "Use EAF to open file" :n "e" #'eaf-open)

(provide 'init-eaf)
