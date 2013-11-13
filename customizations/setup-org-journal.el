(setq org-journal-dir "~/Documents/Dropbox/OrgFiles/journal/")

(require 'org-journal)
(global-set-key (kbd "C-x j") 'org-journal-new-entry)

(provide 'setup-org-journal)
