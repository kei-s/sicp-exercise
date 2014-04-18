#lang planet neil/sicp
(define (square a) (* a a))
(define (ex13 a b c) 
  (cond ((and (< a b) (< a c)) (+ (square b) (square c)))
        ((and (< b a) (< b c)) (+ (square a) (square c)))
        ((and (< c a) (< c b)) (+ (square a) (square b)))
        )
  )
(ex13 3 2 1)
