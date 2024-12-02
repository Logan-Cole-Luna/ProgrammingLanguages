#lang racket

; Find the maximum depth of a nested list structure
; Example: (max-depth '((1 (2)) (3 (4 (5))) 6)) ; Expected output: 4
; Explanation:
; - (2) is at depth 2
; - (5) is at depth 4 (deepest)
; - 6 is at depth 1

(define (max-depth lst)
    (define (helper lst current-depth)
        (cond
            [(null? lst) current-depth]
            [(list? (car lst))
                (max (helper (car lst) (+ current-depth 1))
                     (helper (cdr lst) current-depth))]
            [else (helper (cdr lst) current-depth)]
        ))
    (helper lst 1))

(max-depth '((1 (2)) (3 (4 (5))) 6)) ; Should output 4
(max-depth '(1 2 3)) ; Should output 1
(max-depth '((1 2) (3 4))) ; Should output 2