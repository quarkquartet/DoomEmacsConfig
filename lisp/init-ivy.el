(when (icons-displayable-p)
(use-package! all-the-icons-ivy-rich
  ;:ensure t
  :hook (ivy-mode . all-the-icons-ivy-rich-mode)
  (all-the-icons-ivy-rich-reload))
  )


;; More friendly display transformer for Ivy
(use-package! ivy-rich
  :hook ((counsel-projectile-mode . ivy-rich-mode) ; MUST after `counsel-projectile'
         (ivy-rich-mode . (lambda ()
                            "Use abbreviate in `ivy-rich-mode'."
                            (setq ivy-virtual-abbreviate
                                  (or (and ivy-rich-mode 'abbreviate) 'name)))))
  :init
  ;; For better performance
  ;(ivy-rich-mode 1)
  (setq ivy-rich-parse-remote-buffer nil))
;;(use-package! all-the-icons-ivy-rich
;;  :ensure t
;;  :init (all-the-icons-ivy-rich-mode 1))
;;
;;(use-package! ivy-rich
;;  :ensure t
;;  :init (ivy-rich-mode 1))

(provide 'init-ivy)
