#lang planet neil/sicp
(define (square x) (* x x))
(define (compose f g)
  (lambda (x) (f (g x))))
(define (repeated f n)
  (if (= n 1)
      f
      (compose f (repeated f (- n 1)))))

(define dx 0.0001)
(define (smooth f)
  (lambda (x)
    (/ (+ (f (- x dx))
          (f x)
          (f (+ x dx)))
       3)))
((smooth square) 3)

(define (n-fold-smoothed-function f n)
  ((repeated smooth n) f))
((n-fold-smoothed-function square 2) 3)