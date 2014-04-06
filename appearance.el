(setq inhibit-startup-message t)

(add-to-list 'default-frame-alist
						 `(font . "Meslo LG S for Powerline-12"))
(load-theme 'solarized-dark)

(column-number-mode t)

(which-func-mode)
(setq-default header-line-format
              '((which-func-mode ("" which-func-format " "))))
(setq mode-line-misc-info
            ;; We remove Which Function Mode from the mode line, because it's mostly
            ;; invisible here anyway.
            (assq-delete-all 'which-func-mode mode-line-misc-info))

(provide 'appearance)
