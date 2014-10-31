(use-package windmove
  :bind (("C-c h" . windmove-left)
         ("C-c j" . windmove-down)
         ("C-c k" . windmove-up)
         ("C-c l" . windmove-right)))


(use-package windresize
  :ensure t
  :bind ("C-c w r" . windresize))

(provide 'window)
