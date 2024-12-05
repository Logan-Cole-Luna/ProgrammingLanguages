#lang racket

; linear search
; search function takes two parameters (myList and key)
(define search (lambda (myList key)
    (cond
        [(empty? myList) #f]        ; base case: empty list returns false
        [(= (car myList) key) #t]   ; found key returns true
        [else (search (cdr myList) key)] ; recursive case
    )
))

; Test cases
(search '(1 2 3 4 5) 3) ; #t
(search '(1 2 3 4 5) 6) ; #f

; counting key
; count function takes two parameters (myList and key)
(define count (lambda (myList key)
    (cond
        [(empty? myList) 0]         ; base case: empty list returns 0
        [(equal? (car myList) key) (+ 1 (count (cdr myList) key))] ; found key, add 1 and recurse
        [else (count (cdr myList) key)]  ; key not found, just recurse
    )))

; test cases
(count '(1 2 3 4 5) 3) ; 1
(count '(1 2 3 4 5) 6) ; 0
(count '(1 2 3 4 5 5 5 5 5) 5) ; 5
(count '() 6) ; 0


(define count-occurrences (lambda (lst x)
    (cond
      [(null? lst)] ; Base case: if the list is empty, return the count
      [(equal? (car lst) x) (+1 (count(cdr lst) x))] ; Increment count if match
      [else (count (cdr lst) x)])) ; Continue without incrementing
)

(count-occurrences '(1 2 3 4 3 3 5) 3) ; Output: 3
(count-occurrences '("dog" "cat" "bird" "cat" "cat") "cat") ; Output: 3
(count-occurrences '(1 2 3 4 5) 7) ; Output: 0
(count-occurrences '(a b c a a b c) 'a) ; Output: 3


; sort colors
; counting sort O(n)

; sort function takes one parameter (myList)
(define sort(lambda (myList)
    (let 
        ([zero (count myList 0)]   ; count occurrences of 0
        [one (count myList 1)]    ; count occurrences of 1
        [two (count myList 2)])   ; count occurrences of 2
        (append 
            (createList zero 0) 
            (createList one 1) 
            (createList two 2))
    )
))

; createList function takes two parameters (times and n)
(define createList(lambda (times n)
    (cond 
        [(<= times 0) '()]           ; base case: no more items to create
        [else(cons n (createList (- times 1) n))] ; create list with n repeated times
    )
))

; test cases
(sort '(0 0 1 0 1 2 2 1 0))
(sort '(2 1))
(sort '())

(createList 3 7)
(createList -3 7)

; Given a list & number
; Ex '(1 2 3 4) 5
; Return true if when two consecutive numbers added equals to 5

(define equalSum (lambda (lst sum)
    (cond
        [(< (length lst) 2) #f]
        [(= (+ (first lst) (second lst)) sum) #t]
        [else (equalSum (cdr lst) sum)]
    )
))

; Test cases
(equalSum '(1 2 3 4) 5)  ; #t
(equalSum '(1 1 3 4) 1)  ; #f
(equalSum '(1 -1 3 4) 0) ; #t
(equalSum '(1 2 3 4) 1)  ; #f
(equalSum '(4) 5)        ; #f
(equalSum '() 5)         ; #f


(define (findConsPairs lst sum)
  (define (helper lst sum construct)
    (cond
      [(< (length lst) 2) construct]
      [(= (+ (first lst) (second lst)) sum)
       (helper (cdr lst) sum (cons (list (first lst) (second lst)) construct))]
      [else (helper (cdr lst) sum construct)]))
  (reverse (helper lst sum '())))

(findConsPairs '(1 2 3 4) 5) ; '((2 3))
(findConsPairs '(1 1 3 4) 2) ; '((1 1))
(findConsPairs '(1 -1 3 4) 0) ; '((1 -1))
(findConsPairs '(4) 5) ; '()
(findConsPairs '() 5) ; '()