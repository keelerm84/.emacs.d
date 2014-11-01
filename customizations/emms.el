(use-package emms
  :ensure t
  :config
  (progn
    (emms-standard)
    (emms-default-players))
  :bind (("<f5>" . emms-shuffle)
         ("<f6>" . emms-pause)
         ("<f7>" . emms-previous)
         ("<f8>" . emms-next)
         ("<f9>" . emms-volume-lower)
         ("<f10>" . emms-volume-raise)))

(provide 'emms)
