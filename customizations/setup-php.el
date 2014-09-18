(require 'php-auto-yasnippets)

(setq php-auto-yasnippet-php-program (car
                                      (file-expand-wildcards
                                       (concat dotfiles-dir "elpa/php-auto-yasnippets-*/Create-PHP-YASnippet.php"))))

(define-key php-mode-map (kbd "C-c C-y") 'yas/create-php-snippet)

(add-hook 'php-mode-hook (lambda ()
                           (c-set-style "psr2")))

(provide 'setup-php)
