#lang sicp

(define (my-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(my-if (= 2 3) 0 5)
(my-if (= 1 1) 0 5)

;; works great with atoms like 0 and 5, but exercise 1.05 showed that as long
;; as you use applicative-order eval on a procedure, any recursive definition like
;; good-enough? could get hung up on itself like (p) in the previous exercise. 
;; the real if is a special form to not have to deal with this kind of problem.

;; another way of rewording this is that you basically made a procedure funnel
;; for a special order expression, but the funnel is less a funnel and more of
;; an asthmatic throat that likes to close up whenever its applicative-order 
;; condition acts up.

;; what we really need to learn is how to make our own special forms...
