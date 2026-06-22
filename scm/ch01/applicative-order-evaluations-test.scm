(define (p) (p))

(define (test x y)
  (if (= x 0)
      0
      y))

; With applicative-order evaluation (evaluate -> apply), as in Scheme, this code gets stuck in an infinite loop.
; With normal-order evaluation (apply -> evaluate), it returns 0.
; (test 0 (p))
