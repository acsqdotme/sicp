#lang sicp

(define (square x)
  (* x x))

(define (average a b)
  (/ (+ a b) 2))

(define (sqrt x) ; read ahead to internal defs and block structs
  (define (good-enough? guess)
    (< (abs (- x (square guess))) 0.001))
  (define (improve guess)
    (average guess (/ x guess)))
  (define (sqrt-iter guess)
    (if (good-enough? guess)
      guess
      (sqrt-iter (improve guess))))
  (sqrt-iter 1.0))

(square (sqrt 100))
;; works well

;; Let's go smaller...
(sqrt 0.001) ; same num as difference to see if it's sufficiently close
(square (sqrt 0.001))
;; already adding 70% more to original value

(square (sqrt 0.0001))
;; an order of magnitude off

;; Now big
(square (sqrt 999999999))
;; technically nothing wrong with big numbers. I just feel bad wasting so many
;; cpu cycles to get 0.001 precision

;; Let's make our own
(define (new-sqrt x) ; read ahead to internal defs and block structs
  (define (good-enough? guess) ; proportional instead of just absolute
    (< (abs (/ (- x (square guess)) x)) 0.001)) ; abs((x - guess^2)/x) < 0.001
  (define (improve guess)
    (average guess (/ x guess)))
  (define (sqrt-iter guess)
    (if (good-enough? guess)
      guess
      (sqrt-iter (improve guess))))
  (sqrt-iter 1.0))

(square (new-sqrt 100)) ; not as precise as one above
(square (new-sqrt 0.0001)) ; but this is so much better

;; Now to do what the book actually wants me to solve
(define (new-new-sqrt x) ; read ahead to internal defs and block structs
  (define (improve guess)
    (average guess (/ x guess)))
  (define (good-enough? guess) ; kinda similar to mine but with guess
    (< (abs (/ (- guess (improve guess)) guess)) 0.001))
  (define (sqrt-iter guess)
    (if (good-enough? guess)
      guess
      (sqrt-iter (improve guess))))
  (sqrt-iter 1.0))

(square (new-new-sqrt 100)) ; identical result to my function
(square (new-new-sqrt 0.0001)) ; identical result to my function

;; woahhhh. I'm glad I did it my way first. I didn't realize they were
;; identical strategies till I ran the results.

(square (new-new-sqrt 1000000000)) ; less accuracy than the puny one for sure

;; this strategy is better for tiny numbers than huge ones.
