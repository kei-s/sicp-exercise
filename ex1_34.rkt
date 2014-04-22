#lang planet neil/sicp
(define (f g) (g 2))
;(f (lambda (z) (* z (+ z 1))))
(f f)
; (f 2)
; (2 2) -> エラー
