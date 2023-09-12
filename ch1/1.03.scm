#lang sicp

(define (square x) 
  (* x x))

(square 3) ; 9

(define (sos x y) 
  (+ (square x) (square y)))

(sos 3 4) ; 25

(define (sos-top-two x y z)
  (cond 
    ((and (> x y) (> y z)) (sos x y))
    ((and (> x y) (<= y z)) (sos x z))
    (else (sos y z))))

"These should all be the same"
(sos-top-two 1 2 3)
(sos-top-two 1 3 2)
(sos-top-two 2 1 3)
(sos-top-two 2 3 1)
(sos-top-two 3 1 2)
(sos-top-two 3 2 1)
