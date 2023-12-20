(in-package :cl-user)

(uiop:define-package example-lambda
  (:use #:cl)
  (:import-from #:ningle
                #:app
                #:route
                #:make-request
                #:make-response)
  (:import-from #:cl-aws-lambda/runtime-interface
                #:request-id-of
                #:*context*)
  (:local-nicknames (#:log #:vom))
  (:export #:hello))

(in-package :example-lambda)

(log:config t :debug)

(declaim (optimize (space 3) (speed 0)))

;; (defvar *app* (make-instance 'ningle:app))

;; (setf (ningle:route *app* "/")
;;       "Welcome to lambda!")

;; (setf (ningle:route *app* "/login" :method :POST)
;;       "POST Request to /login")


(defmethod request-id-of ((object t))
  "some-id")

;; (defmethod make-request ((app app)  env)
;;   )
;;

(defun hello (event)

  (vom-json:with-json-logging
      (log:info "event ~s" event)
    (let ((name (cdr (assoc "name" event :test #'string=))))
      (if name
          `( ("statusCode" . 200)
             ("body" .
                     (("response" . ,(format nil "Hello, ~a!" name))
                      ("request-id" . ,(request-id-of *context*)))))
          (error "No name supplied!")))))
