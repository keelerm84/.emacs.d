(use-package multiple-cursors
  :ensure t
  :bind (("C-c m p" . mc/mark-previous-like-this)
         ("C-c m P" . mc/skip-to-previous-like-this)
         ("C-c m n" . mc/mark-next-like-this)
         ("C-c m N" . mc/skip-to-next-like-this)
         ("C-c m a" . mc/mark-all-like-this)
         ("C-c m e" . mc/mark-more-like-this-extended)
         ("C-c m d" . mc/mark-all-symbols-like-this-defun)
         ("C-c m l" . mc/edit-lines)))

(provide 'mc)
