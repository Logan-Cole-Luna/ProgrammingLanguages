#lang racket

(define (odd-num lst)
    (cond
        [(empty? lst) '()]
        [(equal? (modulo (first lst) 2) 1)
        (cons (first lst) (odd-num(cdr lst)))]
        [else (odd-num(cdr lst))]  
    )
)


; Test cases
(displayln "Test 1 - Mixed numbers:")
(odd-num '(1 2 3 4 5 6))

(displayln "Test 2 - Empty list:")
(odd-num '())

(displayln "Test 3 - All odd numbers:")
(odd-num '(1 3 5 7 9))

(displayln "Test 4 - All even numbers:")
(odd-num '(2 4 6 8 10))

(displayln "Test 5 - Single number:")
(odd-num '(3))


(define (base-5 num)
    (define (helper num count result)
        (cond
            [(zero? num) (append '(1) result)]
            [(equal? (modulo num 5) 0)
             (helper (quotient num 5) 0 (cons count result))]
            [else 
             (helper (- num 1) (+ count 1) result)]
        )
    )
    (helper num 0 '())
)

(base-5 42)
