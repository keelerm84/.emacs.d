(defun gtags-create-or-update ()
  "create or update the gnu global tag file"
  (interactive)
  (if (not (= 0 (call-process "global" nil nil nil " -p"))) ; tagfile doesn't exist?
			(let ((olddir default-directory)
						(topdir (read-directory-name
										 "gtags: top of source tree:" default-directory)))
				(cd topdir)
				(shell-command "gtags && echo 'created tagfile'")
				(cd olddir)) ; restore
    ;;  tagfile already exists; update it
    (shell-command "global -u && echo 'updated tagfile'")))

(defun eval-and-replace ()
  "Replace the preceding sexp with its value."
  (interactive)
  (backward-kill-sexp)
  (condition-case nil
      (prin1 (eval (read (current-kill 0)))
             (current-buffer))
    (error (message "Invalid expression")
           (insert (current-kill 0)))))

(defun format-json ()
  (interactive)
  (save-excursion
    (shell-command-on-region (mark) (point) "python -m json.tool" (buffer-name) t)))

(require 'ansi-color)
(defun colorize-compilation-buffer ()
  (toggle-read-only)
  (ansi-color-apply-on-region (point-min) (point-max))
  (toggle-read-only))

(defun sort-php-namespaces ()
  (interactive)
  (save-excursion
    (backward-paragraph)
    (next-line)
    (let ((start (point)))
      (forward-paragraph)
      (shell-command-on-region start (point) "sort -u" nil t))))
