(load "../common/testing.scm")
(load "polynomial-roots.scm")

(test "quadratic-roots"
      (lambda ()
        ;; x^2 - x - 2 = 0 -> (x + 1)(x - 2) = 0 -> x = -1 or x = 2
        (assert-eq (quadratic-roots 1 -1 -2) '(2.0 -1.0))
        (assert-eq (quadratic-root-between 1 -1 -2 -5.0 0.0) -1.00006103515625)
        (assert-eq (quadratic-root-between 1 -1 -2 0.0 5.0) 1.99981689453125)
        (assert-eq (quadratic-root-near 1 -1 -2 0.0) -1.0)
        (assert-eq (quadratic-root-near 1 -1 -2 1.0) 2.0)
        ;; x^2 - 4x + 4 = 0 -> (x - 2)^2 = 0 -> x = 2 (double root)
        (assert-eq (quadratic-roots 1 -4 4) '(2.0 2.0))
        ; (assert-eq (quadratic-root-between 1 -4 4 1.0 3.0) 2.0) ; error: function values must have opposite signs: 1.0 3.0 => 1.0 1.0
        (assert-eq (quadratic-root-near 1 -4 4 1.0) 2.0000000210151514)))

(test "depressed-cubic-root"
      (lambda ()
        ;; x^3 - 2x - 3 = 0 -> x_1 = cbrt{3/2 + sqrt(211/108)} + cbrt{3/2 - sqrt(211/108)} ≈ 1.8932891963
        (assert-eq (depressed-cubic-root 1 -2 -3) 1.8932891963044978)))

(test "cubic-root"
      (lambda ()
        ;; x^3 - 2x - 3 = 0 -> x_1 = cbrt{3/2 + sqrt(211/108)} + cbrt{3/2 - sqrt(211/108)} ≈ 1.8932891963
        (assert-eq (cubic-root 1 0 -2 -3) 1.8932891963044978)
        (assert-eq (cubic-root-between 1 0 -2 -3 1.0 2.0) 1.89306640625)
        (assert-eq (cubic-root-near 1 0 -2 -3 1.0) 1.8932891963044978)
        ;; 2x^3 + 5x^2 + 5x + 3 = 0 -> (2x + 3)(x^2 + x + 1) = 0 -> x_1 = -3/2
        (assert-eq (cubic-root 2 5 5 3) -1.4999999999999998)
        (assert-eq (cubic-root-between 2 5 5 3 -5.0 0.0) -1.49993896484375)
        (assert-eq (cubic-root-near 2 5 5 3 1.0) -1.5)))
