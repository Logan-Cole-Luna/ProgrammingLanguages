#lang racket 

(define (tree lst key)
    (cond
        [(null? lst) #f]
        [(= (first lst) key) #t] 

        ; less than
        [(< key (first lst))
            (tree((second lst) key))
        ]

        [(> key (first lst))
            (tree((third lst) key))
        ]
    )
)

(tree '(1 (2 (3))) 3)
