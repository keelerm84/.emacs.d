(defun keelerm/org-should-include-current (level)
  (progn
    (if (and
         (outline-on-heading-p)
         (or
          (eq nil level) (eq level (org-outline-level))))
        t
      nil)))

(defun keelerm/org-get-current-header ()
  (progn
    (setq beg (point))
    (outline-end-of-heading)
    (buffer-substring-no-properties beg (point))))

(defun keelerm/org-outline-headings-to-list (level)
  (setq headings '())
  (show-all)
  (goto-char (point-min))

  (if (keelerm/org-should-include-current level)
      (add-to-list 'headings (keelerm/org-get-current-header) t))

  (while (outline-next-heading)
    (if (keelerm/org-should-include-current level)
        (add-to-list 'headings (keelerm/org-get-current-header) t)))
  headings)

(defun keelerm/org-find-previous-workday (initial)
  (let* ((time (time-subtract initial (seconds-to-time 86400)))
         (workdays '("Monday" "Tuesday" "Wednesday" "Thursday" "Friday")))
    (while (not (member (format-time-string "%A" time) workdays))
      (setq time (time-subtract time (seconds-to-time 86400))))
    time))

(defun keelerm/org-format-journal-file-name (time)
  (concat org-journal-dir (format-time-string "%Y%m%d" time)))

(defun keelerm/org-find-previous-journal-file ()
  (let* ((previous-day (keelerm/org-find-previous-workday (current-time))))
    (while (not (file-exists-p (keelerm/org-format-journal-file-name previous-day)))
      (setq previous-day (keelerm/org-find-previous-workday previous-day)))
    (keelerm/org-format-journal-file-name previous-day)))

(defun keelerm/org-outline-create-scrum-message ()
  (interactive)
  (setq journal-file (keelerm/org-find-previous-journal-file))
  (switch-to-buffer (find-file-noselect journal-file))
  (setq headings (keelerm/org-outline-headings-to-list 2))
  (switch-to-buffer "*daily scrum*")
  (erase-buffer)
  (insert "* Previously\n")
  (mapcar (lambda(element)
            (insert (replace-regexp-in-string "^** ..... " "  - " element) "\n")) headings)
  (org-mode)
  (show-all))
