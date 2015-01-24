(use-package ibuffer
  :ensure t
  :config
  (progn
    (require 'ibuffer-vc)

    (fullframe ibuffer ibuffer-quit)

    (defun ibuffer-set-up-preferred-filters ()
      (ibuffer-vc-set-filter-groups-by-vc-root)
      (unless (eq ibuffer-sorting-mode 'filename/process)
        (ibuffer-do-sort-by-filename/process)))

    (add-hook 'ibuffer-hook 'ibuffer-set-up-preferred-filters)

    (define-ibuffer-column size-h
      (:name "Size" :inline t)
      (cond
       ((> (buffer-size) 1000000) (format "%7.1fM" (/ (buffer-size) 1000000.0)))
       ((> (buffer-size) 1000) (format "%7.1fk" (/ (buffer-size) 1000.0)))
       (t (format "%8d" (buffer-size)))))

    (setq ibuffer-formats
          '((mark modified read-only vc-status-mini " "
                  (name 18 18 :left :elide)
                  " "
                  (size-h 9 -1 :right)
                  " "
                  (mode 16 16 :left :elide)
                  " "
                  (vc-status 16 16 :left)
                  " "
                  filename-and-process))))
  :bind (("C-x C-b" . ibuffer)))

(provide 'buffers)
