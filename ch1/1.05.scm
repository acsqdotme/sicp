#lang sicp

;; this is definitely illegal
(define (p) (p))

;; this is basically a gate for y where if x =/= 0, y is passed through
;; otherwise, 0 is returned.
(define (test x y)
  (if (= x 0)
    0
    y))

;; combining these means that the function (p) is passed through
(test 0 (p))

;;;; applicative-order eval
; (test 0 (p))
; (test 0 (p)) 
; (test 0 (p))
; (test 0 (p))
; (test 0 (p))
;; etc etc etc basically it stalls out because (p) keeps trying to evaluate
;; before it can do anything. basically like a broken for loop but cooler bc
;; recursion

(if (= 0 0) 0 (p))
;; another point to bring up is that the expression above evaluates cause of
;; if being a special form not requiring eval. test being a procedure is what
;; blocks eval above.

;;;; normal-order eval
; (test 0 (p))
; (if (= 0 0) 0 (p)))
; (if #t 0 (p)))
; 0
;; this gets to actually evaluate because the (p) recursion trap doesn't need to
;; eval to get past the test process wrapper for the if special form to do its
;; magic (aka not needing any eval until the predicate says what to eval)
