#lang planet neil/sicp
(define (cont-frac n d k)
  (define (iter i)
    (if (= i k)
        (/ (n i) (d i))
        (/ (n i) (+ (d i) (iter (+ i 1))))))
  (iter 1)
  )
(define (cont-frac2 n d k)
  (define (iter i result)
    (if (= i k)
        result
        (iter (+ i 1) (/ (n i) (+ (d i) result)))))
  (iter 1 0)
  )
(define k 20)

(+ 2 (cont-frac
 (lambda (i) 1.0)
 (lambda (i) (if (= (remainder i 3) 2)
                 (- i (/ (- i 2) 3))
                 1.0
                 ))
 k)
)