(load "../common/testing.scm")
(load "half-interval-method.scm")
(load "sin.scm")

(test "half-interval-method"
      (lambda ()
        ;; x^2 - x - 2 = 0 -> (x + 1)(x - 2) = 0 -> x = -1 or x = 2
        (assert-eq (half-interval-method (lambda (x) (- (* x x) x 2)) 0.0 5.0) 1.99981689453125)
        (assert-eq (half-interval-method (lambda (x) (- (* x x) x 2)) 1.0 5.0) 2.0)        
        ;; x^2 - 4x + 4 = 0 -> (x - 2)^2 = 0 -> x = 2
        ;; `half-interval-method` does not work because for all x, (x - 2)^2 >= 0.
        ;; error: function values must have opposite signs: 1.0 3.0 => 1.0 1.0
        ;; (assert-eq (half-interval-method (lambda (x) (+ (- (* x x) (* 4 x)) 4)) 1.0 3.0) 2.0)
        ;; x^3 - 2x - 3 = 0 -> x_1 = cbrt{3/2 + sqrt(211/108)} + cbrt{3/2 - sqrt(211/108)} ≈ 1.8932891963
        (assert-eq (half-interval-method (lambda (x) (- (* x x x) (* 2 x) 3)) 1.0 2.0) 1.89306640625)
        ;; 2x^3 + 5x^2 + 5x + 3 = 0 -> (2x + 3)(x^2 + x + 1) = 0 -> x_1 = -3/2
        (assert-eq (half-interval-method (lambda (x) (+ (* 2 x x x ) (* 5 x x) (* 5 x) 3)) -5.0 0.0) -1.49993896484375)
        ;; sin(x) = 0 -> x = nπ (n ∈ Z)
        (assert-eq (half-interval-method sin_ 2.0 4.0) 3.14111328125)))
