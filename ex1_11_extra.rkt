#lang planet neil/sicp
; http://blog.livedoor.jp/dankogai/archives/50459008.html
; http://d.hatena.ne.jp/higepon/20060416/1145173653

(define (fib n)
  (cond
   ((= n 1) 1)
   ((= n 2) 1)
   (else (+ (fib (- n 1))(fib (- n 2))))))
; fib(1), 1
; fib(2), 1
; fib(3), 2
; fib(4), 3
; fib(5), 5
(define (fibb n)
  (define (fib-iter a b count)
    (if (= count 1) b
        (fib-iter (+ a b) a (- count 1))
    ))
  (fib-iter 1 1 n)
  )
 
(define n 2)
(fib n)
(fibb n)