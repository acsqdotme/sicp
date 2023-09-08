#lang sicp

(define (my-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(my-if (= 2 3) 0 5)
(my-if (= 1 1) 0 5)

;; works great with atoms like 0 and 5, but exercise 1.05 showed that as long
;; as you use applicative-order eval, any recursive definition like
;; good-enough? is gonna get messed up in a procedure. the real if is a special
;; form to not have to deal with this kind of problem.

;; what we really need to learn is how to make our own special forms...
