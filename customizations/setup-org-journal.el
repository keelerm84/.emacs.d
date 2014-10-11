(setq org-journal-dir (keelerm/org-path "journal/"))

(require 'org-journal)
(global-set-key (kbd "C-x j") 'org-journal-new-entry)

(provide 'setup-org-journal)
