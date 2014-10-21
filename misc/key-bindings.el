;; Window controls
(global-set-key (kbd "C-c h") 'windmove-left)
(global-set-key (kbd "C-c j") 'windmove-down)
(global-set-key (kbd "C-c k") 'windmove-up)
(global-set-key (kbd "C-c l") 'windmove-right)
(global-set-key (kbd "C-c |") 'toggle-window-split)

(global-set-key (kbd "C-c w r") 'windresize)
(global-set-key (kbd "C-c w j") 'ace-window)
(global-set-key (kbd "C-c w d") 'toggle-window-dedicated)

;; Convenient toggle bindings
(global-set-key (kbd "C-c t s s") 'smartscan-mode)
(global-set-key (kbd "C-c t l n") 'linum-mode)
(global-set-key (kbd "C-c t l l") 'toggle-truncate-lines)
(global-set-key (kbd "C-c t e m") 'evil-mode)

;; Expand region
(global-set-key (kbd "M-=") 'er/expand-region)
(global-set-key (kbd "M-/") 'hippie-expand)

;; Project Management
(global-set-key (kbd "M-i") 'imenu)

;; Text manipulation
(autoload 'zap-up-to-char "misc" "Kill up to, but not including ARGth occurrence of CHAR.")
(global-set-key (kbd "M-z") 'zap-up-to-char)
(global-set-key (kbd "M-Z") 'zap-to-char)
(global-set-key (kbd "C-c d") 'duplicate-line)
(global-set-key (kbd "M-w") 'keelerm/kill-ring-save)
(global-set-key (kbd "C-w") 'keelerm/kill-region)

(global-set-key (kbd "C-x r t") 'set-rectangular-region-anchor)
(global-set-key (kbd "C-c f j") 'format-json)

;; Multiple cursors
(global-set-key (kbd "C-c m p") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c m n") 'mc/mark-next-like-this)
(global-set-key (kbd "C-c m a") 'mc/mark-all-like-this)
(global-set-key (kbd "C-c m l") 'mc/edit-lines)

;; Buffer manipulation
(global-set-key (kbd "C-c n") 'cleanup-buffer)
(global-set-key (kbd "C-x C-r") 'rename-current-buffer-file)
(global-set-key (kbd "C-x C-k") 'delete-current-buffer-file)

(global-set-key (kbd "C-c s") 'create-scratch-buffer)
(global-set-key (kbd "M-s") 'save-buffer)

(global-set-key (kbd "C-x C-b") 'ibuffer)

;; Modes

;; Git
(global-set-key (kbd "C-c g m") 'magit-status)
(global-set-key (kbd "C-c g n") 'git-gutter:next-hunk)
(global-set-key (kbd "C-c g p") 'git-gutter:previous-hunk)
(global-set-key (kbd "C-c g P") 'git-gutter:popup-hunk)
(global-set-key (kbd "C-c g s h") 'git-gutter:stage-hunk)
(global-set-key (kbd "C-c g r") 'git-gutter:revert-hunk)
(global-set-key (kbd "C-c g t m") 'git-timemachine)
(global-set-key (kbd "C-c g g") 'vc-git-grep)
(global-set-key (kbd "C-c g l l") 'magit-log)
(global-set-key (kbd "C-c g f l") 'magit-file-log)
(global-set-key (kbd "C-c g d w") 'magit-diff-working-tree)
(global-set-key (kbd "C-c g d s") 'magit-diff-staged)
(global-set-key (kbd "C-c g d u") 'magit-diff-unstaged)
(global-set-key (kbd "C-c g s c") 'magit-show-commit)
(global-set-key (kbd "C-c g u") 'git-gutter:update-all-windows)

(global-set-key (kbd "C-x e") 'eshell)
(global-set-key (kbd "C-c q") 'auto-fill-mode)

;; Org Mode
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c b") 'org-iswitchb)
(define-key global-map (kbd "C-c c") 'org-capture)

;; emms controls
(global-set-key (kbd "<f5>") 'emms-shuffle)
(global-set-key (kbd "<f6>") 'emms-pause)
(global-set-key (kbd "<f7>") 'emms-previous)
(global-set-key (kbd "<f8>") 'emms-next)
(global-set-key (kbd "<f9>") 'emms-volume-lower)
(global-set-key (kbd "<f10>") 'emms-volume-raise)

(global-set-key (kbd "<f2>") 'neotree-toggle)

;; Lisp evaluation
(global-set-key (kbd "C-c e e") 'eval-last-sexp)
(global-set-key (kbd "C-c e r") 'eval-and-replace)
(global-set-key (kbd "C-c e R") 'eval-region)
(global-set-key (kbd "C-c e b") 'eval-current-buffer)
(global-set-key (kbd "C-c e d") 'eval-defun)

(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

(global-set-key (kbd "C-x C-f") 'find-file)

(key-chord-define-global "jw" 'ace-jump-mode)
(key-chord-define-global "jc" 'ace-jump-char-mode)
(key-chord-define-global "jl" 'ace-jump-line-mode)
(key-chord-define-global "jf" 'ace-window)
(key-chord-define-global "zf" 'ace-jump-zap-to-char)
(key-chord-define-global "zt" 'ace-jump-zap-up-to-char)

(key-chord-define-global "mx" 'helm-M-x)
(global-set-key (kbd "C-h C-m") 'discover-my-major)

;;; Prime jump-to-register with commonly accessed files
(mapcar
 (lambda (r)
   (set-register (car r) (cons 'file (cdr r))))
 `((?d . "~/Downloads")
   (?i . "~/.emacs.d/init.el")
   (?l . "~/Documents/Dropbox/personal.ledger")
   (?o . ,org-directory)
   (?t . ,(keelerm/org-path "Tortugas"))))

(provide 'key-bindings)

org-directory
