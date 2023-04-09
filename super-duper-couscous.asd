(defsystem "super-duper-couscous"
  :version "0.1.0"
  :author "Samantha Doran"
  :license "GPLv3"
  :depends-on ("clsql")
  :components ((:module "src"
                :components
                ((:file "main"))))
  :description ""
  :in-order-to ((test-op (test-op "super-duper-couscous/tests"))))

(defsystem "super-duper-couscous/tests"
  :author "Samantha Doran"
  :license "GPLv3"
  :depends-on ("super-duper-couscous"
               "rove")
  :components ((:module "tests"
                :components
                ((:file "main"))))
  :description "Test system for super-duper-couscous"
  :perform (test-op (op c) (symbol-call :rove :run c)))
