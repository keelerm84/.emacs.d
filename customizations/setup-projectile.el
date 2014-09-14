(setq projectile-enable-caching t)

(defadvice delete-file (before purge-from-projectile-cache (filename &optional trash))
  (let* ((true-filename (file-truename filename))
         (relative-filename (file-relative-name true-filename (projectile-project-root))))
    (if (projectile-project-p)
        (if (projectile-file-cached-p relative-filename (projectile-project-root))
            (projectile-purge-file-from-cache relative-filename)))))

(ad-activate 'delete-file)

(provide 'setup-projectile)
