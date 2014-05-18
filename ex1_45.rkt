#lang planet neil/sicp
(define (square x) (* x x))
(define (compose f g)
  (lambda (x) (f (g x))))
(define (repeated f n)
  (if (= n 1)
      f
      (compose f (repeated f (- n 1)))))

(define (average-damp f)
  (define (average a b) (/ (+ a b) 2))
  (lambda (x) (average x (f x))))

(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2) (< (abs (- v1 v2))
                                   tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (n-th-square-test x n c)
  (fixed-point ((repeated average-damp c) (lambda (y) (/ x (expt y (- n 1))))) 1.0))
(n-th-square-test (expt 3 4) 4 2)
(n-th-square-test (expt 3 5) 5 2)
(n-th-square-test (expt 3 9) 9 3) ; 9乗は3回の average-dump をしないと収束しない
(n-th-square-test (expt 3 15) 15 3) ; 15乗は3回の average-dump をしないと収束しない
(n-th-square-test (expt 3 16) 16 4) ; 16乗は4回の average-dump をしないと収束しない

; n乗根には floor(log2 n) 回の average-dump が必要
(define (n-th-square x n)
  (let ((c (floor (/ (log n) (log 2)))))
    (fixed-point ((repeated average-damp c) (lambda (y) (/ x (expt y (- n 1))))) 1.0)))
(n-th-square (expt 3 15) 15)