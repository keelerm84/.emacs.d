(require 'php-auto-yasnippets)

(setq php-auto-yasnippet-php-program (car
                                      (file-expand-wildcards
                                       (concat dotfiles-dir ".cask/*/elpa/php-auto-yasnippets-*/Create-PHP-YASnippet.php"))))

(define-key php-mode-map (kbd "C-c C-y") 'yas/create-php-snippet)
(define-key php-mode-map (kbd "C-c s n") 'sort-php-namespaces)

(add-hook 'php-mode-hook (lambda ()
                           (c-set-style "psr2")
                           (php-refactor-mode t)
                           (set (make-local-variable 'compile-command) "phpunit")))

(provide 'setup-php)
