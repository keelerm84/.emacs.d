(setq-default ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

(global-set-key
     "\M-x"
     (lambda ()
       (interactive)
       (call-interactively
        (intern
         (ido-completing-read
          "M-x "
          (all-completions "" obarray 'commandp))))))

(provide 'setup-ido)
