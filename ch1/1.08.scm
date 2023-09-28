#lang sicp

(define (square x)
  (* x x))

(define (cube x)
  (* x x x))

(define (cbrt x)
  (define (good-enough? guess)
    (< (abs (- x (cube guess))) 0.001))
  (define (improve guess)
    (/ (+ (/ x (square guess)) (* 2 guess)) 3))
  (define (cbrt-iter guess)
    (if (good-enough? guess)
      guess
      (cbrt-iter (improve guess))))
  (cbrt-iter 1.0))

(cbrt 8)
(cbrt 27)
(cbrt 1000)
(cube (cbrt 234))
(cube (cbrt .0025))
(cube (cbrt 123456789))
