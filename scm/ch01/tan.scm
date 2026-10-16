(load "../ch01/cont-frac.scm")

;; Tangent Using Continued Fraction (introduced by J. H. Lambert)
;;
;;   tan(x) = x / (1 - x^2 / (3 - x^2 / (5 - ...)))  (x is an angle in radians)
;;
(define (tan_ x)
  (tan-with x 8))

(define (tan-with x k)
  (cont-frac (lambda (i) (if (= i 1) x (* x x -1)))
             (lambda (i) (- (* i 2.0) 1))
             k))
