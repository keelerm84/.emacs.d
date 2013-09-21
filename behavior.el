;; Full power!
(put 'narrow-to-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)

(delete-selection-mode t)
(fset 'yes-or-no-p 'y-or-n-p)

(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)

(global-auto-revert-mode 1)
(setq global-auto-revert-non-file-buffers t)
(setq auto-revert-verbose nil)

(set-default 'truncate-lines t)
(add-hook 'text-mode-hook 'turn-on-auto-fill)

(setq twittering-use-master-password t)
(provide 'behavior)
