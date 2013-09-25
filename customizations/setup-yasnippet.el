(require 'yasnippet)

(setq yas/root-directory
       '("~/.emacs.d/snippets/" "~/.emacs.d/el-get/yasnippet/snippets/"))
(mapc 'yas/load-directory yas/root-directory)
(setq yas/indent-line nil)

(provide 'setup-yasnippet)
