;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Isaac Wang"
      user-mail-address "hepisaacf@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
(defun +my/better-font()
  (interactive)
  ;; english font
  (if (display-graphic-p)
      (progn
        (set-face-attribute 'default nil :font (format "%s:pixelsize=%d" "Fira Code" 15)) ;; 11 13 17 19 23
        ;; chinese font 中文字体
        (dolist (charset '(kana han symbol cjk-misc bopomofo))
          (set-fontset-font (frame-parameter nil 'font)
                            charset
                            (font-spec :family "STKaiti" :size 17)))) ;; 14 16 20 22 28
    ))

(defun +my|init-font(frame)
  (with-selected-frame frame
    (if (display-graphic-p)
        (+my/better-font))))

(if (and (fboundp 'daemonp) (daemonp))
    (add-hook 'after-make-frame-functions #'+my|init-font)
  (+my/better-font))
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(add-to-list 'custom-theme-load-path
	     "~/.emacs.d/themes/")
(if (display-graphic-p)
   ; (progn
    ;  (require 'doom-themes)
    (setq doom-theme 'doom-one)
  (load-theme 'homebrew t))
;(setq doom-theme 'doom-one)

;; set the type of cursor
(setq-default cursor-type 'bar)
(setq global-linum-mode t)
(setq confirm-kill-emacs nil)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!


;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)
(setq company-idle-delay 0.1)
(setq flycheck-checker-error-threshold 50000)

;;----------------------
;; python
;;----------------------
(setq conda-anaconda-home "/Users/isaac/opt/anaconda3")
(setq conda-env-home-directory (expand-file-name "~/opt/anaconda3"))
;;(conda-env-activate "py37")
(add-hook! python-mode-hook
  (lambda()
    (flycheck-select-checker 'python-flake8)))
(setq-default flycheck-disabled-checkers '(python-pylint))
(set-formatter!'autopep8 "autopep8 -" :modes '(python-mode))


;; Open recent file
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)
(map! :map cdlatex-mode-map
    :i "TAB" #'cdlatex-tab)

;; Stop showing the first column
(when (display-graphic-p)
  (use-package highlight-indent-guides
    :diminish
    :hook (prog-mode . highlight-indent-guides-mode)
    :init (setq highlight-indent-guides-method 'character
                highlight-indent-guides-responsive 'top)
    :config
    ;; Don't display first level of indentation
    (with-no-warnings
      (defun my-indent-guides-for-all-but-first-column (level responsive display)
        (unless (< level 1)
          (highlight-indent-guides--highlighter-default level responsive display)))
      (setq highlight-indent-guides-highlighter-function
            #'my-indent-guides-for-all-but-first-column)

      ;; Don't display indentations in `swiper'
      ;; https://github.com/DarthFennec/highlight-indent-guides/issues/40
      (with-eval-after-load 'ivy
        (defun my-ivy-cleanup-indentation (str)
          "Clean up indentation highlighting in ivy minibuffer."
          (let ((pos 0)
                (next 0)
                (limit (length str))
                (prop 'highlight-indent-guides-prop))
            (while (and pos next)
              (setq next (text-property-not-all pos limit prop nil str))
              (when next
                (setq pos (text-property-any next limit prop nil str))
                (ignore-errors
                  (remove-text-properties next pos '(display nil face nil) str))))))
        (advice-add #'ivy-cleanup-string :after #'my-ivy-cleanup-indentation)))))

;; Here are some additional functions/macros that could help you configure Doom:;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
(use-package! all-the-icons-ivy-rich
  :ensure t
  :init (all-the-icons-ivy-rich-mode 1))
(global-set-key (kbd "M-0") 'treemacs-select-window)
(use-package! ivy-rich
  :ensure t
  :init (ivy-rich-mode 1))
(use-package! doom-themes
  :config
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t)
  (load-theme 'doom-one t)

  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)
  (if (display-graphic-p)
      (progn
       ;; Enable custom neotree theme (all-the-icons must be installed!)
  ;; or for treemacs users
        (setq doom-themes-treemacs-theme "doom-colors")
        (doom-themes-treemacs-config)
        ))

        ;; Corrects (and improves) org-mode's native fontification.
        (doom-themes-org-config))
(after! python
  (set-popup-rules!
    '(("^\\*Flycheck errors\\*$" :size 0.22)
      ("^\\*ein: .+?\\.ipynb\\*" :side 'right :size 0.5)
      ))
  (setq! eldoc-mode nil))
;(use-package! shackle
;  :hook (python-mode . shackle-mode)
;  :demand t
;  :config
;  (setq shackle-default-rule nil
;        shackle-rules '(("\\`\\*ein: .+?\\.ipynb\\*\\'" :regexp t :same t)
;                        (flycheck-error-list-mode :align 'below :size 0.22)
;                                        ;	(ein:run :align 'right :size 0.5)
;                        (ein:run :popup)
;                        (ein:notebooklist-open :popup)))
;  (shackle-mode 1))
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys

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
(after! tex
  (setq reftex-insert-label-flags '(nil t)))
(map! :map cdlatex-mode-map
      :i "TAB" #'cdlatex-tab)

;; ========================================
;; lsp
;; ========================================
(use-package! lsp
  :config
  (setq lsp-file-watch-threshold 50000
        ))
(use-package! lsp-ui
  :hook (lsp-mode . lsp-ui-mode)
  :config
  (setq
   lsp-ui-doc-enable t
   lsp-ui-sideline-enable nil
   lsp-completion-enable t
   lsp-ui-doc-position 'at-point
   lsp-ui-doc-header nil
   lsp-ui-doc-include-signature t
   lsp-ui-doc-background (doom-color 'base4)
   lsp-ui-doc-border (doom-color 'fg))
  (setq-default lsp-ui-doc-frame-parameters '((left . -1)
                                              (top . -1)
                                              (no-accept-focus . t)
                                              (min-width . 0)
                                              (width . 0)
                                              (min-height . 0)
                                              (height . 0)
                                              (internal-border-width . 5)
                                              (vertical-scroll-bars)
                                              (horizontal-scroll-bars)
                                              (left-fringe . 0)
                                              (right-fringe . 0)
                                              (menu-bar-lines . 0)
                                              (tool-bar-lines . 0)
                                              (line-spacing . 0.1)
                                              (unsplittable . t)
                                              (undecorated . t)
                                              (visibility . nil)
                                              (mouse-wheel-frame . nil)
                                              (no-other-frame . t)
                                              (cursor-type)
                                              (no-special-glyphs . t)))
  )

(use-package! company-lsp
  :after lsp-mode)

;; ========================================
;; LaTeX
;; ========================================


;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
