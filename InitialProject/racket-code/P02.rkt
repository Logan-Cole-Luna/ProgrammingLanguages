#lang racket

;Create a function called SearchInsertPosition with the following functionality: Given a sorted list of distinct
;integers and a target value, return the index if the target is found. If not, return the index where it would
;be if it were inserted in order.

; l is input list
; key is element being searched for
(define (SearchInsertPosition l key)
  ; helper, index is position of key, initialized as 0
  (define (helper l key index)
    (cond
      ; If the list is empty or the current element is greater than the key
      ; return the current index as the insert position
      [(or (null? l) (< key (car l))) index
        (displayln "Key not found. Insert position: ")
        (displayln index)]

      ; If the key is found return current index
      [(equal? (car l) key) index
        (displayln "Key found at index: ")
        (displayln index)]

      ; If the key is not found shorten list & increment index
      [else 
        (helper (cdr l) key (+ index 1))]))
   ; Initialize helper
  (helper l key 0))

; first element, l, is input list
; sexond element, key, is element being searched for
; Test cases:
(SearchInsertPosition '(0 1 2 4 5) 3)  ; Should return 3 as the insert position
(SearchInsertPosition '(0 1 2 4 5) 1)  ; Should return 1 as the index
(SearchInsertPosition '() 1)  ; Empty list test, should return 0 as insert position
(SearchInsertPosition '(0 1 4 5) 3)
(SearchInsertPosition '(0 1 2 4 5) 7)


;Create a function called AddLists with the following functionality: Given two numbers coded as two lists,
;add them and return the sum as a string. You are not allowed to convert the entire list into a number and
;make the addition. You are allowed to add units, for example for the lists 1 2 3 and 1 you can perform 3 +
;1. However, the addition of 123 + 1 is not allowed. You can assume that the numbers are greater or equal
;than zero. 

; l1 is list 1
; l2 is list 2
(define (AddLists l1 l2)
  ; helper, sum is running sum of l1 & l2, initialized as 0
  (define (helper l1 l2 sum)
    (cond
      ; If both lists are empty, return & display sum
      [(and (null? l1) (null? l2)) sum
        (displayln "Sum of lists:")
        (displayln sum)]
      
      ; If one of lists is empty, use 0 for value
      [(null? l1)
        (helper l1 (cdr l2) (+ sum (car l2)))]
      [(null? l2)
        (helper (cdr l1) l2 (+ sum (car l1)))]
      
      ; Recursively add the first element of both lists & move to next element
      [else 
        (helper (cdr l1) (cdr l2) (+ sum (car l1) (car l2)))]))
  ; Initialize helper
  (helper l1 l2 0))

; first element, l1, is list 1
; sexond element, l2, is list 2
; Test cases:
(AddLists '(1 2 3) '(4 5)) ; Expected to retun 15, 1 + 2 + 3 + 4 + 5 = 15
(AddLists '(1 2) '(4)) ; Expected to return 7
(AddLists '() '()) ; Empty list test, expected to return 0
(AddLists '(1 2 3 3 2 1) '(4 5))
(AddLists '(1 2 3) '(4 5 90000000000000000000000))


;Create a function called Flatten with the following functionality: Given a list of atoms and sublists return
;a list that contains only atoms. For example: ‘( 1 (2 3) 4 (5 6 7)) will return ‘(1 2 3 4 5 6 7). The number of
;sublists is undefined, for example this is a valid entry ‘(1 (2 3 (4 (5 6 (7 8)))) 9 10). This list contains three
;atoms and one sublist, that sublist contains atoms and a sublist, etc.

; lst is input list to be flattened
(define (Flatten lst)
  ; helper funct
  ; stack is current sublist or atom of lst being recursed
  ; acc is accimilation of the flattened lst, initialized as empty
  (define (helper stack acc)
    (cond
       ; If empty, return reversed acc
      [(null? stack) (reverse acc)]
      [(list? (car stack)) 
       ; If top of the stack is list, append elements to the front of the stack
       (helper (append (car stack) (cdr stack)) acc)]
      [else 
       ; If top of the stack is atom, add to acc
       (helper (cdr stack) (cons (car stack) acc))]))
  ; Initialize helper w/ original list
  (helper lst '()))

; First element, lst, is input list to be flattened
; Test cases:
(displayln (Flatten '(1 (2 3) 4 (5 6 7))))    ; Output: '(1 2 3 4 5 6 7)
(displayln (Flatten '(0 1 2 (4 (5 (6 7))) 8))) ; Output: '(0 1 2 4 5 6 7 8)
(displayln (Flatten '()))                      ; Output: '()
(displayln (Flatten '(1 (2 (3 (4 5))) 6)))        ; Output: '(1 2 3 4 5 6)
(displayln (Flatten '(1 (2) 3 (4 5 (6 7 (8 9))))))
(displayln (Flatten '(1 (2 3 (4 (5 6 (7 8)))) 9 10)))
(displayln (Flatten '(10 (20 3 (74 (85 96 (17 28)))) 9 100000000000000000000000000000000)))


