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

(defun my/org-find-previous-workday ()
  (let* ((time (time-subtract (current-time) (seconds-to-time 86400)))
         (workdays '("Monday" "Tuesday" "Wednesday" "Thursday" "Friday")))
    (while (not (member (format-time-string "%A" time) workdays))
      (setq time (time-subtract time (seconds-to-time 86400))))
    time))

(defun my/org-outline-create-scrum-message ()
  (interactive)
  (let* ((previous (my/org-find-previous-workday)))
    (setq journal-file (concat org-journal-dir (format-time-string "%Y%m%d" previous)))
    (if (file-exists-p journal-file)
        (progn
          (switch-to-buffer (find-file-noselect journal-file))
          (setq headings (my/org-outline-headings-to-list 2))
          (switch-to-buffer "*daily scrum*")
          (erase-buffer)
          (insert "* Yesterday\n")
          (mapcar (lambda(element)
                    (insert (replace-regexp-in-string "^** ..... " "  - " element) "\n")) headings)
          (insert "\n* Today\n  - ")
          (org-mode)
          (show-all)))))
