;; Double
;;
;;   double(f) = f(f(x))
;;
(define (double f)
  (lambda (x) (f (f x))))
