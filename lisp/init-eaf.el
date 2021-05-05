;;; lisp/init-eaf.el -*- lexical-binding: t; -*-
(after! eaf
  :config
  (eaf-setq eaf-browser-dark-mode "true")
  (eaf-setq eaf-terminal-dark-mode "false")
  (eaf-setq eaf-mindmap-dark-mode "follow") ; default option
  (eaf-setq eaf-pdf-dark-mode "false")
  (eaf-setq eaf-browser-enable-adblocker "true")
  (eaf-bind-key scroll_up "C-n" eaf-pdf-viewer-keybinding)
  (eaf-bind-key scroll_down "C-p" eaf-pdf-viewer-keybinding)
  )


(provide 'init-eaf)
