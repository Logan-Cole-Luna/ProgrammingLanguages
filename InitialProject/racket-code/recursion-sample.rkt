#lang racket

(define (getIthElement someList i)
      (if (= i 0)
          (car someList)
          (getIthElement (cdr someList) (- i 1))
          ))

;; edge cases
; get last element from the list
(getIthElement '(33 11 22) 0)
(getIthElement '(33 11 22) 1)
(getIthElement '(33 11 22) 2)
(getIthElement '(33 11 22) 3) ; Not happy world, break