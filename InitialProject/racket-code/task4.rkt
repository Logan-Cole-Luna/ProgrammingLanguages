#lang racket
; ADT
(struct earthquake (magnitude location year))
; Create movie var
(define quake1 (earthquake 6.0 "Miami" 1990))
(define quake2 (earthquake 4.5 "Tampa" 2021))
(define quake3 (earthquake 2.9 "Jacksonville" 2022))

; Getter
;(movie-name movie1)
; (display (movie-name movie-duration movie1))

;max quake
(define max (lambda (q1 q2 q3) (
    if (and (> (earthquake-magnitude q1) (earthquake-magnitude q2))
        (> (earthquake-magnitude q1) (earthquake-magnitude q3)))
    (display "Q1 is greater")
    (display "TODO")
    )))

(max quake1 quake2 quake3)