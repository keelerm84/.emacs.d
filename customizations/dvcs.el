(use-package magit
  :ensure t
  :init
  (setq magit-last-seen-setup-instructions "1.4.0")
  :config
  (progn
    (fullframe magit-status magit-mode-quit-window)

    (defun magit-toggle-whitespace ()
      (interactive)
      (if (member "-w" magit-diff-options)
          (magit-dont-ignore-whitespace)
        (magit-ignore-whitespace)))

    (defun magit-ignore-whitespace ()
      (interactive)
      (add-to-list 'magit-diff-options "-w")
      (magit-refresh))

    (defun magit-dont-ignore-whitespace ()
      (interactive)
      (setq magit-diff-options (remove "-w" magit-diff-options))
      (magit-refresh))

    (define-key magit-status-mode-map (kbd "W") 'magit-toggle-whitespace)

    (defun endless/visit-pull-request-url ()
      "Visit the current branch's PR on Github."
      (interactive)
      (browse-url
       (format "https://github.com/%s/compare/%s"
               (replace-regexp-in-string
                "\\`.+github\\.com:\\(.+\\)\\.git\\'" "\\1"
                (magit-get "remote"
                           (magit-get-current-remote)
                           "url"))
               (magit-get-current-branch))))

    (eval-after-load 'magit
      '(define-key magit-mode-map "V"
         #'endless/visit-pull-request-url))

    (add-hook 'magit-log-edit-mode-hook (lambda() (flyspell-mode t)))

    (add-hook 'magit-log-mode-hook
              (lambda ()
                (define-key magit-log-mode-map (kbd "w") 'magit-copy-item-as-kill))))
  :bind (("C-c g m" . magit-status)
         ("C-c g l l" . magit-log)
         ("C-c g f l" . magit-file-log)
         ("C-c g d w" . magit-diff-working-tree)
         ("C-c g d s" . magit-diff-staged)
         ("C-c g d u" . magit-diff-unstaged)
         ("C-c g s c" . magit-show-commit)))

(use-package git-timemachine
  :ensure t
  :bind ("C-c g t m" . git-timemachine))

(use-package git-gutter
  :ensure t
  :init (global-git-gutter-mode 1)
  :bind (("C-c g n" . git-gutter:next-hunk)
         ("C-c g p" . git-gutter:previous-hunk)
         ("C-c g P" . git-gutter:popup-hunk)
         ("C-c g s h" . git-gutter:stage-hunk)
         ("C-c g r" . git-gutter:revert-hunk)
         ("C-c g u" . git-gutter:update-all-windows))
  :config
  (progn
    (diminish 'git-gutter-mode)))

(use-package vc-git
  :bind ("C-c g g" . vc-git-grep))

(provide 'dvcs)
