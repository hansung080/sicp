(load "../common/testing.scm")
(load "newton-method.scm")
(load "sin.scm")

(test "newton-method"
      (lambda ()
        ;; x^2 - x - 2 = 0 -> (x + 1)(x - 2) = 0 -> x = -1 or x = 2
        (assert-eq (newton-method (lambda (x) (- (* x x) x 2)) 1.0) 2.0000000008523924)
        ;; x^2 - 4x + 4 = 0 -> (x - 2)^2 = 0 -> x = 2
        (assert-eq (newton-method (lambda (x) (+ (- (* x x) (* 4 x)) 4)) 1.0) 2.0000005496875035)
        ;; x^3 - 2x - 3 = 0 -> x_1 = cbrt{3/2 + sqrt(211/108)} + cbrt{3/2 - sqrt(211/108)} ≈ 1.8932891963
        (assert-eq (newton-method (lambda (x) (- (* x x x) (* 2 x) 3)) 1.0) 1.8932892122292555)
        ;; 2x^3 + 5x^2 + 5x + 3 = 0 -> (2x + 3)(x^2 + x + 1) = 0 -> x_1 = -3/2
        (assert-eq (newton-method (lambda (x) (+ (* 2 x x x ) (* 5 x x) (* 5 x) 3)) 1.0) -1.5000000603959756)
        ;; sin(x) = 0 -> x = nπ (n ∈ Z)
        (assert-eq (newton-method sin_ 2.0) 3.1408050718229794)))
