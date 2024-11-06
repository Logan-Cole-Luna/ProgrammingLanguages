#lang racket
; This line is fine and will return "sdf" since 5 is greater than 2.
(if (> 5 2) "sdf" "2345")

; Define a function with proper `cond` structure.
(define myFunction 
  (lambda (x y)
    (cond
      [(> x y)
       (display "hello")]
      [else
       (display "x is not greater than y")])))

(myFunction 7 3)  ; This will display "hello"
(newline)
(myFunction 2 5)  ; This will display "x is not greater than y"
(newline)

; Recursive
; Needs: Starting condition, stopping condition (base case), and progress from start to stop
; Factorial Example:
(define (fact n) (if (> n 0) ; Stopping condition (return 1)
                    (* n (fact (- n 1))) ; Recursive call w/ progress towards stop cond
                    1
                    ))

(fact 5) ; Output should be 120

