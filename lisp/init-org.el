(add-hook! 'org-mode-hook
  (setq-local line-spacing 0.45))
(after! org
  (setq org-enforce-todo-dependencies nil)
  (setq org-agenda-files '("~/org/main.org"))
  (setq org-image-actual-width '(500)
        org-startup-folded t)
  (setq org-agenda-todo-ignore-scheduled 'future)
  (setq org-preview-latex-default-process 'dvisvgm)
  (setq org-todo-keywords
        '((sequence
           "TODO(t)"  ; A task that needs doing & is ready to do
           "PROJ(p)"  ; A project, which usually contains other tasks
           "HABIT(r)"  ; A recurring task
           "DOING(s)"  ; A task that is in progress
           "WAIT(w)"  ; Something external is holding up this task
           "HOLD(h)"  ; This task is paused/on hold because of me
           "IDEA(i)"  ; An unconfirmed and unapproved task or notion
           "|"
           "DONE(d)"  ; Task successfully completed
           "CANCELED(k)") ; Task was cancelled, aborted or is no longer applicable
          (sequence
           "[ ](T)"   ; A task that needs doing
           "[-](S)"   ; Task is in progress
           "[?](W)"   ; Task is being held up or paused
           "|"
           "[X](D)")  ; Task was completed
          )
        org-todo-keyword-faces
        '(("[-]"  . +org-todo-active)
          ("DOING" . +org-todo-active)
          ("[?]"  . +org-todo-onhold)
          ("WAIT" . +org-todo-onhold)
          ("HOLD" . +org-todo-onhold)
          ("PROJ" . +org-todo-project)
          ("NO"   . +org-todo-cancel)
          ("CANCELED" . +org-todo-cancel)
          ("DONE" .    (:foreground "green" :weight bold))))
  ;; 优先级范围和默认任务的优先级
  (setq org-highest-priority ?A)
  (setq org-lowest-priority  ?C)
  ;; 优先级醒目外观
 ;; (setq org-priority-faces
 ;;       '((?A . (:background "red" :foreground "white" :weight bold))
 ;;         (?B . (:background "DarkOrange" :foreground "white" :weight bold))
 ;;         (?C . (:background "yellow" :foreground "DarkGreen" :weight bold))
 ;;         ))
  ;(setq org-enforce-todo-dependencies t)
  ;; 绑定键位
  (setq org-log-file-dir (expand-file-name "00-log" org-directory))
  (setq org-log-files (file-expand-wildcards (concat org-log-file-dir "/*.org")))
  (defun clock-range-files () org-agenda-files
         (append org-agenda-files org-log-files))
   (setq org-clock-clocktable-default-properties
        '(:link t :maxlevel 6 :fileskip0 t :compact nil :narrow 60 :score 0 :scope clock-range-files))
  (setq org-refile-targets '((nil :maxlevel . 9)
                             (org-log-files :maxlevel . 9))
        org-refile-use-outline-path t
        org-outline-path-complete-in-steps nil)
 ; (setq org-refile-targets (quote ((nil :maxlevel . 9)
  ;                                 (org-agenda-file-log :maxlevel . 9))))
  (setq org-refile-allow-creating-parent-nodes (quote confirm))
  (setq org-startup-with-latex-preview t)
  (setq warning-suppress-types '((org-element-cache)))
  (plist-put org-format-latex-options :scale 1.8)

;  (plist-put org-format-latex-options :background "Transparent")
  )
(setq org-agenda-custom-commands
      (quote (("i" "My agenda"
               ((agenda " " ((org-agenda-span 'day)
                             (org-agenda-start-day "0d")
                            (org-agenda-show-log 'clockcheck)
                            (org-agenda-start-with-log-mode nil)
                            (org-agenda-log-mode-items '(closed clock))
                            (org-agenda-clockreport-mode t)))
                (tags-todo "errands/-WAIT-HABIT-PROJ-IDEA"
                           ((org-agenda-overriding-header "Errands needs to run")
                            (org-agenda-sorting-strategy '(priority-down category-keep todo-state-up))))
                (tags-todo "research/-PROJ-WAIT"
                           ((org-agenda-overriding-header "Research Projects")
                            (org-agenda-sorting-strategy '(priority-down category-keep todo-state-up))))
                (tags-todo "teaching/-PROJ-WAIT"
                           ((org-agenda-overriding-header "Teaching")
                            (org-agenda-sorting-strategy '(priority-down category-keep todo-state-up))))
                (tags-todo "reading/-WAIT-HABIT"
                           ((org-agenda-overriding-header "Inbox Reading Options")
                            (org-agenda-sorting-strategy '(priority-down category-keep todo-state-up))))
                (tags-todo "learning/-WAIT-HABIT"
                           ((org-agenda-overriding-header "Learning Tasks")
                            (org-agenda-sorting-strategy '(priority-down category-keep todo-state-up))))
                (tags-todo "English/-WAIT-HABIT"
                           ((org-agenda-overriding-header "English Reading Options")
                            (org-agenda-sorting-strategy '(priority-down category-keep todo-state-up))))
                (tags-todo "idea/-WAIT-HABIT-PROJ-IDEA"
                           ((org-agenda-overriding-header "Idea Checking")
                            (org-agenda-sorting-strategy '(priority-down category-keep todo-state-up))))
                (tags-todo "-research-reading-learning-English-idea-errands-teaching/-WAIT-HABIT-PROJ-IDEA"
                           ((org-agenda-overriding-header "Other tasks")
                            (org-agenda-sorting-strategy '(priority-down category-keep todo-state-up))))
               )))))
;;---------------------------
;; Org-roam-bibtex
;;---------------------------
;;
(setq bibliography-path "~/org/10-Physics&Math/1001-Literature/library.bib")
(setq bibliography-notes "~/org/10-Physics&Math/1001-Literature")
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

(after! org-ref
  (org-roam-bibtex-mode))
(use-package! org-roam-bibtex
  :after org-ref
  :config
  (require 'org-ref)
  (require 'ivy-bibtex)
  (setq!
   orb-insert-interface 'ivy-bibtex
   orb-note-actions-interface 'ivy
   orb-insert-link-description "${title}-${author}"  )
  (setq! orb-preformat-keywords '("citekey" "author" "title" "url" "year"))
  (setq! org-roam-capture-templates
        '(("r" "Review Paper" plain
           ""
           :if-new
           (file+head "~/org/10-Physics&Math/1001-Literature/${citekey}.org" "-*- org -*-\n#+TITLE: ${title}\n #+AUTHOR: ${author}\n #+URL: ${url}\n #+YEAR: ${year}\n")
           :unnarrowed t)
          ("p" "Research Paper" plain
           ""
           :if-new
           (file+head "~/org/10-Physics&Math/1001-Literature/${citekey}.org"
"#+TITLE: ${title}\n
#+AUTHOR: ${author}\n
#+URL: ${url}\n
#+YEAR: ${year}\n
 \n
* Summary\n
** Motivation\n
** Solution\n
** Conclusion \n
* Judgement\n
* Technical Details\n")
           :unnarrowed t)))
  )
(map! :map org-mode-map
        :localleader "]" #'orb-insert-link)
(provide 'init-org)
