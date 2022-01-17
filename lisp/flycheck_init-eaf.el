(use-package! eaf
  :load-path "~/.doom.d/emacs-application-framework/"
  :commands (eaf-open)
  :config
  (require 'eaf-pdf-viewer)
  (require 'eaf-markdown-previewer)
  (require 'eaf-org-previewer)
  (require 'eaf-browser)
  (setq eaf-pdf-dark-mode nil
        eaf-markdown-dark-mode nil
        eaf-org-dark-mode nil
        eaf-browser-dark-mode nil))
(map! :leader :desc "Use EAF to open file" :n "e" #'eaf-open)

(provide 'init-eaf)
