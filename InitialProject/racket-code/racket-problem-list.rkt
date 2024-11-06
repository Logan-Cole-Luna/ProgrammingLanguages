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

(define (CountIfEquals l key)
    (cond
        [(null? l) 0]                        ; is it empty?
        [(equal? (car l) key)                ; If key found
        (+ 1 (CountIfEquals (cdr l) key))]  ; Increment counter & loop
        [else (CountIfEquals (cdr l) key)])) ; else just loop till empty

(CountIfEquals '(33 11 22 22) 22)                

;Sort Colors:
;Given an unsorted list of numbers, sort the list
;The size of the list is undefined. The list will only contain a 0, 1, or 2

; Helper funct to create a list with n occurrences of x
(define (create-list n x)
  (if (<= n 0)                           
      '()                                ; If n is none, base case
      (cons x (create-list (- n 1) x)))) ; add x to list n times, recursion

(define (Sort l)
  (append (create-list (CountIfEquals l 0) 0)      ; based off number of 0's found create list
          (create-list (CountIfEquals l 1) 1)      ; then append lists together
          (create-list (CountIfEquals l 2) 2))) 

(Sort '(1 0 2 0 1 2 0))  ; '(0 0 0 1 1 2 2)

; could expand to use search to ensure only 0, 1, and 2 are in, then pass into sort