(load "../common/error.scm")
(load "../common/math.scm")

;; Half-Interval Method (Bisection Method)
;;
;;   This is a method for finding a root of f(x) = 0 when f is a continuous function.
;;   The method is based on the fact that if there are two points a and b such that f(a) < 0 < f(b),
;;   then there is at least one root of f between a and b.
;;
;;   Order of Growth
;;
;;     time complexity:  Θ(log2{(b - a) / tolerance})
;;     space complexity: Θ(1)
;;
(define (half-interval-method f a b)
  (define tolerance 0.001)
  (define (close-enough? x y)
    (< (abs_ (- x y)) tolerance))
  (define (search f neg-point pos-point)
    (let ((midpoint (average neg-point pos-point)))
      (if (close-enough? neg-point pos-point)
          midpoint
          (let ((test-value (f midpoint)))
            (cond ((positive?_ test-value)
                   (search f neg-point midpoint))
                  ((negative?_ test-value)
                   (search f midpoint pos-point))
                  (else midpoint))))))
  (let ((a-value (f a))
        (b-value (f b)))
    (cond ((and (negative?_ a-value) (positive?_ b-value))
           (search f a b))
          ((and (negative?_ b-value) (positive?_ a-value))
           (search f b a))
          (else
           (error "function values must have opposite signs:" a b '=> a-value b-value)))))
