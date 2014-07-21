(require 'helm-css-scss)

(setq helm-css-scss-split-window-vertically t)
(setq scss-compile-at-save nil)

(dolist ($hook '(css-mode-hook less-css-mode-hook scss-mode-hook))
  (add-hook
   $hook
   (lambda ()
     (local-set-key (kbd "M-i") ;; [command + i]
                    'helm-css-scss)
     )))

(provide 'setup-css)
