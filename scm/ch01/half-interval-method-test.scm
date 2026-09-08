(load "../common/testing.scm")
(load "half-interval-method.scm")
(load "polynomial-roots.scm")
(load "sin.scm")

(test "half-interval-method"
      (lambda ()
        ;; sin(x) = 0 -> x = nπ (n ∈ Z)
        (assert-eq (half-interval-method sin_ 2.0 4.0) 3.14111328125)
        ;; x^2 - x - 2 = 0 -> (x + 1)(x - 2) = 0 -> x = -1 or x = 2
        (assert-eq (quadratic-roots 1 -1 -2) '(2.0 -1.0))
        (assert-eq (half-interval-method (lambda (x) (- (* x x) x 2)) 1.0 5.0) 2.0)
        (assert-eq (half-interval-method (lambda (x) (- (* x x) x 2)) 0.0 10.0) 1.99981689453125)
        ;; x^2 - 4x + 4 = 0 -> (x - 2)^2 = 0 -> x = 2
        (assert-eq (quadratic-roots 1 -4 4) '(2.0 2.0))
        ;; `half-interval-method` does not work because for all x, (x - 2)^2 >= 0.
        ;; error: function values must have opposite signs: 1.0 3.0 => 1.0 1.0
        ;; (assert-eq (half-interval-method (lambda (x) (+ (- (* x x) (* 4 x)) 4)) 1.0 3.0) 2.0)
        ;; x^3 - 2x - 3 = 0
        ;; -> x_0 = cbrt{3/2 + sqrt(211/108)} + cbrt{3/2 - sqrt(211/108)}
        ;; -> x_0 ≈ 1.8932891963 or x_1|x_2 ≈ -0.9466445982 +|- 0.5636143500i
        (assert-eq (depressed-cubic-root 1 -2 -3) 1.8932891963044978)
        (assert-eq (half-interval-method (lambda (x) (- (* x x x) (* 2 x) 3)) 1.0 2.0) 1.89306640625)))
