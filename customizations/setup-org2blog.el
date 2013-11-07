(setq org2blog/wp-blog-alist
      '(("cupfullofcode"
         :url "http://cupfullofcode.com/xmlrpc.php"
         :username "keelerm84"
         :default-title "Hello World"
         :default-categories ("Emacs")
         :tags-as-categories nil)
        ("keelerfamily"
         :url "http://keelerfamily.net/xmlrpc.php"
         :username "keelerm"
         :default-title "Hello World"
         :default-categories ("Baby")
         :tags-as-categories nil)
        ))

(provide 'setup-org2blog)
