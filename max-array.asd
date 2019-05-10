;;;; -*- Mode: Lisp; Syntax: ANSI-Common-Lisp; Base: 10 -*-

(defpackage #:max-array-asd
  (:use :cl :asdf))

(in-package :max-array-asd)

(asdf:defsystem "max-array"
  :name "max-array"
  :version "0.0.1"
  :author "Maris Orbidans"
  :licence "Public Domain"
  :serial t
  :components ((:module "src"
		:serial t
		:components ((:file "max-array"))))
  :in-order-to ((test-op (test-op "max-array/tests"))))

(asdf:defsystem "max-array/tests"
  :licence "Public Domain"
  :depends-on (:max-array
	       :check-it
	       :fiasco)
  :serial t
  :components ((:module "tests"
		:components ((:file "max-array-tests"))))
  :perform (test-op (o c) (uiop:symbol-call 'fiasco 'all-tests)))
