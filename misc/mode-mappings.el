(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.h$" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.json$" . json-mode))

(add-to-list 'auto-mode-alist '("\\.cs$" . csharp-mode))

(add-to-list 'auto-mode-alist '("\\.scss$" . scss-mode))

(add-to-list 'auto-mode-alist '("\\.erb$" . web-mode))

(add-to-list 'auto-mode-alist '("\\.twig$" . web-mode))
(setq web-mode-engines-alist '(("django" . "\\.twig\\'")))

(add-to-list 'auto-mode-alist '("\\.tpl$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.phtml$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.hbs$" . web-mode))

(add-to-list 'auto-mode-alist '("\\.latex$" . LaTeX-mode))

(add-to-list 'auto-mode-alist '("\\.ledger$" . ledger-mode))

(add-to-list 'auto-mode-alist '("\\.zsh$" . shell-script-mode))
(add-to-list 'auto-mode-alist '("\\.gitconfig$" . gitconfig-mode))

(add-to-list 'auto-mode-alist '("\\.dist-production$" . php-mode))
(add-to-list 'auto-mode-alist '("\\.dist-development$" . php-mode))
(add-to-list 'auto-mode-alist '("\\.dist-staging$" . php-mode))

(add-to-list 'auto-mode-alist '("\\.restclient$" . restclient-mode))

(provide 'mode-mappings)
