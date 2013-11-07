(setq org-journal-dir "~/Documents/Dropbox/OrgFiles/journal/")

(require 'org-journal)
(global-set-key (kbd "C-c C-j") 'org-journal-new-entry)

(provide 'setup-org-journal)
