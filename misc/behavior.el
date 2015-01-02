;; Full power!
(put 'narrow-to-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)

(delete-selection-mode t)
(fset 'yes-or-no-p 'y-or-n-p)

(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)
(setq-default fill-column 79)

(global-auto-revert-mode 1)
(setq global-auto-revert-non-file-buffers t)
(setq auto-revert-verbose nil)

(set-default 'truncate-lines t)
(add-hook 'text-mode-hook 'turn-on-auto-fill)

(setq twittering-use-master-password t)

(add-to-list 'hippie-expand-try-functions-list 'try-expand-line-all-buffers)

;; Global Modes
(show-paren-mode 1)
(setq show-paren-delay 0)
(key-chord-mode 1)

(yas/global-mode)

(global-surround-mode 1)
(helm-mode 1)

(projectile-global-mode)
(global-smartscan-mode)

;; Global hooks
(add-hook 'after-init-hook #'global-flycheck-mode)
(setq flycheck-indication-mode 'right-fringe)
(setq flycheck-checker-error-threshold nil)

;; Text mode hooks
(add-hook 'text-mode-hook 'flyspell-mode)
(add-hook 'before-save-hook 'selectively-delete-trailing-whitespace)

;; All programming modes
(add-hook 'prog-mode-hook 'flyspell-prog-mode)
(add-hook 'prog-mode-hook 'ggtags-mode)

(add-hook 'prog-mode-hook 'auto-complete-mode)

;; Lisp programming modes
(add-hook 'lisp-mode-hook 'turn-on-eldoc-mode)
(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)

(autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)
(add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
(add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
(add-hook 'ielm-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
(add-hook 'scheme-mode-hook           #'enable-paredit-mode)
(add-hook 'clojure-mode-hook          #'enable-paredit-mode)

;; PHP specific hooks
(add-hook 'php-mode-hook 'ggtags-mode)
(add-hook 'php-mode-hook 'turn-on-eldoc-mode)

;; Python specific hooks
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)

(eval-after-load "python"
  '(define-key python-mode-map "\C-cx" 'jedi-direx:pop-to-buffer))
(add-hook 'jedi-mode-hook 'jedi-direx:setup)

;; Projectile hooks
(add-hook 'projectile-mode-hook 'projectile-rails-on)

;; Compilation
(add-hook 'compilation-filter-hook 'colorize-compilation-buffer)

(add-hook 'eshell-mode-hook '(lambda () (smartscan-mode 0)))

(provide 'behavior)
