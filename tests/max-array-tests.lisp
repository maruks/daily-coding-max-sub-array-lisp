(fiasco:define-test-package :max-array-tests
  (:use :max-array :fiasco :check-it))

(in-package :max-array-tests)

(defparameter *array* (make-array 9 :initial-contents '(-2 1 -3 4 -1 2 1 -5 4)))

(defparameter *foo* (make-array 1 :initial-contents '(0)))

(deftest max-array-test ()
  (is (= 6 (simple-max *array*) (rec-max *array*) (kadene-max *array*) (kadene-max-loop *array*))))

(deftest max-array-gen-test ()
  (let ((*num-trials* 1000))
    (check-it (generator (list (integer) :min-length 1))
              (lambda (xs)
		(let ((array (coerce xs 'vector)))
		  (is (= (simple-max array) (rec-max array) (kadene-max-loop array) (kadene-max array))))))))
