(set-face-font 'org-level-1 (face-font 'default))
(set-face-font 'org-level-2 (face-font 'default))
(set-face-font 'org-level-3 (face-font 'default))
(set-face-font 'org-level-4 (face-font 'default))
(set-face-font 'org-level-5 (face-font 'default))
(set-face-font 'org-level-6 (face-font 'default))
(set-face-font 'org-level-7 (face-font 'default))
(set-face-font 'org-level-8 (face-font 'default))
(set-face-attribute 'org-checkbox nil :box nil)

; Make sure the code in begin_src blocks is colorized both when
; editing and when exporting.
(require 'org-latex)
(setq org-latex-pdf-process '("pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"))
(setq org-latex-listings 'minted)
(add-to-list 'org-latex-packages-alist '("" "minted"))
(setq org-src-fontify-natively t)

(setq org-todo-keywords
      '(
        (sequence "TODO(t)" "WAITING(w)" "STARTED(s)" "|" "DONE(d)" "DELEGATED(g)")
        (sequence "TODO(t)" "PLANNING(p)" "STARTED(s)" "CLIENT TESTING(c)" "CODE REVIEW(r)" "|" "MERGED(m)" "ON HOLD(h)")
        ))

(setq org-todo-keyword-faces
      (quote (
              ("TODO" :foreground "DarkGoldenRod3" :weight bold)
              ("WAITING" :foreground "chocolate" :weight bold)
              ("STARTED" :foreground "olive drab" :weight bold)
              ("DELEGATED" :foreground "PaleVioletRed3" :weight bold)
              ("DONE" :foreground "gray" :weight bold)

              ("PLANNING" :foreground "DarkGoldenRod3" :weight bold)
              ("STARTED" :foreground "chocolate" :weight bold)
              ("CLIENT TESTING" :foreground "light coral" :weight bold)
              ("CODE REVIEW" :foreground "sandy brown" :weight bold)
              ("MERGED" :foreground "dark cyan" :weight bold)
              ("ON HOLD" :foreground "gray" :weight bold)
              )))

(setq org-log-done 'time)

(setq org-directory "~/Documents/Dropbox/OrgFiles/")
(setq org-agenda-files `(,org-directory "~/Documents/Dropbox/OrgFiles/Tortugas"))
(setq org-default-notes-file (concat org-directory "refile.org"))

; Targets include this file and any file contributing to the agenda - up to 9 levels deep
(setq org-refile-targets (quote ((nil :maxlevel . 9)
                                 (org-agenda-files :maxlevel . 9))))

; Use full outline paths for refile targets - we file directly with IDO
(setq org-refile-use-outline-path t)

; Targets complete directly with IDO
(setq org-outline-path-complete-in-steps nil)

; Allow refile to create parent tasks with confirmation
(setq org-refile-allow-creating-parent-nodes (quote confirm))

(setq org-agenda-custom-commands
      '(("r" "Research Square TODOs" ((agenda "" nil) (alltodo "" nil))
         ((org-agenda-files '("~/Documents/Dropbox/OrgFiles/rs.org"))))))

; Use IDO for both buffer and file completion and ido-everywhere to t
(setq org-completion-use-ido t)
(setq ido-everywhere t)
(setq ido-max-directory-size 100000)
(ido-mode (quote both))

(set-face-foreground 'org-level-5 "aquamarine4")

;;;; Refile settings
; Exclude DONE state tasks from refile targets
(defun bh/verify-refile-target ()
  "Exclude todo keywords with a done state from refile targets"
  (not (member (nth 2 (org-heading-components)) org-done-keywords)))

(setq org-refile-target-verify-function 'bh/verify-refile-target)

(provide 'setup-org-mode)
