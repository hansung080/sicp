(load "../common/testing.scm")
(load "sqrt.scm")

(test "sqrt1"
      (lambda ()
        ;; Test for normal numbers.
        (assert-eq (sqrt1 1)
                   1.0)
        (assert-eq (sqrt1 2)
                   1.4142156862745097)
        (assert-eq (sqrt1 9)
                   3.00009155413138)
        (assert-eq (sqrt1 (+ 100 37))
                   11.705105833379696) ; good-enough1?: 11.704699917758145
        (assert-eq (sqrt1 (+ (sqrt1 2) (sqrt1 3)))
                   1.7739279023207892)
        (assert-eq (square (sqrt1 1000))
                   1000.000369924366)
        ;; Test for very small and very large numbers.
        (assert-eq (sqrt1 0.000001)
                   0.0010000001533016628) ; good-enough1?: 0.031260655525445276
        (assert-eq (sqrt1 10000000000000000000000000000000000000000000000000000000000000000)
                   1.0000046085713034e+32))) ; good-enough1?: sqrt1 does not terminate

(test "sqrt2"
      (lambda ()
        ;; Test for normal numbers.
        (assert-eq (sqrt2 1)
                   1.0)
        (assert-eq (sqrt2 2)
                   1.414213562373095) ; good-enough1?: 1.4142135623746899, good-enough2?: 1.4142135623746899
        (assert-eq (sqrt2 9)
                   3.0)
        (assert-eq (sqrt2 (+ 100 37))
                   11.704699910719626)
        (assert-eq (sqrt2 (+ (sqrt2 2) (sqrt2 3)))
                   1.773771228186423) ; good-enough1?: 1.7737712281868727, good-enough2?: 1.7737712281868727
        (assert-eq (square (sqrt2 1000))
                   1000.0) ; good-enough1?: 1000.0000000000343, good-enough2?: 1000.0000000000343
        ;; Test for very small and very large numbers.
        (assert-eq (sqrt2 0.000001)
                   0.001) ; good-enough1?: 0.0010000000000000117, good-enough2?: 0.0010000000000000117
        (assert-eq (sqrt2 10000000000000000000000000000000000000000000000000000000000000000)
                   1e+32)))
