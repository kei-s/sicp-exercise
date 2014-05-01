#lang planet neil/sicp
(define (cont-frac n d k)
  (define (iter i)
    (if (= i k)
        (/ (n i) (d i))
        (/ (n i) (+ (d i) (iter (+ i 1))))))
  (iter 1)
  )
(define (tan-cf x k)
  (cont-frac
   (lambda (i) (if (= i 1)
                   x
                   (- (* x x)))
     )
   (lambda (i) (- (* i 2) 1.0))
   k
   )
  )
(tan-cf 45 100)