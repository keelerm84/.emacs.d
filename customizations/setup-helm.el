(setq helm-exit-idle-delay 0)
(setq helm-buffer-max-length nil)

(global-set-key (kbd "C-x b") 'helm-buffers-list)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "C-c C-h l") 'helm-locate)
(global-set-key (kbd "C-c C-h o") 'helm-occur)
(global-set-key (kbd "C-c C-h m") 'helm-all-mark-rings)
(global-set-key (kbd "C-c C-h w") 'helm-man-woman)

(require 'helm-swoop)

(global-set-key (kbd "C-c C-h s") 'helm-swoop)
(set-face-foreground 'helm-swoop-target-line-face (face-foreground 'highlight))
(set-face-background 'helm-swoop-target-line-face (face-background 'highlight))
(set-face-foreground 'helm-swoop-target-line-block-face (face-foreground 'highlight))
(set-face-background 'helm-swoop-target-line-block-face (face-background 'highlight))

(provide 'setup-helm)
