(require 'cider)

(set-face-background 'clojure-test-failure-face "dark red")
(set-face-foreground 'clojure-test-failure-face "ivory")
(set-face-underline-p 'clojure-test-failure-face nil)
(set-face-background 'clojure-test-error-face "maroon")
(set-face-foreground 'clojure-test-error-face "ivory")
(set-face-underline-p 'clojure-test-error-face nil)
(set-face-background 'clojure-test-success-face "DarkOliveGreen4")
(set-face-foreground 'clojure-test-success-face "ivory")
(set-face-underline-p 'clojure-test-success-face nil)

(define-key clojure-test-mode-map (kbd "C-c k") nil)
(define-key clojure-test-mode-map (kbd "C-c c") 'clojure-test-clear)

(provide 'setup-clojure-test)
