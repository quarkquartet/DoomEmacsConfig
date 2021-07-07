;;; lisp/init-latex.el -*- lexical-binding: t; -*-
(map! :after cdlatex
      :map cdlatex-mode-map
      "TAB" 'cdlatex-tab)
(use-package! reftex
  :config
  (setq reftex-plug-into-AUCTeX '(nil nil t t t))
  )
(setq +latex-viewers '(pdf-tools))
;;(defun TeX-eaf-sync-view()
;;  (unless (fboundp 'eaf-open)
;;    (error "EAF is not available!"))
;;  (let* ((pdf (TeX-active-master (TeX-output-extension)))
;;         (url (expand-file-name pdf))
;;         (app-name "pdf-viewer")
;;         (exists-eaf-buffer)
;;         (eaf-buffer-window))
;;    (catch 'found-match-buffer
;;      (dolist (buffer (buffer-list))
;;        (set-buffer buffer)
;;        (when (equal major-mode 'eaf-mode)
;;          (when (and (string= buffer-url url)
;;                     (string= buffer-app-name app-name))
;;            (setq exists-eaf-buffer buffer)
;;            (setq eaf-buffer-window (get-buffer-window exists-eaf-buffer))
;;            (throw 'found-match-buffer t)))))
;;    (if (and exists-eaf-buffer eaf-buffer-window)
;;        (pop-to-buffer exists-eaf-buffer)
;;    (eaf-open url app-name "--synctex_on=True"))))
;;(after! latex
;;    (add-to-list 'TeX-view-program-list '("eaf" TeX-eaf-sync-view))
;;    (add-to-list 'TeX-view-program-selection '(output-pdf "eaf"))
;;    )
(provide 'init-latex)
