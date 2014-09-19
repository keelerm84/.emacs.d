(set-face-foreground 'diff-context nil)
(set-face-foreground 'diff-added "DarkOliveGreen4")
(set-face-background 'diff-added "inherit")
(set-face-foreground 'diff-removed "indian red")
(set-face-background 'diff-removed "inherit")
(set-face-background 'magit-item-highlight "#002730")

(defadvice magit-status (around magit-fullscreen activate)
  (window-configuration-to-register :magit-fullscreen)
  ad-do-it
  (delete-other-windows))

(defun magit-quit-session ()
  "Restores the previous window configuration and kills the magit buffer"
  (interactive)
  (kill-buffer)
  (jump-to-register :magit-fullscreen))

(define-key magit-status-mode-map (kbd "q") 'magit-quit-session)

(defun magit-toggle-whitespace ()
  (interactive)
  (if (member "-w" magit-diff-options)
      (magit-dont-ignore-whitespace)
    (magit-ignore-whitespace)))

(defun magit-ignore-whitespace ()
  (interactive)
  (add-to-list 'magit-diff-options "-w")
  (magit-refresh))

(defun magit-dont-ignore-whitespace ()
  (interactive)
  (setq magit-diff-options (remove "-w" magit-diff-options))
  (magit-refresh))

(define-key magit-status-mode-map (kbd "W") 'magit-toggle-whitespace)

(add-hook 'magit-log-edit-mode-hook (lambda() (flyspell-mode t)))

(add-hook 'magit-log-mode-hook
          (lambda ()
            (define-key magit-log-mode-map (kbd "w") 'magit-copy-item-as-kill)))

(provide 'setup-magit)
