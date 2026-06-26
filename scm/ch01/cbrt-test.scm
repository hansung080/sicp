(load "../common/testing.scm")
(load "cbrt.scm")

(test "cbrt"
      (lambda ()
        ;; Test for normal numbers.
        (assert-eq (cbrt 1)
                   1.0)
        (assert-eq (cbrt 2)
                   1.2599210498948732)
        (assert-eq (cbrt 8)
                   2.0)
        (assert-eq (cbrt (+ 100 37))
                   5.1551367354757724)
        (assert-eq (cbrt (+ (cbrt 2) (cbrt 3)))
                   1.392849702964866)
        (assert-eq (cube (cbrt 1000))
                   1000.0)
        ;; Test for very small and very large numbers.
        (assert-eq (cbrt 0.000000001)
                   0.001)
        (assert-eq (cbrt 1000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000)
                   1e+32)))
