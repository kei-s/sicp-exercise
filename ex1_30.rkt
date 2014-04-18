#lang planet neil/sicp
(define (orig-sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (orig-sum term (next a) next b))))
(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (+ (term a) result))))
  (iter a 0))
(define (inc n) (+ n 1))
(define (cube x) (* x x x))
(define (sum-cubes a b)
  (sum cube a inc b))
(sum-cubes 1 10)