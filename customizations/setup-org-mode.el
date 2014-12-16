(set-face-attribute 'org-checkbox nil :box nil)

; Make sure the code in begin_src blocks is colorized both when
; editing and when exporting.
(setq org-latex-pdf-process '("pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"))
(setq org-latex-listings 'minted)
(add-to-list 'org-latex-packages-alist '("" "minted"))

(setq org-latex-create-formula-image-program 'imagemagick)

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

(setq org-agenda-files (list org-directory (keelerm/org-path "Tortugas")))
(setq org-default-notes-file (keelerm/org-path "refile.org"))
(setq org-agenda-skip-scheduled-if-deadline-is-shown t)
(setq org-deadline-warning-days 7)
(setq org-agenda-skip-deadline-if-done t)
(setq org-agenda-skip-scheduled-if-done t)

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
         ((org-agenda-files (list (keelerm/org-path "rs.org")))))
        ("p" . "Personal")
        ("pt" "TODOs" ((agenda "" nil) (alltodo "" nil))
         ((org-agenda-files (list (keelerm/org-path "personal.org")))))
        ("pi" "Project Ideas" ((search "*"))
         ((org-agenda-files (list (keelerm/org-path "projects.org")))))
        ("c" "Consulting TODOs" ((agenda "" nil) (alltodo "" nil))
         ((org-agenda-files (file-expand-wildcards (keelerm/org-path "Tortugas/*.org")))))
        ("b" "Blog Ideas" ((agenda "" nil) (search "*"))
         ((org-agenda-files (list (keelerm/org-path "blog.org")))))
        ("i" . "Improvements")
        ("il" "Learn" tags "CATEGORY=\"learn\""
         ((org-agenda-files (list (keelerm/org-path "improvements.org")))))
        ("ir" "Read" tags "CATEGORY=\"read\""
         ((org-agenda-files (list (keelerm/org-path "improvements.org")))))
        ("iw" "Watch" tags "CATEGORY=\"watch\""
         ((org-agenda-files (list (keelerm/org-path "improvements.org")))))
        ("ia" "All Agenda" ((agenda "" nil))
         ((org-agenda-files (list (keelerm/org-path "improvements.org")))))
        ("is" "Search specific tag" ((agenda "" nil) (tags))
         ((org-agenda-files (list (keelerm/org-path "improvements.org")))))))

(setq org-capture-templates
      '(("t" "Todo" entry (file+headline (keelerm/org-path "refile.org") "Tasks")
         "* TODO %?")
        ("b" "Blog Ideas" entry (file (keelerm/org-path "blog.org"))
         "* TODO %?")
        ("i" "Improvement" entry (file (keelerm/org-path "improvements.org"))
         "* TODO %?%^g%^{CATEGORY}p")))

(set-face-foreground 'org-level-5 "aquamarine4")

;;;; Refile settings
; Exclude DONE state tasks from refile targets
(defun bh/verify-refile-target ()
  "Exclude todo keywords with a done state from refile targets"
  (not (member (nth 2 (org-heading-components)) org-done-keywords)))

(setq org-refile-target-verify-function 'bh/verify-refile-target)

(add-to-list 'org-global-properties
      '("Effort_ALL". "0:05 0:15 0:30 1:00 2:00 3:00 4:00 8:00 16:00 24:00"))

(provide 'setup-org-mode)
