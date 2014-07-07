(defadvice delete-file (after purge-from-projectile-cache (file) activate)
  (if (projectile-project-p)
      (if (projectile-file-cached-p (file (projectile-project-root)))
          (projectile-purge-file-from-cache file))))

(provide 'setup-projectile)
