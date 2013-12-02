(defun my/org-should-include-current (level)
  (progn
    (if (and
         (outline-on-heading-p)
         (or
          (eq nil level) (eq level (org-outline-level))))
        t
      nil)))

(defun my/org-get-current-header ()
  (progn
    (setq beg (point))
    (outline-end-of-heading)
    (buffer-substring-no-properties beg (point))))

(defun my/org-outline-headings-to-list (level)
  (setq headings '())
  (show-all)
  (goto-char (point-min))

  (if (my/org-should-include-current level)
      (add-to-list 'headings (my/org-get-current-header) t))

  (while (outline-next-heading)
    (if (my/org-should-include-current level)
        (add-to-list 'headings (my/org-get-current-header) t)))
  headings)

(defun my/org-find-previous-workday (initial)
  (let* ((time (time-subtract initial (seconds-to-time 86400)))
         (workdays '("Monday" "Tuesday" "Wednesday" "Thursday" "Friday")))
    (while (not (member (format-time-string "%A" time) workdays))
      (setq time (time-subtract time (seconds-to-time 86400))))
    time))

(defun my/org-format-journal-file-name (time)
  (concat org-journal-dir (format-time-string "%Y%m%d" time)))

(defun my/org-find-previous-journal-file ()
  (let* ((previous-day (my/org-find-previous-workday (current-time))))
    (while (not (file-exists-p (my/org-format-journal-file-name previous-day)))
      (setq previous-day (my/org-find-previous-workday previous-day)))
    (my/org-format-journal-file-name previous-day)))

(defun my/org-outline-create-scrum-message ()
  (interactive)
  (setq journal-file (my/org-find-previous-journal-file))
  (switch-to-buffer (find-file-noselect journal-file))
  (setq headings (my/org-outline-headings-to-list 2))
  (switch-to-buffer "*daily scrum*")
  (erase-buffer)
  (insert "* Previously\n")
  (mapcar (lambda(element)
            (insert (replace-regexp-in-string "^** ..... " "  - " element) "\n")) headings)
  (insert "\n* Today\n  - ")
  (org-mode)
  (show-all))
