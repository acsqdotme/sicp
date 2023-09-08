#lang sicp

;; this func artificially constructs the expression (+/- a b) where +/- is 
;; decided by the value of b; we're starting to get into the data=code blur

(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

(define a (a-plus-abs-b 2 3))
(define b (a-plus-abs-b 2 -3))
(= a b) ; #t
