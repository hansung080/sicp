;; Compose
;;
;;   compose(f, g)(x) = f(g(x))
;;
(define (compose f g)
  (lambda (x) (f (g x))))
