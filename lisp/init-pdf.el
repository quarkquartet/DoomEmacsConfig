(when (display-graphic-p)
  (use-package! pdf-tools
    :mode ("\\.pdf\\'" . pdf-view-mode)
    :magic ("%PDF" . pdf-view-mode)
    :config
    (with-no-warnings
      ;; FIXME: Support retina display on MAC
      ;; @see https://emacs-china.org/t/pdf-tools-mac-retina-display/10243/
      ;; and https://github.com/politza/pdf-tools/pull/501/
      (setq pdf-view-use-scaling t
            pdf-view-use-imagemagick nil)

      (defun my-pdf-view-use-scaling-p ()
        "Return t if scaling should be used."
        (and (or (and (eq (framep-on-display) 'ns) (>= emacs-major-version 27))
                 (memq (pdf-view-image-type) '(imagemagick image-io)))
             pdf-view-use-scaling))
      (advice-add #'pdf-view-use-scaling-p :override #'my-pdf-view-use-scaling-p)

      (defun my-pdf-view-create-page (page &optional window)
        "Create an image of PAGE for display on WINDOW."
        (let* ((size (pdf-view-desired-image-size page window))
               (width (if (not (pdf-view-use-scaling-p))
                          (car size)
                        (* 2 (car size))))
               (data (pdf-cache-renderpage
                      page width width))
               (hotspots (pdf-view-apply-hotspot-functions
                          window page size)))
          (pdf-view-create-image data
            :width width
            :scale (if (pdf-view-use-scaling-p) 0.5 1)
            :map hotspots
            :pointer 'arrow)))
      (advice-add #'pdf-view-create-page :override #'my-pdf-view-create-page)

      (defun my-pdf-util-frame-scale-factor ()
        "Return the frame scale factor depending on the image type used for display."
        (if (and pdf-view-use-scaling
                 (memq (pdf-view-image-type) '(imagemagick image-io))
                 (fboundp 'frame-monitor-attributes))
            (or (cdr (assq 'backing-scale-factor (frame-monitor-attributes)))
                (if (>= (pdf-util-frame-ppi) 180)
                    2
                  1))
          (if (and pdf-view-use-scaling (eq (framep-on-display) 'ns))
              2
            1)))
      (advice-add #'pdf-util-frame-scale-factor :override #'my-pdf-util-frame-scale-factor)

      (defun my-pdf-isearch-hl-matches (current matches &optional occur-hack-p)
        "Highlighting edges CURRENT and MATCHES."
        (cl-destructuring-bind (fg1 bg1 fg2 bg2)
          (pdf-isearch-current-colors)
          (let* ((width (car (pdf-view-image-size)))
                 (page (pdf-view-current-page))
                 (window (selected-window))
                 (buffer (current-buffer))
                 (tick (cl-incf pdf-isearch--hl-matches-tick))
                 (pdf-info-asynchronous
                  (lambda (status data)
                    (when (and (null status)
                               (eq tick pdf-isearch--hl-matches-tick)
                               (buffer-live-p buffer)
                               (window-live-p window)
                               (eq (window-buffer window)
                                   buffer))
                      (with-selected-window window
                        (when (and (derived-mode-p 'pdf-view-mode)
                                   (or isearch-mode
                                       occur-hack-p)
                                   (eq page (pdf-view-current-page)))
                          (pdf-view-display-image
                           (pdf-view-create-image data :width width))))))))
            (pdf-info-renderpage-text-regions
             page width t nil
             `(,fg1 ,bg1 ,@(pdf-util-scale-pixel-to-relative
                            current))
             `(,fg2 ,bg2 ,@(pdf-util-scale-pixel-to-relative
                            (apply 'append
                                   (remove current matches))))))))
      (advice-add #'pdf-isearch-hl-matches :override #'my-pdf-isearch-hl-matches)

      (defun my-pdf-annot-show-annotation (a &optional highlight-p window)
        "Make annotation A visible."
        (save-selected-window
          (when window (select-window window))
          (pdf-util-assert-pdf-window)
          (let ((page (pdf-annot-get a 'page))
                (size (pdf-view-image-size)))
            (unless (= page (pdf-view-current-page))
              (pdf-view-goto-page page))
            (let ((edges (pdf-annot-get-display-edges a)))
              (when highlight-p
                (pdf-view-display-image
                 (pdf-view-create-image
                     (pdf-cache-renderpage-highlight
                      page (car size)
                      `("white" "steel blue" 0.35 ,@edges))
                   :map (pdf-view-apply-hotspot-functions
                         window page size)
                   :width (car size))))
              (pdf-util-scroll-to-edges
               (pdf-util-scale-relative-to-pixel (car edges)))))))
      (advice-add #'pdf-annot-show-annotation :override #'my-pdf-annot-show-annotation))))

(provide 'init-pdf)
