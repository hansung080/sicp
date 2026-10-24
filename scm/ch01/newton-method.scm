(load "../ch01/fixed-point.scm")

;; Newton's method
;;
;;   This is a method for finding a root of the equation f(x) = 0 by finding a fixed point of the function g
;;   using the Newton transform.
;;
;;   Newton transform:
;;     g(x) = x - f(x) / f'(x)
;;
(define (newton-transform f)
  (lambda (x) (- x (/ (f x)
                      ((deriv f) x)))))

(define (newton-method-with f guess close-enough?)
  (fixed-point-with (newton-transform f) guess close-enough?))

(define (newton-method f guess)
  (newton-method-with f guess close-abs-err?))
