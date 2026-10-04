(load "../common/math.scm")

;; Fixed Point of Function
;;
;;   A root x of the equation f(x) = x is called a fixed point of the function f.
;;   In other words, if we give f an initial guess and repeatedly apply f as shown below,
;;   the value that remains unchanged under f is called a fixed point of f.
;;
;;   f(x_1) = x_2  (x_1 is the initial guess)
;;   f(x_2) = x_3
;;   f(x_3) = x_4
;;   ...
;;   f(x_n) = x_(n+1)  (x_n = x_(n+1); x_n is a fixed point of f)
;;
(define (fixed-point f initial-guess)
  (define tolerance 0.00001)
  (define (close-enough? x y)
    (< (abs_ (- x y)) tolerance))
  (define (try guess)
    (let ((next-guess (f guess)))
      (if (close-enough? guess next-guess)
          guess
          (try next-guess))))
  (try initial-guess))
