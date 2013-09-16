(setq inhibit-startup-message t)

(add-to-list 'default-frame-alist
						 `(font . "Meslo LG S for Powerline-12"))
(load-theme 'solarized-dark)

(column-number-mode t)

(show-paren-mode 1)
(setq show-paren-delay 0)

(provide 'appearance)
