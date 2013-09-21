(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

(add-to-list 'auto-mode-alist '("\\.cs$" . csharp-mode))

(add-to-list 'auto-mode-alist '("\\.twig$" . web-mode))
(setq web-mode-engines-alist '(("django" . "\\.twig\\'")))

(provide 'mode-mappings)
