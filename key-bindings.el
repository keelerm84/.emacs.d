;; Window controls
(global-set-key (kbd "C-c h") 'windmove-left)
(global-set-key (kbd "C-c j") 'windmove-down)
(global-set-key (kbd "C-c k") 'windmove-up)
(global-set-key (kbd "C-c l") 'windmove-right)

(global-set-key (kbd "S-C-h") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-l") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-j") 'shrink-window)
(global-set-key (kbd "S-C-k") 'enlarge-window)

;; Expand region
(global-set-key (kbd "C-=") 'er/expand-region)
(global-set-key (kbd "M-/") 'hippie-expand)

;; Project Management
(global-set-key (kbd "C-c f f") 'fiplr-find-file)
(global-set-key (kbd "C-c f d") 'fiplr-find-directory)
(global-set-key (kbd "C-c f c") 'fiplr-clear-cache)
(global-set-key (kbd "M-i") 'imenu)

;; Text manipulation
(autoload 'zap-up-to-char "misc" "Kill up to, but not including ARGth occurrence of CHAR.")
(global-set-key (kbd "M-z") 'zap-up-to-char)
(global-set-key (kbd "M-Z") 'zap-to-char)
(global-set-key (kbd "C-c d") 'duplicate-line)

(global-set-key (kbd "C-x r t") 'set-rectangular-region-anchor)

;; Multiple cursors
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-*") 'mc/mark-all-like-this)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)

;; Buffer manipulation
(global-set-key (kbd "C-c n") 'cleanup-buffer)
(global-set-key (kbd "C-x C-r") 'rename-current-buffer-file)
(global-set-key (kbd "C-x C-k") 'delete-current-buffer-file)

(global-set-key (kbd "C-c C-s") 'create-scratch-buffer)
(global-set-key (kbd "M-s") 'save-buffer)

(global-set-key (kbd "C-x C-b") 'ibuffer)

;; Modes

;; Git
(global-set-key (kbd "C-;") 'magit-status)
(require 'flyspell)
(define-key flyspell-mode-map (kbd "C-;") 'magit-status)

(global-set-key (kbd "C-c g m") 'magit-status)
(global-set-key (kbd "C-c g n") 'git-gutter:next-hunk)
(global-set-key (kbd "C-c g p") 'git-gutter:previous-hunk)
(global-set-key (kbd "C-c g P") 'git-gutter:popup-hunk)
(global-set-key (kbd "C-c g s") 'git-gutter:stage-hunk)
(global-set-key (kbd "C-c g r") 'git-gutter:revert-hunk)

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

;; Lisp evaluation
(global-set-key (kbd "C-c e e") 'eval-last-sexp)
(global-set-key (kbd "C-c e r") 'eval-and-replace)
(global-set-key (kbd "C-c e R") 'eval-region)
(global-set-key (kbd "C-c e b") 'eval-current-buffer)
(global-set-key (kbd "C-c e d") 'eval-defun)

(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

(global-set-key (kbd "C-x C-f") 'find-file)
(global-set-key (kbd "C-x b") 'helm-buffers-list)

(provide 'key-bindings)
