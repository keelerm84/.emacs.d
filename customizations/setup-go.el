(add-hook 'before-save-hook 'gofmt-before-save)

(setq gofmt-command "goimports")

(add-hook 'go-mode-hook (lambda ()
                          (local-set-key (kbd "C-c C-r") 'go-remove-unused-imports)
                          (local-set-key (kbd "C-c i") 'go-goto-imports)
                          (local-set-key (kbd "M-.") 'godef-jump)
                          (go-eldoc-setup)
                          (ggtags-mode 0)
                          (if (not (string-match "go" compile-command))
                              (set (make-local-variable 'compile-command)
                                   "go build -v && go test -v && go vet"))))

(require 'go-autocomplete)
(require 'auto-complete-config)

(provide 'setup-go)
