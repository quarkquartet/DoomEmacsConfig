;;; lisp/init-org.el -*- lexical-binding: t; -*-

(add-hook! 'org-mode-hook
  (setq-local line-spacing 0.45))
(map! :map org-mode-map
      :localleader "M" #'cdlatex-environment)
(after! org
  (setq org-agenda-files '("~/org/"))
  (setq org-image-actual-width '(500))
  (setq org-agenda-custom-commands
        '(
          ("w" . "任务安排")
          ("wa" "重要且紧急的任务" tags-todo "+PRIORITY=\"A\"")
          ("wb" "重要但不紧急的任务" tags-todo "-weekly-monthly-daily+PRIORITY=\"B\"")
          ("wc" "不重要的任务" tags-todo "+PRIORITY=\"C\"")
          ("W" "Weekly Review"
           ((stuck "") ;; review stuck projects as designated by org-stuck-projects
            (tags-todo "project")
            (tags-todo "daily")
            (tags-todo "weekly")
            (tags-todo "reading")
            ))
          ))
  (setq org-todo-keywords
        '((sequence "TODO(t)" "DOING(s)" "WAIT(w)" "|" "DONE(d!)" "CANCELED(c @/!)")))
  (setq org-todo-keyword-faces
        '(
          ("TODO"  .   (:foreground "red" :weight bold))
          ("DOING" .   (:foreground "orange" :weight bold))
          ("WAIT" . (:foreground "SkyBlue" :weight bold))
          ("DONE" .    (:foreground "green" :weight bold))
          ("CANCELED" .     (:foreground "green" :weight bold))
          ))
  ;; 优先级范围和默认任务的优先级
  (setq org-highest-priority ?A)
  (setq org-lowest-priority  ?C)
  ;; 优先级醒目外观
  (setq org-priority-faces
        '((?A . (:background "red" :foreground "white" :weight bold))
          (?B . (:background "DarkOrange" :foreground "white" :weight bold))
          (?C . (:background "yellow" :foreground "DarkGreen" :weight bold))
          ))
  (setq org-enforce-todo-dependencies t)
  ;; 绑定键位
  (defvar org-agenda-dir "" "gtd org files location")
  (setq-default org-agenda-dir "~/org/")
  (setq org-agenda-file-log (expand-file-name "2021.org" org-agenda-dir))
  (setq org-agenda-file-gtd (expand-file-name "gtd.org" org-agenda-dir))
  (setq org-clock-clocktable-default-properties
        '(:link t :maxlevel 6 :fileskip0 t :compact nil :narrow 60 :score 0 :scope agenda-with-archives))
  (setq org-refile-targets (quote ((nil :maxlevel . 9)
                                   (org-agenda-file-log :maxlevel . 9))))
  (setq org-refile-use-outline-path t)
  (setq org-outline-path-complete-in-steps nil)
  (setq org-refile-allow-creating-parent-nodes (quote confirm))
  (setq org-format-latex-options '(:foreground default :background default :scale 1.5 :html-foreground "Black" :html-background "Transparent" :html-scale 1.0 :matchers ("begin" "$1" "$" "$$" "\\(" "\\[")))
  (setq org-startup-with-latex-preview t)
  )

;;---------------------------
;; Org-ref-bibtex
;;---------------------------
(setq bibliography-path "~/org/literature/library.bib")
(setq pdf-path "~/Dropbox/Zotero\ Papers")
(setq bibliography-notes "~/org/literature/")
(use-package! org-ref
  :after org
  :config
  (setq
   org-ref-completion-library 'org-ref-ivy-cite
   org-ref-get-pdf-filename-function 'org-ref-get-pdf-filename-helm-bibtex
   org-ref-default-bibliography (list "~/org/literature/library.bib")
   org-ref-notes-directory bibliography-notes
   org-ref-notes-function 'orb-org-ref-edit-note)
  (setq
   bibtex-completion-notes-path bibliography-notes
   bibtex-completion-bibliography bibliography-path
   bibtex-completion-pdf-field "file"
   )
  (org-ref-ivy-cite-completion)
  )
(use-package! org-roam
  :after org
  :init
  (map!
       :map org-mode-map
       :localleader
       :prefix ("m" . "org-roam")
       "b" #'org-roam-switch-to-buffer
       "f" #'org-roam-find-file
       "g" #'org-roam-graph
       "i" #'org-roam-insert
       "I" #'org-roam-insert-immediate
       "m" #'org-roam
       "t" #'org-roam-tag-add
       "T" #'org-roam-tag-delete
       (:prefix ("d" . "by date")
        :desc "Find previous note" "b" #'org-roam-dailies-find-previous-note
        :desc "Find date"          "d" #'org-roam-dailies-find-date
        :desc "Find next note"     "f" #'org-roam-dailies-find-next-note
        :desc "Find tomorrow"      "m" #'org-roam-dailies-find-tomorrow
        :desc "Capture today"      "n" #'org-roam-dailies-capture-today
        :desc "Find today"         "t" #'org-roam-dailies-find-today
        :desc "Capture Date"       "v" #'org-roam-dailies-capture-date
        :desc "Find yesterday"     "y" #'org-roam-dailies-find-yesterday
        :desc "Find directory"     "." #'org-roam-dailies-find-directory)
        "f" #'org-roam-node-find
       "i" #'org-roam-node-insert
       "b" #'org-roam-buffer
       "t" #'org-roam-tag-add
       "T" #'org-roam-tag-remove)

  :config
  (setq org-roam-mode-section-functions '(org-roam-backlinks-section org-roam-reflinks-section))
  (setq org-roam-db-location (or org-roam-db-location
                                 (concat doom-etc-dir "org-roam.db"))
        ;; Make org-roam buffer sticky; i.e. don't replace it when opening a
        ;; file with an *-other-window command.
        org-roam-buffer-window-parameters '((no-delete-other-windows . t))
        org-roam-link-use-custom-faces 'everywhere
        org-roam-completion-everywhere t
        )
  (set-popup-rules!
    `((,(regexp-quote org-roam-buffer) ; persistent org-roam buffer
       :side right :width .33 :height .5 :ttl nil :modeline nil :quit nil :slot 1)
      ("^org-roam:" ; node dedicated org-roam buffer
       :side right :width .33 :height .5 :ttl nil :modeline nil :quit nil :slot 2)))

  (add-hook 'org-roam-mode-hook #'doom/toggle-line-numbers)
  (org-roam-setup)
  )
(after! org-roam
  (org-roam-bibtex-mode))
(use-package! org-roam-bibtex
  :after org-roam
  :init
  (map! :map org-mode-map
        :localleader "]" #'orb-insert-link)
  :config
  (require 'org-ref)
  (require 'ivy-bibtex)
  (setq orb-insert-interface 'ivy-bibtex
        orb-note-actions-interface 'ivy
        orb-insert-link-description 'citation
        )
  (setq orb-preformat-keywords '("citekey" "author" "title" "url" "year"))
  (setq org-roam-capture-templates
        '(("r" "bibliography reference" plain
           ""
           :if-new
           (file+head "~/org/literature/${citekey}.org" "#+TITLE: ${title}\n #+AUTHOR: ${author}\n #+URL: ${url}\n #+YEAR: ${year}\n")
           :unnarrowed t)))
  )

(provide 'init-org)
