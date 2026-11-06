(load "../ch01/newton-method.scm")

(define (average-damp f)
  (lambda (x) (average (f x) x)))

(define (weighted-average x y)
  (/ (+ x (* 2 y)) 3))

(define (weighted-average-damp f)
  (lambda (x) (weighted-average (f x) x)))

(define (fixed-point-of-transform f transform guess)
  (fixed-point (transform f) guess))

(define (sqrt-ad x)
  (fixed-point-of-transform (lambda (y) (/ x y))
                            average-damp
                            1.0))

;; The Newton transform is known to converge to a fixed point faster than average damping, but our test cases show
;; almost no difference in convergence speed. The Newton transform causes a termination failure due to a numerical
;; derivative using finite differences for zero and very large numbers.
(define (sqrt-nt x)
  (fixed-point-of-transform (lambda (y) (- x (square y)))
                            newton-transform
                            1.0))

(define sqrt_ sqrt-ad)

(define (cbrt-ad x)
  (fixed-point-of-transform (lambda (y) (/ x (square y)))
                            weighted-average-damp
                            1.0))

(define (cbrt-nt x)
  (fixed-point-of-transform (lambda (y) (- x (cube y)))
                            newton-transform
                            1.0))

(define cbrt cbrt-ad)
