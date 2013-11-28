(require 'helm-css-scss)

(setq helm-css-scss-split-window-vertically t)

(dolist ($hook '(css-mode-hook sass-mode-hook))
  (add-hook
   $hook
   (lambda ()
     (local-set-key (kbd "M-i") ;; [command + i]
                    'helm-css-scss)
     )))

(provide 'setup-sass)
