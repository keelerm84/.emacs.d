(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

(add-to-list 'auto-mode-alist '("\\.cs$" . csharp-mode))

(add-to-list 'auto-mode-alist '("\\.scss$" . sass-mode))

(add-to-list 'auto-mode-alist '("\\.erb$" . web-mode))

(add-to-list 'auto-mode-alist '("\\.twig$" . web-mode))
(setq web-mode-engines-alist '(("django" . "\\.twig\\'")))

(add-to-list 'auto-mode-alist '("\\.latex$" . LaTeX-mode))

(provide 'mode-mappings)
