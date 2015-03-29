(local-set-key (kbd "C-c M-j") 'cider-jack-in)

(add-hook 'cider-repl-mode-hook '(lambda () (smartscan-mode 0)))

(provide 'setup-cider)
