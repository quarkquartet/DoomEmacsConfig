(add-hook! 'org-mode-hook
  (setq-local line-spacing 0.45))
(map! :map org-mode-map
      :localleader "M" #'cdlatex-environment)
(setq org-preview-latex-default-process 'dvisvgm)


(after! org
  (setq org-enforce-todo-dependencies nil)
  (setq org-agenda-files '("~/org/main.org"))
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
        '((sequence "TODO(t)" "DOING(s)" "WAIT(w)" "|" "DONE(d)" "CANCELED(c)")))
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
  ;(setq org-enforce-todo-dependencies t)
  ;; 绑定键位
  (setq org-log-file-dir (expand-file-name "log" org-directory))
  (setq org-log-files (file-expand-wildcards (concat org-log-file-dir "/*.org")))
  (defun clock-range-files () org-agenda-files
         (append org-agenda-files org-log-files))
   (setq org-clock-clocktable-default-properties
        '(:link t :maxlevel 6 :fileskip0 t :compact nil :narrow 60 :score 0 :scope clock-range-files))
  (setq org-refile-targets '((nil :maxlevel . 9)
                             (org-log-files :maxlevel . 9)))
 ; (setq org-refile-targets (quote ((nil :maxlevel . 9)
  ;                                 (org-agenda-file-log :maxlevel . 9))))
  (setq org-refile-use-outline-path t)
  (setq org-outline-path-complete-in-steps nil)
  (setq org-refile-allow-creating-parent-nodes (quote confirm))
  (setq org-startup-with-latex-preview t)
  (setq warning-suppress-types '((org-element-cache)))
  (plist-put org-format-latex-options :scale 1.8)

;  (plist-put org-format-latex-options :background "Transparent")
  )


;;---------------------------
;; Org-roam-bibtex
;;---------------------------
;;
(setq bibliography-path "~/org/literature/library.bib")
(setq bibliography-notes "~/org/literature/")
(use-package! org-ref
  :after org
  :config
  (setq
   org-ref-insert-link-function 'org-ref-ivy-insert-cite-link
   org-ref-default-bibliography bibliography-path
   org-ref-notes-directory bibliography-notes
   org-ref-notes-function 'orb-org-ref-edit-note)
  (setq
   bibtex-completion-notes-path bibliography-notes
   bibtex-completion-bibliography bibliography-path
   bibtex-completion-pdf-field "file"
   )
  )
(defun +IRW/bibtex-completion-format-citation-org-cite (keys)
    "Format org-links using Org-ref citation"
  (s-join ", "
          (--map (format "cite:%s" it) keys)))

(use-package! ivy-bibtex
  :after org-ref
  :config
  (setq bibtex-completion-format-citation-functions '((org-mode . +IRW/bibtex-completion-format-citation-org-cite)
                                                       (latex-mode    . bibtex-completion-format-citation-cite)
                                                       (markdown-mode . bibtex-completion-format-citation-pandoc-citeproc)
                                                       (python-mode   . bibtex-completion-format-citation-sphinxcontrib-bibtex)
                                                       (rst-mode      . bibtex-completion-format-citation-sphinxcontrib-bibtex)
                                                       (default       . bibtex-completion-format-citation-default)))
  (setq ivy-bibtex-default-action 'ivy-bibtex-insert-citation
        ivy-bibtex-default-multi-action 'ivy-bibtex-insert-citation)
  )
(after! ivy-bibtex
  (defun ivy-bibtex (&optional arg local-bib)
  "Search BibTeX entries using ivy.

With a prefix ARG the cache is invalidated and the bibliography
reread.

If LOCAL-BIB is non-nil, display that the BibTeX entries are read
from the local bibliography.  This is set internally by
`ivy-bibtex-with-local-bibliography'."
  (interactive "P")
  (when arg
    (bibtex-completion-clear-cache))
  (bibtex-completion-init)
  (let* ((candidates (mapcar (lambda (entry)
			       (cons (bibtex-completion-format-entry entry (1- (frame-width)))
				     (cdr entry)))
			     (bibtex-completion-candidates)))
         (key (bibtex-completion-key-at-point))
         (preselect (and key
                         (cl-position-if (lambda (cand)
                                           (member (cons "=key=" key)
                                                   (cdr cand)))
                                         candidates))))
    (ivy-read (format "BibTeX entries%s: " (if local-bib " (local)" ""))
              candidates
              :preselect preselect
              :caller 'ivy-bibtex
              :history 'ivy-bibtex-history
              :action ivy-bibtex-default-action
              :multi-action ivy-bibtex-default-multi-action
              :keymap (when ivy-bibtex-use-extra-keymap ivy-bibtex-extra-keymap))))
)

(after! org-roam
  (org-roam-bibtex-mode))
(use-package! org-roam-bibtex
  :after org-roam
  :config
  (require 'org-ref)
  (setq!
   orb-insert-interface 'ivy-bibtex
   orb-note-actions-interface 'ivy
   orb-insert-link-description 'citation-org-ref-2
        )
  (setq orb-preformat-keywords '("citekey" "author" "title" "url" "year"))
  (setq org-roam-capture-templates
        '(("r" "bibliography reference" plain
           ""
           :if-new
           (file+head "~/org/literature/${citekey}.org" "#+TITLE: ${title}\n #+AUTHOR: ${author}\n #+URL: ${url}\n #+YEAR: ${year}\n")
           :unnarrowed t)))
  )
(map! :map org-mode-map
        :localleader "]" #'orb-insert-link)
(provide 'init-org)
