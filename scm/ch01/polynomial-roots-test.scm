(load "../common/testing.scm")
(load "polynomial-roots.scm")

(test "quadratic-roots"
      (lambda ()
        ;; x^2 - x - 2 = 0 -> (x + 1)(x - 2) = 0 -> x = -1 or x = 2
        (assert-eq (quadratic-roots 1 -1 -2) '(2.0 -1.0))
        ;; x^2 - 4x + 4 = 0 -> (x - 2)^2 = 0 -> x = 2
        (assert-eq (quadratic-roots 1 -4 4) '(2.0 2.0))))

(test "depressed-cubic-root"
      (lambda ()
        ;; x^3 - 2x - 3 = 0
        ;; -> x_1 = cbrt{3/2 + sqrt(211/108)} + cbrt{3/2 - sqrt(211/108)}
        ;; -> x_1 ≈ 1.8932891963 or x_2|x_3 ≈ -0.9466445982 +|- 0.5636143500i
        (assert-eq (depressed-cubic-root 1 -2 -3) 1.8932891963044978)))

(test "cubic-root"
      (lambda ()
        ;; x^3 - 2x - 3 = 0 (see depressed-cubic-root test)
        (assert-eq (cubic-root 1 0 -2 -3) 1.8932891963044978)))
