;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Isaac Wang"
      user-mail-address "hepisaacf@gmail.com"
      company-idle-delay 0.01
      flycheck-checker-error-threshold 50000
      org-directory "~/org/"
      display-line-numbers-type t
      confirm-kill-emacs nil
      treemacs-width 28)

(setq-default cursor-type 'bar)
;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
(defun +my/better-font()
  (interactive)
  ;; english font
  (if (display-graphic-p)
      (progn
        (set-face-attribute 'default nil :font (format "%s:pixelsize=%d" "Fira Code" 13)) ;; 11 13 17 19 23
        ;; chinese font 中文字体
        (dolist (charset '(kana han symbol cjk-misc bopomofo))
          (set-fontset-font (frame-parameter nil 'font)
                            charset
                            (font-spec :family "STKaiti" :size 14)))) ;; 14 16 20 22 28
    ))

(defun +my|init-font(frame)
  (with-selected-frame frame
    (if (display-graphic-p)
        (+my/better-font))))

(if (and (fboundp 'daemonp) (daemonp))
    (add-hook 'after-make-frame-functions #'+my|init-font)
  (+my/better-font))

;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(use-package! doom-themes
  :config
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t)
  (load-theme 'doom-one t)
  (doom-themes-visual-bell-config)
  (doom-themes-org-config)
  )
(use-package! kaolin-themes
  :config
  (kaolin-treemacs-theme))


(global-set-key (kbd "M-0") 'treemacs-select-window)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)
;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.

;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; ========================================
;; org mode
;; ========================================
(after! org
  (map! "C-c a" #'org-agenda)
  (setq org-agenda-files '("~/agenda/"))
  (setq org-agenda-custom-commands
        '(
          ("w" . "任务安排")
          ("wa" "重要且紧急的任务" tags-todo "+PRIORITY=\"A\"")
          ("wb" "重要且不紧急的任务" tags-todo "-weekly-monthly-daily+PRIORITY=\"B\"")
          ("wc" "不重要且紧急的任务" tags-todo "+PRIORITY=\"C\"")
          ("W" "Weekly Review"
           ((stuck "") ;; review stuck projects as designated by org-stuck-projects
            (tags-todo "project")
            (tags-todo "daily")
            (tags-todo "weekly")
            (tags-todo "reading")
            ))
          ))
  (setq org-todo-keywords
        '((sequence "TODO(t)" "DOING(s!)" "Waiting(w!)" "|" "DONE(d!)" "CANCELED(c @/!)")))
  (setq org-todo-keyword-faces
        '(
          ("TODO"  .   (:foreground "red" :weight bold))
          ("DOING" .   (:foreground "orange" :weight bold))
          ("Waiting" . (:foreground "SkyBlue" :weight bold))
          ("DONE" .    (:foreground "green" :weight bold))
          ("CANCELED" .     (:foreground "green" :weight bold))
          ))
  ;; 优先级范围和默认任务的优先级
  (setq org-highest-priority ?A)
  (setq org-lowest-priority  ?E)
  ;; 优先级醒目外观
  (setq org-priority-faces
        '((?A . (:background "red" :foreground "white" :weight bold))
          (?B . (:background "DarkOrange" :foreground "white" :weight bold))
          (?C . (:background "yellow" :foreground "DarkGreen" :weight bold))
          (?D . (:background "DodgerBlue" :foreground "black" :weight bold))
          (?E . (:background "SkyBlue" :foreground "black" :weight bold))
          ))
  (setq org-enforce-todo-dependencies t)
  ;; 绑定键位
  (defvar org-agenda-dir "" "gtd org files location")
  (setq-default org-agenda-dir "~/agenda")
  (setq org-agenda-file-log (expand-file-name "2021.org" org-agenda-dir))
  (setq org-agenda-file-gtd (expand-file-name "gtd.org" org-agenda-dir))

  (setq org-capture-templates
        '(("m" "MuonE" entry (file+headline org-agenda-file-gtd "MuonE")
           "* TODO [#B] %?\n %i\n"
           :empty-lines 1)
          ("a" "Axiogenesis" entry (file+headline org-agenda-file-gtd "Axiogenesis")
           "* %?\n %i\n %U"
           :empty-lines 1)
          ))
  (setq org-clock-clocktable-default-properties
        '(:link t :maxlevel 6 :fileskip0 t :compact nil :narrow 60 :score 0 :scope agenda-with-archives))
  (setq org-refile-targets (quote ((nil :maxlevel . 9)
                                   (org-agenda-file-log :maxlevel . 9))))
  (setq org-refile-use-outline-path t)
  (setq org-outline-path-complete-in-steps nil)
  (setq org-refile-allow-creating-parent-nodes (quote confirm))
  (setq org-format-latex-options '(:foreground default :background default :scale 1.5 :html-foreground "Black" :html-background "Transparent" :html-scale 1.5 :matchers ("begin" "$1" "$" "$$" "\\(" "\\[")))
  (setq org-startup-with-latex-preview t))

;; ========================================
;; lsp
;; ========================================
(defun icons-displayable-p ()
  "Return non-nil if `all-the-icons' is displayable."
  (and (display-graphic-p)
       (require 'all-the-icons nil t)))
(after! lsp
  (setq lsp-file-watch-threshold 50000)
  (use-package! company-lsp)
  (use-package! lsp-ui
    :hook (lsp-mode . lsp-ui-mode)
    :config
    (setq
     lsp-ui-sideline-enable nil
     lsp-completion-enable t
     lsp-ui-doc-position 'at-point
     lsp-ui-doc-header nil
     lsp-ui-doc-include-signature t))
)

;; ========================================
;; ivy
;; ========================================
;; Better experience with icons
;; Enable it before`ivy-rich-mode' for better performance
(use-package all-the-icons-ivy-rich
  :if (icons-displayable-p)
  :hook (ivy-mode . all-the-icons-ivy-rich-mode))

;; More friendly display transformer for Ivy
(use-package ivy-rich
  :hook ((counsel-projectile-mode . ivy-rich-mode) ; MUST after `counsel-projectile'
         (ivy-rich-mode . (lambda ()
                            "Use abbreviate in `ivy-rich-mode'."
                            (setq ivy-virtual-abbreviate
                                  (or (and ivy-rich-mode 'abbreviate) 'name)))))
  :init
  ;; For better performance
  (setq ivy-rich-parse-remote-buffer nil))

;; ========================================
;; company
;; ========================================
(defun icons-displayable-p ()
  "Return non-nil if `all-the-icons' is displayable."
  (and (display-graphic-p)
       (require 'all-the-icons nil t)))
(use-package! company-box
  :diminish
  :defines company-box-icons-all-the-icons
  :hook (company-mode . company-box-mode)
  :init (setq company-box-enable-icon (display-graphic-p)
              company-box-backends-colors nil
              company-box-doc-delay 0.1)
  :config
  (with-no-warnings
    ;; Prettify icons
    (defun my-company-box-icons--elisp (candidate)
      (when (or (derived-mode-p 'emacs-lisp-mode) (derived-mode-p 'lisp-mode))
        (let ((sym (intern candidate)))
          (cond ((fboundp sym) 'Function)
                ((featurep! sym) 'Module)
                ((facep sym) 'Color)
                ((boundp sym) 'Variable)
                ((symbolp sym) 'Text)
                (t . nil)))))
    (advice-add #'company-box-icons--elisp :override #'my-company-box-icons--elisp))
  (when (icons-displayable-p)
    (declare-function all-the-icons-faicon 'all-the-icons)
    (declare-function all-the-icons-material 'all-the-icons)
    (declare-function all-the-icons-octicon 'all-the-icons)
    (setq company-box-icons-all-the-icons
          `((Unknown . ,(all-the-icons-material "find_in_page" :height 0.8 :v-adjust -0.15))
            (Text . ,(all-the-icons-faicon "text-width" :height 0.8 :v-adjust -0.02))
            (Method . ,(all-the-icons-faicon "cube" :height 0.8 :v-adjust -0.02 :face 'all-the-icons-purple))
            (Function . ,(all-the-icons-faicon "cube" :height 0.8 :v-adjust -0.02 :face 'all-the-icons-purple))
            (Constructor . ,(all-the-icons-faicon "cube" :height 0.8 :v-adjust -0.02 :face 'all-the-icons-purple))
            (Field . ,(all-the-icons-octicon "tag" :height 0.85 :v-adjust 0 :face 'all-the-icons-lblue))
            (Variable . ,(all-the-icons-octicon "tag" :height 0.85 :v-adjust 0 :face 'all-the-icons-lblue))
            (Class . ,(all-the-icons-material "settings_input_component" :height 0.8 :v-adjust -0.15 :face 'all-the-icons-orange))
            (Interface . ,(all-the-icons-material "share" :height 0.8 :v-adjust -0.15 :face 'all-the-icons-lblue))
            (Module . ,(all-the-icons-material "view_module" :height 0.8 :v-adjust -0.15 :face 'all-the-icons-lblue))
            (Property . ,(all-the-icons-faicon "wrench" :height 0.8 :v-adjust -0.02))
            (Unit . ,(all-the-icons-material "settings_system_daydream" :height 0.8 :v-adjust -0.15))
            (Value . ,(all-the-icons-material "format_align_right" :height 0.8 :v-adjust -0.15 :face 'all-the-icons-lblue))
            (Enum . ,(all-the-icons-material "storage" :height 0.8 :v-adjust -0.15 :face 'all-the-icons-orange))
            (Keyword . ,(all-the-icons-material "filter_center_focus" :height 0.8 :v-adjust -0.15))
            (Snippet . ,(all-the-icons-material "format_align_center" :height 0.8 :v-adjust -0.15))
            (Color . ,(all-the-icons-material "palette" :height 0.8 :v-adjust -0.15))
            (File . ,(all-the-icons-faicon "file-o" :height 0.8 :v-adjust -0.02))
            (Reference . ,(all-the-icons-material "collections_bookmark" :height 0.8 :v-adjust -0.15))
            (Folder . ,(all-the-icons-faicon "folder-open" :height 0.8 :v-adjust -0.02))
            (EnumMember . ,(all-the-icons-material "format_align_right" :height 0.8 :v-adjust -0.15))
            (Constant . ,(all-the-icons-faicon "square-o" :height 0.8 :v-adjust -0.1))
            (Struct . ,(all-the-icons-material "settings_input_component" :height 0.8 :v-adjust -0.15 :face 'all-the-icons-orange))
            (Event . ,(all-the-icons-octicon "zap" :height 0.8 :v-adjust 0 :face 'all-the-icons-orange))
            (Operator . ,(all-the-icons-material "control_point" :height 0.8 :v-adjust -0.15))
            (TypeParameter . ,(all-the-icons-faicon "arrows" :height 0.8 :v-adjust -0.02))
            (Template . ,(all-the-icons-material "format_align_left" :height 0.8 :v-adjust -0.15)))
          company-box-icons-alist 'company-box-icons-all-the-icons)))
