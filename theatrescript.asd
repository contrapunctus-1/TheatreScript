(defsystem     theatrescript
  :description "A markup language for theatre scripts."
  :version     "0.0.1"
  :serial      t
  :license     "Unlicense"
  :author      "contrapunctus <contrapunctus at disroot dot org>"
  :depends-on  ("esrap")
  :components  ((:file "package")
                (:file "parser")))
