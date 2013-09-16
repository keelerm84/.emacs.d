;; C Sharp goodness
(add-hook 'csharp-mode-hook 'flymake-mode)

(require 'flymake)
;;(autoload 'csharp-mode "csharp-mode" "Major mode for editing C# code." t)

;; Custom code to use a default compiler string for all C# files
(defvar my-csharp-default-compiler nil)
(setq my-csharp-default-compiler "mono @@FILE@@")

(defun my-c-mode-common-hook ()
  (setq c-basic-offset 2)
  (c-set-offset 'substatement-open 0))
(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)

(defun my-csharp-get-value-from-comments (marker-string line-limit)
  my-csharp-default-compiler)

(add-hook 'csharp-mode-hook (lambda ()
                              (if my-csharp-default-compiler
                                  (progn
                                    (fset 'orig-csharp-get-value-from-comments
                                          (symbol-function 'csharp-get-value-from-comments))
                                    (fset 'csharp-get-value-from-comments
                                          (symbol-function 'my-csharp-get-value-from-comments))))
                              (flymake-mode)))

(provide 'setup-csharp)
