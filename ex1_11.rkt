#lang planet neil/sicp
(define (f n)
  (cond ((< n 3) n)
        (else (+ (f (- n 1))
                 (* 2 (f (- n 2)))
                 (* 3 (f (- n 3)))
                 ))))
; f(2), 2
; f(3), (f(2) + 2*f(1) + 3*f(0))
; f(4), (f(3) + 2*f(2) + 3*f(1))
; f(5), (f(4) + 2*f(3) + 3*f(2))
; f(6), (f(5) + 2*f(4) + 3*f(3))
;
; a <- a + 2*b + 3*c
; b <- a
; c <- b

(define (g n)
  (define (f-iter a b c count)
    (cond ((= count 0) c)
          ((= count 1) b)
          ((= count 2) a)
          (else (f-iter (+ a (* 2 b) (* 3 c)) a b (- count 1)))
        ))
  (f-iter 2 1 0 n))

(define n 3)
(f n)
(g n)