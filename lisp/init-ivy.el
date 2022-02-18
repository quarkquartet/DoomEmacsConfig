(use-package all-the-icons-ivy-rich
  :hook (ivy-mode . all-the-icons-ivy-rich-mode)
  :config
  (all-the-icons-ivy-rich-reload))

;; More friendly display transformer for Ivy
(use-package ivy-rich
  :hook ((counsel-projectile-mode . ivy-rich-mode) ; MUST after `counsel-projectile'
         (ivy-rich-mode . ivy-rich-project-root-cache-mode)
         (ivy-rich-mode . (lambda ()
                            "Use abbreviate in `ivy-rich-mode'."
                            (setq ivy-virtual-abbreviate
                                  (or (and ivy-rich-mode 'abbreviate) 'name)))))
  :init
  ;; For better performance
  (setq ivy-rich-parse-remote-buffer nil)
  :config
  (all-the-icons-ivy-rich-mode 1))
(after! counsel-projectile
  (all-the-icons-ivy-rich-reload))
(provide 'init-ivy)
