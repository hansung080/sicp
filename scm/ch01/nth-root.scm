(load "../ch01/newton-method.scm")

(define (average-damp f)
  (lambda (x) (average (f x) x)))

(define (weighted-average x y)
  (/ (+ x (* 2 y)) 3))

(define (weighted-average-damp f)
  (lambda (x) (weighted-average (f x) x)))

(define (fixed-point-of-transform f transform guess)
  (fixed-point-with (transform f) guess close-exact?))

(define (sqrt1 x)
  (fixed-point-of-transform (lambda (y) (/ x y))
                            average-damp
                            1.0))

(define (sqrt2 x)
  (fixed-point-of-transform (lambda (y) (- x (square y)))
                            newton-transform
                            1.0))

;; In general, the Newton transform converges to a fixed point faster than average damping.
(define sqrt_ sqrt2)

(define (cbrt1 x)
  (fixed-point-of-transform (lambda (y) (/ x (square y)))
                            weighted-average-damp
                            1.0))

(define (cbrt2 x)
  (fixed-point-of-transform (lambda (y) (- x (cube y)))
                            newton-transform
                            1.0))

(define cbrt cbrt2)
