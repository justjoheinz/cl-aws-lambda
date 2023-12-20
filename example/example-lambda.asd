(defsystem example-lambda
  :defsystem-depends-on ("cl-aws-lambda/asdf")
  :class :lambda-system
  :depends-on ("vom"
               "vom-json"
               "ningle"
               "assoc-utils")
  :serial t
  :components ((:file "hello"))
  :in-order-to ((test-op (test-op "example-lambda/tests"))))


(defsystem example-lambda/tests
  :depends-on ("example-lambda"
               "rove")
  :serial t
  :components ((:module "t"
                :components ((:file "test"))))
  :perform (test-op (op c) (symbol-call :rove '#:run c)))
