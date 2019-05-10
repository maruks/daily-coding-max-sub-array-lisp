(defpackage :max-array
  (:use cl)
  (:export simple-max rec-max kadene-max kadene-max-loop))

(in-package :max-array)

(defun simple-max (array)
  (loop :for i :to (1- (length array))
	:maximize (loop :for j :to (1- (length array)) :when (>= j i)
			:maximize (loop :for n :from i :to j :sum (aref array n)))))

(defun array-sum (array)
  (loop :for i :to (1- (length array)) :sum (aref array i)))

(defun find-max (i j sum array)
  (let ((rest (when (> j i)
		(list (find-max (1+ i) j (- sum (aref array i)) array)
		      (find-max i (1- j) (- sum (aref array j)) array)))))
    (apply #'max (cons sum rest))))

(defun rec-max (array)
  (find-max 0 (1- (length array)) (array-sum array) array))

(defun kadene (xs max)
  (if xs
      (cons max (kadene (cdr xs) (max (car xs) (+ max (car xs)))))
      (list max)))

(defun kadene-max (array)
  (apply #'max (kadene (cdr (coerce array 'list)) (aref array 0))))

(defun kadene-max-loop (array)
  (loop :for i :to (1- (length array))
	:for max = (if (zerop i)
		       (aref array i)
		       (max (aref array i) (+ max (aref array i))))
	:maximize max))
