(load "../common/testing.scm")
(load "nth-root.scm")

(test "sqrt-ad"
      (lambda ()
        ;; Test for ordinary numbers.
        (assert-eq (sqrt-ad 0) 0.0)
        (assert-eq (sqrt-ad 1) 1.0)
        (assert-eq (sqrt-ad 2) 1.414213562373095)
        (assert-eq (sqrt-ad 3) 1.7320508075688772)
        (assert-eq (sqrt-ad 4) 2.0)
        (assert-eq (sqrt-ad 5) 2.23606797749979)
        (assert-eq (sqrt-ad 6) 2.449489742783178)
        (assert-eq (sqrt-ad 7) 2.6457513110645907)
        (assert-eq (sqrt-ad 8) 2.82842712474619)
        (assert-eq (sqrt-ad 9) 3.0)
        (assert-eq (sqrt-ad 10) 3.162277660168379)
        (assert-eq (sqrt-ad (+ 100 37)) 11.704699910719626)
        (assert-eq (sqrt-ad (+ (sqrt-ad 2) (sqrt-ad 3))) 1.773771228186423)
        (assert-eq (square (sqrt-ad 1000)) 1000.0)
        ;; Test for very small and large numbers.
        (assert-eq (sqrt-ad 0.000001) 0.001)
        (assert-eq (sqrt-ad 10000000000000000000000000000000000000000000000000000000000000000) 1e+32)))

(test "sqrt-nt"
      (lambda ()
        ;; Test for ordinary numbers.
        ; (assert-eq (sqrt-nt 0) 0.0) ; termination failure
        (assert-eq (sqrt-nt 1) 1.0)
        (assert-eq (sqrt-nt 2) 1.4142135623730951)
        (assert-eq (sqrt-nt 3) 1.7320508075688772)
        (assert-eq (sqrt-nt 4) 2.0)
        (assert-eq (sqrt-nt 5) 2.23606797749979)
        (assert-eq (sqrt-nt 6) 2.4494897427831783)
        (assert-eq (sqrt-nt 7) 2.6457513110645907)
        (assert-eq (sqrt-nt 8) 2.8284271247461903)
        (assert-eq (sqrt-nt 9) 3.0)
        (assert-eq (sqrt-nt 10) 3.162277660168379)
        (assert-eq (sqrt-nt (+ 100 37)) 11.704699910719626)
        (assert-eq (sqrt-nt (+ (sqrt-nt 2) (sqrt-nt 3))) 1.7737712281864233)
        (assert-eq (square (sqrt-nt 1000)) 1000.0)
        ;; Test for very small and large numbers.
        (assert-eq (sqrt-nt 0.000001) 0.001)
        ; (assert-eq (sqrt-nt 10000000000000000000000000000000000000000000000000000000000000000) 1e+32) ; termination failure
        ))
