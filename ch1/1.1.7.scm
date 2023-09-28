#lang sicp

;; From 1.1.7
(define (square x)
  (* x x))



(define (sqrt-iter guess x)
  (if (good-enough? guess x)
    guess
    (sqrt-iter (improve guess x)
               x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average a b)
  (/ (+ a b) 2))

;; no wonder CS people are intimidated by this book; it doesn't really try to
;; make newton's method make sense. also quotient and radicand are evil words.

(define (good-enough? guess x)
  (< (abs (- x (square guess))) 0.001)) ; constant already looks bad.

(define (sqrt x)
  (sqrt-iter 1.0 x))

(sqrt 9)

(sqrt (+ 100 37))

(sqrt (+ (sqrt 2) (sqrt 3)))

(square (sqrt 1000)) ; got the exact same floats as they did; very cool.
