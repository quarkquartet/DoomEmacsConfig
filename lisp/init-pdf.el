(use-package! pdf-view
  :config
  (setq pdf-view-use-scaling t
        pdf-view-use-imagemagick nil)
  (defadvice! my-pdf-view-use-scaling-p ()
    :override #'pdf-view-use-scaling-p
    (and (or (and (eq (framep-on-display) 'ns) (>= emacs-major-version 27))
             (memq (pdf-view-image-type) '(imagemagick image-io)))
         pdf-view-use-scaling)
    )
  (defadvice! my-pdf-view-create-page (page &optional window)
    :override #'pdf-view-create-page
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
        :pointer 'arrow))
    )
  )
(provide 'init-pdf)
