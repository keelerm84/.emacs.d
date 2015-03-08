(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

(when (equal system-type 'darwin)
  (setenv "PATH" (concat "/opt/local/bin:/usr/local/bin:" (getenv "PATH")))
  (push "/usr/local/bin" exec-path))

(defvar dotfiles-dir (file-name-directory
                    (or (buffer-file-name) load-file-name)))
(defvar misc-dir (expand-file-name "misc" dotfiles-dir))
(defvar customizations (expand-file-name "customizations" dotfiles-dir))
(defvar org-directory "~/Documents/Dropbox/OrgFiles/")

(defvar defuns-dir (expand-file-name "defuns" dotfiles-dir))
(dolist (file (directory-files defuns-dir t "\\w+"))
  (when (file-regular-p file)
    (load file)))

;; Keep emacs Custom-settings in separate file
(setq custom-file (expand-file-name "custom.el" dotfiles-dir))
(if (file-exists-p custom-file)
    (load custom-file))

;; Write backup files to own directory
(setq backup-directory-alist `(("." . ,(expand-file-name
                                        (concat dotfiles-dir "backups")))))

(add-to-list 'load-path misc-dir)
(add-to-list 'load-path customizations)

(require 'cask "~/.cask/cask.el")
(cask-initialize)

(when (memq window-system '(mac ns))
  (setq mac-command-modifier 'meta))

(require 'exec-path-from-shell)
(add-to-list 'exec-path-from-shell-variables "GOPATH")
(exec-path-from-shell-initialize)

(require 'yasnippet)
(require 'use-package)
(require 'helm)
(require 'appearance)
(require 'auto-complete)
(require 'ggtags)
(require 'behavior)
(require 'ido)
(require 'twittering-mode)
(require 'web-mode)
(require 'setup-org-journal)
(require 'key-bindings)
(require 'mode-mappings)
(require 'ack-and-a-half)
(require 'evil)
(require 'surround)
(require 'feature-mode)
(require 'dirtree)
(require 'key-chord)
(require 'neotree)
(require 'ledger-mode)
(require 'gist)
(require 'vc-git)
(require 'zoom-window)
(require 'tdd)
(require 'restclient)
(require 'sx-load)
(require 'diminish)
(require 'whole-line-or-region)
(whole-line-or-region-mode t)
(require 'rvm)
(rvm-use-default)
(require 'fullframe)
(require 'sunshine)
(require 'elfeed)

(setq elfeed-feeds
      '("http://xkcd.com/rss.xml"))

(setq sunshine-location "Cary, NC")
(setq sunshine-show-icons t)

;;; use-package files.  We are going to individually require these for now.
(require 'buffers)
(require 'dvcs)
(require 'window)
(require 'media)
(require 'mc)
(require 'linum-relative)

(eval-after-load 'auto-complete '(require 'setup-auto-complete))
(eval-after-load 'ido '(require 'setup-ido))
(eval-after-load 'js2-mode '(require 'setup-js2-mode))
(eval-after-load 'dired '(require 'setup-dired))
(eval-after-load 'csharp-mode '(require 'setup-csharp))
(eval-after-load 'twittering-mode '(require 'setup-twitter))
(eval-after-load 'org '(require 'setup-org-mode))
(eval-after-load 'yas '(require 'setup-yasnippet))
(eval-after-load 'php-mode '(require 'setup-php))
(eval-after-load 'helm-mode '(require 'setup-helm))
(eval-after-load 'scala-mode2 '(require 'setup-scala))
(eval-after-load 'scss-mode '(require 'setup-css))
(eval-after-load 'less-css-mode '(require 'setup-css))
(eval-after-load 'css-mode '(require 'setup-css))
(eval-after-load 'cider-mode '(require 'setup-cider))
(eval-after-load 'projectile '(require 'setup-projectile))
(eval-after-load 'ledger-mode '(require 'setup-ledger))
(eval-after-load 'go-mode '(require 'setup-go))

(setq user-full-name "Matthew M. Keeler")
(setq user-mail-address "keelerm84@gmail.com")

;; Launch Emacs in daemon mode
(require 'server)
(unless (server-running-p)
  (server-start))
