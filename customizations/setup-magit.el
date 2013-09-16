;(set-face-foreground 'diff-context "#ffffff")
;(set-face-foreground 'diff-added "olive drab")
;(set-face-foreground 'diff-removed "tomato")
;(set-face-foreground 'highlight nil)
;(set-face-background 'highlight "#000000")
;(set-face-foreground 'magit-branch "LightGoldenrod1")
;(set-face-background 'magit-branch "#1B1D1E")
;(set-face-foreground 'magit-header "deep pink")
;(set-face-background 'magit-header "#1B1D1E")
;(set-face-foreground 'magit-log-sha1 "NavajoWhite1")
;(set-face-background 'magit-diff-none nil)
;(set-face-background 'magit-diff-del nil)
;(set-face-background 'magit-item-highlight "#111111")

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

(provide 'setup-magit)
