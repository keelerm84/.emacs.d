(use-package multiple-cursors
  :ensure t
  :bind (("C-c m p" . mc/mark-previous-like-this)
         ("C-c m n" . mc/mark-next-like-this)
         ("C-c m a" . mc/mark-all-like-this)
         ("C-c m l" . mc/edit-lines)))

(provide 'mc)
