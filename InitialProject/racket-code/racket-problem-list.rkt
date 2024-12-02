;Search -- Given a list of integers, l, and a key, key, return #t if the key is in
;the list, and #f otherwise.
;What is the name of the search algorithm used? Put it in comments

;CountIfEquals -- Given a list of integers, l, and a key, key, return the number of
;times that the key apears in l.

;Sort Colors:
;Given an unsorted list of numbers, sort the list
;The size of the list is undefined. The list will only contain a 0, 1, or 2
;Inspired from: https://leetcode.com/problems/sort-colors

#lang racket
;Search -- Given a list of integers, l, and a key, key, return #t if the key is in
;the list, and #f otherwise.
;What is the name of the search algorithm used? Put it in comments

(define (search l key)
    (cond
        [(null? l) #f]                ; is empty?             
        [(equal? (car l) key) #t]     ; if key found, true   
        [else (search (cdr l) key)])) ; if not found, loop through again till null

(search '(33 11 22) 22)

;CountIfEquals -- Given a list of integers, l, and a key, key, return the number of
;times that the key apears in l.

;CountIfEquals -- Given a list of integers, l, and a key, key, return the number of
;times that the key appears in l.

(define (CountIfEquals l key)
    (define (helper l key num)
        (cond
            [(null? l) num]                           ; base case: return accumulator
            [(equal? (car l) key) (helper (cdr l) key (+ num 1))]  ; if match, increment
            [else (helper (cdr l) key num)]))        ; if no match, continue
    (helper l key 0))                                ; start with counter at 0

(CountIfEquals '(33 11 22 22) 22)                

;Sort Colors:
;Given an unsorted list of numbers, sort the list
;The size of the list is undefined. The list will only contain a 0, 1, or 2

; Helper funct to create a list with n occurrences of x

(define (sort lst)
    (define (helper lst sorted)
        (cond
            [(null? lst) sorted]
            [(equal? (car lst) 0)
             (helper (cdr lst) (append sorted (list 0)))]
            [(equal? (car lst) 1)
             (helper (cdr lst) (append sorted (list 1)))]
            [(equal? (car lst) 2)
             (helper (cdr lst) (append sorted (list 2)))]
            [else sorted]))  ; handle invalid inputs
    (helper lst '()))  ; initialize with empty list

; Test the sort function
(display "Input: ")
(display '(1 0 2 0 1 2 0))
(newline)
(display "Sorted output: ")
(display (sort '(1 0 2 0 1 2 0)))
(newline)

; could expand to use search to ensure only 0, 1, and 2 are in, then pass into sort