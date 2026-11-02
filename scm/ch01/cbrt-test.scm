(load "../common/testing.scm")
(load "cbrt.scm")

(define (cbrt0 x)
  (expt x (/ 1 3)))

(test "cbrt0"
      (lambda ()
        ;; Test for ordinary numbers.
        (assert-eq (cbrt0 0) 0)
        (assert-eq (cbrt0 1) 1)
        (assert-eq (cbrt0 2) 1.2599210498948732)
        (assert-eq (cbrt0 3) 1.4422495703074083)
        (assert-eq (cbrt0 4) 1.5874010519681994)
        (assert-eq (cbrt0 5) 1.7099759466766968)
        (assert-eq (cbrt0 6) 1.8171205928321397)
        (assert-eq (cbrt0 7) 1.912931182772389)
        (assert-eq (cbrt0 8) 2.0)
        (assert-eq (cbrt0 9) 2.080083823051904)
        (assert-eq (cbrt0 10) 2.154434690031884)
        (assert-eq (cbrt0 (+ 100 37)) 5.155136735475772)
        (assert-eq (cbrt0 (+ (cbrt0 2) (cbrt0 3))) 1.392849702964866)
        (assert-eq (cube (cbrt0 1000)) 999.9999999999995)
        ;; Test for very small and large numbers.
        (assert-eq (cbrt0 0.000000001) 0.0010000000000000005)
        (assert-eq (cbrt0 1000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000) 9.99999999999996e+31)))

(test "cbrt7"
      (lambda ()
        ;; Test for ordinary numbers.
        (assert-eq (cbrt7 0) 5e-324)
        (assert-eq (cbrt7 1) 1.0)
        (assert-eq (cbrt7 2) 1.2599210498948732)
        (assert-eq (cbrt7 3) 1.4422495703074085)
        (assert-eq (cbrt7 4) 1.5874010519681994)
        (assert-eq (cbrt7 5) 1.709975946676697)
        (assert-eq (cbrt7 6) 1.8171205928321397)
        (assert-eq (cbrt7 7) 1.912931182772389)
        (assert-eq (cbrt7 8) 2.0)
        (assert-eq (cbrt7 9) 2.080083823051904)
        (assert-eq (cbrt7 10) 2.154434690031884)
        (assert-eq (cbrt7 (+ 100 37)) 5.1551367354757724)
        (assert-eq (cbrt7 (+ (cbrt7 2) (cbrt7 3))) 1.392849702964866)
        (assert-eq (cube (cbrt7 1000)) 1000.0)
        ;; Test for very small and large numbers.
        (assert-eq (cbrt7 0.000000001) 0.001)
        (assert-eq (cbrt7 1000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000) 1e+32)))
