#lang racket

(define a 1)
a
; Ouput 1

(define b (+ 2 2))
b
; Ouput 4, is 2 + 2

(define c (+ a b))
c
; a + b


; list notation
; (1. (2. (3. )))
; First element = 1
; Rest of list (2. (3. )) 
; First element = 2
; ...

(define d (list 2 2 3 4 5))
d
; Outputs list 2 2 3 4 5

(cons 0 d)
; Outputs list 0 2 2 3 4 5 
; Does not save to d tho

(car d)
; Outputs first element 2

(cdr d)
; Outputs list after element 2

(car(cdr d))
; Outputs element after list after element 2
; so 2

; 1. Combine two atoms
; 2. Test car/cdr to obtain first & rest elements of combined list

(define e (list 1 2))
e

(define f (list 3 4 5))
f

(define g (append e f))
g

(car g)
(cdr g)

(null? g)
; says if empty or not

(define h (list))
(null? h)

(length g)

(reverse g)
