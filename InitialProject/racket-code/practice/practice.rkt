;(nested-list-sum '((1 2) (3 (4 (5))) 6)) ; Expected output: 21
; Explanation:
; Sum of all elements: 1 + 2 + 3 + 4 + 5 + 6 = 21

#lang racket

(define (nested-list-sum lst)
    (define (helper lst sum)
        (cond
            [(null? lst) sum]
            [(list? (car lst))
                (helper (cdr lst) (+ sum (nested-list-sum (car lst))))]
            [else (helper (cdr lst) (+ sum (car lst)))]
        )
    )
    (helper lst 0)
)

(nested-list-sum '((1 2) (3 (4 (5))) 6)) ; Expected output: 21

