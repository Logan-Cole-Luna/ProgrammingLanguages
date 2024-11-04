#lang racket

(define identity (lambda (n) n))

(define addOne (lambda (n) (+ (identity n) 1)))

(identity 5)

(addOne 5)

; Water boil temp:
(define temp (lambda (e) (- 212 (/ e 500))))

(temp 1000)


(define myFunction (lambda (x y) (x 2 y)))
(myFunction + 3)
(myFunction * 3)

(define myFunction2 (lambda(x y) (+ x y)))
(myFunction2 5 4)
(myFunction myFunction2 - 1)
;(map myFunction2 '(2)'(2))
