#lang planet neil/sicp
(define (double f)
  (lambda (x) (f (f x))))
(((double (double double)) inc) 5)
