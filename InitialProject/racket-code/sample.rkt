#lang racket
(require math) ; Provides math functions

;; Define a function to compute the square of a number
(define (square x)
  (* x x))

;; Prompt the user to enter a number
(display "Enter a number to square: ")
;; Read the input and convert it to a number using `read`
(define user-input (read))
;; Print the result of squaring the user input
(printf "The square of ~a is ~a\n" user-input (square user-input))