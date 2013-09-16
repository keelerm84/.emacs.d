(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

(add-to-list 'auto-mode-alist '("\\.cs$" . csharp-mode))

;; Text mode hooks
(add-hook 'text-mode-hook 'flyspell-mode)

;; All programming modes
(add-hook 'prog-mode-hook 'flyspell-prog-mode)
(add-hook 'prog-mode-hook 'font-lock-comment-annotations)

;; PHP specific hooks
(add-hook 'prog-mode-hook 'gtags-mode)
(add-hook 'php-mode-hook 'gtags-mode)

(provide 'mode-mappings)
