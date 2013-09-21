(add-hook 'twittering-edit-mode-hook 'flyspell-mode)
(add-hook 'twittering-mode 
          (lambda()
            (flyspell-mode t)
            (setq truncate-lines t)
            (setq word-wrap t)))
                             

(provide 'setup-twitter)

