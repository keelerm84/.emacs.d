;;; Customize ledger appearance
(set-face-foreground 'ledger-font-periodic-xact-face "aquamarine4")
(set-face-foreground 'ledger-font-posting-account-face "gray65")
(set-face-foreground 'ledger-font-payee-uncleared-face "#859900")
(set-face-bold-p 'ledger-font-payee-uncleared-face nil)
(set-face-foreground 'ledger-font-posting-date-face "#859900")

;;; A few helper functions for ledger's format specifiers
(defun ledger/start-of-month ()
  (format-time-string "%Y-%m-01"))

(defun ledger/end-of-month ()
  (let* ((month (+ 1 (string-to-int (format-time-string "%m"))))
        (month-overflow (/ month 12))
        (year-int (string-to-int (format-time-string "%Y")))
        (year (int-to-string (+ year-int month-overflow))))
    (if (> month 12)
        (c-concat-separated (list year "01" "01") "-")
      (c-concat-separated (list year (int-to-string month) "01") "-"))))

;;; Provide a couple of customized reports
(add-to-list 'ledger-report-format-specifiers '("start-of-month" . ledger/start-of-month))
(add-to-list 'ledger-report-format-specifiers '("end-of-month" . ledger/end-of-month))

(add-to-list 'ledger-reports '("budgeted" "ledger -f %(ledger-file) budget --begin %(start-of-month) --end %(end-of-month)"))
(add-to-list 'ledger-reports '("unbudgeted" "ledger -f %(ledger-file) budget --unbudgeted --begin %(start-of-month) --end %(end-of-month)"))

(provide 'setup-ledger)
