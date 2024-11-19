#lang racket

;1. Write a function that takes two atoms and a list as parameters and replaces all occurrences of the
;first given atom in the list with the second given atom, no matter how deeply the first atom is
;nested.

;2. Write a function that takes two two-dimensional (2D) points and returns the distance between
;them. A point will have its x, and y value.

;3. Complete the following function by implementing the reverse function. Test your implementation
;of the reverse function by checking if a list is a palindrome.


;1. Write a function that takes two atoms and a list as parameters and replaces all occurrences of the
;first given atom in the list with the second given atom, no matter how deeply the first atom is
;nested.

(define (replace l a1 a2)
  (cond
    ; If the list is empty, return it as-is
    [(null? l) '()]

    ; If the current element is a list, recursively process it
    [(list? (car l))
        (cons (replace (car l) a1 a2) (replace (cdr l) a1 a2))]

    ; If the current element is equal to a1, replace it with a2
    [(equal? (car l) a1)
        (cons a2 (replace (cdr l) a1 a2))]

    ; Otherwise, keep the current element as is
    [else
        (cons (car l) (replace (cdr l) a1 a2))]))

; first element, l, is input list
; sexond element, key, is element being searched for
; Test cases:
(replace '(1 2 (3 4 (5 1)) 6 1) 1 99)
; Output: '(99 2 (3 4 (5 99)) 6 99)

(replace '(a (b c (d a)) e f) 'a 'x)
; Output: '(x (b c (d x)) e f)


;2. Write a function that takes two two-dimensional (2D) points and returns the distance between
;them. A point will have its x, and y value.

(define (distance p1 p2)
    ;dist function
    ; sqrt((x2-x1)^2 + (y2 -y2)^2)
    (sqrt 
        (+ 
            (sqr (- (first p2) (first p1))) 
            (sqr (- (second p2) (second p1))))))

; first element, l, is input list
; sexond element, key, is element being searched for
; Test cases:
(distance '(1 2) '(2 2))
(distance '(2 3) '(4 55))
(distance '(3 4) '(6 8)) ; 5.0
(distance '(1 1) '(4 5)) ; 5.0
(distance '(0 0) '(3 4)) ; 5.0

;3. Complete the following function by implementing the reverse function. Test your implementation
;of the reverse function by checking if a list is a palindrome.

(define reverseRecursion
  (lambda (lst)
    (define (helper stack acc)
      (cond
        ; If the stack is empty, return the accumulated reversed list
        [(null? stack) acc]

        ; Otherwise, move the first element of the stack to the accumulator
        [else
         (helper (cdr stack) (cons (car stack) acc))]))
    ; Call the helper with the original list and an empty accumulator
    (helper lst '())))

(define (isPalindrome lst)
  (equal? lst (reverseRecursion lst)))

(displayln (reverseRecursion '(1 2 3 4 5)))       ; Output: '(5 4 3 2 1)
(displayln (reverseRecursion '(1 2 3 2 1)))       ; Output: '(1 2 3 2 1)
(displayln (isPalindrome '(1 2 3 2 1)))           ; Output: #t
(displayln (isPalindrome '(1 2 3 4 5)))           ; Output: #f