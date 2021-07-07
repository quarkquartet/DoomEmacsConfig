;;; lisp/init-eaf.el -*- lexical-binding: t; -*-
;(setq browse-url-browser-function 'eaf-open-browser)
;(defalias 'browse-web #'eaf-open-browser)
(defadvice! adviser-find-file (orig-fn file &rest args)
  :around #'find-file
  (let ((fn (if (commandp 'eaf-open) 'eaf-open orig-fn)))
    (pcase (file-name-extension file)
      ("pdf"  (apply fn file nil))
      ("epub" (apply fn file nil))
      (_      (apply orig-fn file args)))))

(after! eaf
  :config
  (eaf-setq eaf-browser-dark-mode "false")
  (eaf-setq eaf-terminal-dark-mode "false")
  (eaf-setq eaf-mindmap-dark-mode "follow") ; default option
  (eaf-setq eaf-pdf-dark-mode "false")
  (eaf-setq eaf-browser-enable-adblocker "true")
  (eaf-bind-key scroll_up "C-n" eaf-pdf-viewer-keybinding)
  (eaf-bind-key scroll_down "C-p" eaf-pdf-viewer-keybinding)
  (eaf-setq eaf-markdown-dark-mode "false")
  )


(provide 'init-eaf)
