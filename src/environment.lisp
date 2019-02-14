(defpackage cl-aws-lambda/environment
  (:use :cl :alexandria)
  (:import-from #:cl-aws-lambda/conditions
		#:environment-error)
  (:export #:with-environment
	   #:*handler*
	   #:*lambda-task-root*
	   #:*aws-lambda-runtime-api*))

(in-package :cl-aws-lambda/environment)

(defvar *handler* nil
  "The handler specified by the lambda function's configuration, should be an external symbol of a package, ie. something of the form ``package:function-name``.  Case is not significant.")


(defvar *lambda-task-root* nil
  "The function that contains the function code.")


(defun check-environment ()
  "Checks to see that everything outside the lisp runtime is set up as we expect."

  (flet ((check-env (name)
	   (unless (uiop:getenvp name)
	     (error 'environment-error
		    :message (format nil "Environment variable ~S was not set during initialization." name)))))
    (check-env "_HANDLER")
    (check-env "LAMBDA_TASK_ROOT")))


(defmacro with-environment (() &body body)
  `(let ((*handler* (uiop:getenv "_HANDLER"))
	 (*lambda-task-root* (uiop:getenv "LAMBDA_TASK_ROOT")))
     ;; (declare (dynamic-extent *handler* *lambda-task-root* *aws-lambda-runtime-api*))
     (log:info "Environment:
  _HANDLER: ~a
  LAMBDA_TASK_ROOT: ~a" *handler* *lambda-task-root*)
     (check-environment)
     ,@body))
