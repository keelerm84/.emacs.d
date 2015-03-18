(defvar diff-program "latexdiff")

(defun generate-latex-diff ()
  (interactive)
  (save-buffer)
  (let* ((unedited (prompt-for-latex-file "UNEDITED"))
        (edited (buffer-file-name))
        (diff (prompt-for-latex-file "DIFF")))
    (shell-command (generate-diff-shell-command unedited edited diff))
    (find-file-other-window diff)))

(defun prompt-for-latex-file (filetype)
  (read-file-name (format "Please select the %s version of the file: " filetype)))

(defun generate-diff-shell-command (unedited edited diff)
  (mapconcat 'identity (list diff-program unedited edited ">" diff) " "))

(provide 'latex-defuns)
