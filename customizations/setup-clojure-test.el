(require 'cider)

(local-set-minor-mode-key 'clojure-test-mode (kbd "C-c k") nil)

(local-set-minor-mode-key 'clojure-test-mode (kbd "C-c c") 'clojure-test-clear)

(provide 'setup-clojure-test)
