(load "../common/testing.scm")
(load "sqrt.scm")

(test "sqrt"
      (lambda ()
        ;; Test for ordinary numbers.
        (assert-eq (sqrt 0) 0)
        (assert-eq (sqrt 1) 1)
        (assert-eq (sqrt 2) 1.4142135623730951)
        (assert-eq (sqrt 3) 1.7320508075688772)
        (assert-eq (sqrt 4) 2)
        (assert-eq (sqrt 5) 2.23606797749979)
        (assert-eq (sqrt 6) 2.449489742783178)
        (assert-eq (sqrt 7) 2.6457513110645907)
        (assert-eq (sqrt 8) 2.8284271247461903)
        (assert-eq (sqrt 9) 3)
        (assert-eq (sqrt 10) 3.1622776601683795)
        (assert-eq (sqrt (+ 100 37)) 11.704699910719626)
        (assert-eq (sqrt (+ (sqrt 2) (sqrt 3))) 1.7737712281864233)
        (assert-eq (square (sqrt 1000)) 1000.0)
        ;; Test for very small and large numbers.
        (assert-eq (sqrt 0.000001) 0.001)
        (assert-eq (sqrt 10000000000000000000000000000000000000000000000000000000000000000) 100000000000000000000000000000000)))

(test "sqrt1"
      (lambda ()
        ;; Test for ordinary numbers.
        (assert-eq (sqrt1 0) 1.1113793747425387e-162)
        (assert-eq (sqrt1 1) 1.0)
        ; (assert-eq (sqrt1 2) 1.4142135623730951)  ; termination failure
        ; (assert-eq (sqrt1 3) 1.7320508075688772)  ; termination failure
        (assert-eq (sqrt1 4) 2.0)
        ; (assert-eq (sqrt1 5) 2.23606797749979)    ; termination failure
        ; (assert-eq (sqrt1 6) 2.449489742783178)   ; termination failure
        ; (assert-eq (sqrt1 7) 2.6457513110645907)  ; termination failure
        ; (assert-eq (sqrt1 8) 2.8284271247461903)  ; termination failure
        (assert-eq (sqrt1 9) 3.0)
        ; (assert-eq (sqrt1 10) 3.1622776601683795) ; termination failure
        (assert-eq (sqrt1 (+ 100 37)) 11.704699910719626)
        ; (assert-eq (sqrt1 (+ (sqrt1 2) (sqrt1 3))) 1.7737712281864233) ; termination failure
        (assert-eq (square (sqrt1 1000)) 1000.0)
        ;; Test for very small and large numbers.
        (assert-eq (sqrt1 0.000001) 0.001)
        ; (assert-eq (sqrt1 10000000000000000000000000000000000000000000000000000000000000000) 100000000000000000000000000000000) ; termination failure
        ))

(test "sqrt2"
      (lambda ()
        ;; Test for ordinary numbers.
        (assert-eq (sqrt2 0) 0.03125)
        (assert-eq (sqrt2 1) 1.0)
        (assert-eq (sqrt2 2) 1.4142156862745097)
        (assert-eq (sqrt2 3) 1.7321428571428572)
        (assert-eq (sqrt2 4) 2.0000000929222947)
        (assert-eq (sqrt2 5) 2.2360688956433634)
        (assert-eq (sqrt2 6) 2.4494943716069653)
        (assert-eq (sqrt2 7) 2.64576704419029)
        (assert-eq (sqrt2 8) 2.8284685718801468)
        (assert-eq (sqrt2 9) 3.00009155413138)
        (assert-eq (sqrt2 10) 3.162277665175675)
        (assert-eq (sqrt2 (+ 100 37)) 11.704699917758145)
        (assert-eq (sqrt2 (+ (sqrt2 2) (sqrt2 3))) 1.7739279023207892)
        (assert-eq (square (sqrt2 1000)) 1000.000369924366)
        ;; Test for very small and large numbers.
        (assert-eq (sqrt2 0.000001) 0.031260655525445276) ; accuracy failure
        ; (assert-eq (sqrt2 10000000000000000000000000000000000000000000000000000000000000000) 100000000000000000000000000000000) ; termination failure
        ))

(test "sqrt3"
      (lambda ()
        ;; Test for ordinary numbers.
        ; (assert-eq (sqrt3 0) 0) ; division by zero error
        (assert-eq (sqrt3 1) 1.0)
        (assert-eq (sqrt3 2) 1.4142156862745097)
        (assert-eq (sqrt3 3) 1.7321428571428572)
        (assert-eq (sqrt3 4) 2.000609756097561)
        (assert-eq (sqrt3 5) 2.2360688956433634)
        (assert-eq (sqrt3 6) 2.4494943716069653)
        (assert-eq (sqrt3 7) 2.64576704419029)
        (assert-eq (sqrt3 8) 2.8284685718801468)
        (assert-eq (sqrt3 9) 3.00009155413138)
        (assert-eq (sqrt3 10) 3.16245562280389)
        (assert-eq (sqrt3 (+ 100 37)) 11.705105833379696)
        (assert-eq (sqrt3 (+ (sqrt3 2) (sqrt3 3))) 1.7739279023207892)
        (assert-eq (square (sqrt3 1000)) 1000.000369924366)
        ;; Test for very small and large numbers.
        (assert-eq (sqrt3 0.000001) 0.0010000001533016628)
        (assert-eq (sqrt3 10000000000000000000000000000000000000000000000000000000000000000) 1.0000046085713034e+32)))

(test "sqrt4"
      (lambda ()
        ;; Test for ordinary numbers.
        (assert-eq (sqrt4 0) 0.0)
        (assert-eq (sqrt4 1) 1.0)
        (assert-eq (sqrt4 2) 1.414213562373095)
        (assert-eq (sqrt4 3) 1.7320508075688772)
        (assert-eq (sqrt4 4) 2.0)
        (assert-eq (sqrt4 5) 2.23606797749979)
        (assert-eq (sqrt4 6) 2.449489742783178)
        (assert-eq (sqrt4 7) 2.6457513110645907)
        (assert-eq (sqrt4 8) 2.82842712474619)
        (assert-eq (sqrt4 9) 3.0)
        (assert-eq (sqrt4 10) 3.162277660168379)
        (assert-eq (sqrt4 (+ 100 37)) 11.704699910719626)
        (assert-eq (sqrt4 (+ (sqrt4 2) (sqrt4 3))) 1.773771228186423)
        (assert-eq (square (sqrt4 1000)) 1000.0)
        ;; Test for very small and large numbers.
        (assert-eq (sqrt4 0.000001) 0.001)
        (assert-eq (sqrt4 10000000000000000000000000000000000000000000000000000000000000000) 1e+32)))

(test "sqrt5"
      (lambda ()
        ;; Test for ordinary numbers.
        (assert-eq (sqrt5 0) 7.275957614183426e-12)
        (assert-eq (sqrt5 1) 1.0)
        (assert-eq (sqrt5 2) 1.414213562373095)
        (assert-eq (sqrt5 3) 1.7320508075688772)
        (assert-eq (sqrt5 4) 2.0)
        (assert-eq (sqrt5 5) 2.23606797749979)
        (assert-eq (sqrt5 6) 2.449489742783178)
        (assert-eq (sqrt5 7) 2.6457513110645907)
        (assert-eq (sqrt5 8) 2.82842712474619)
        (assert-eq (sqrt5 9) 3.0)
        (assert-eq (sqrt5 10) 3.162277660168379)
        (assert-eq (sqrt5 (+ 100 37)) 11.704699910719626)
        (assert-eq (sqrt5 (+ (sqrt5 2) (sqrt5 3))) 1.773771228186423)
        (assert-eq (square (sqrt5 1000)) 1000.0)
        ;; Test for very small and large numbers.
        (assert-eq (sqrt5 0.000001) 0.001)
        (assert-eq (sqrt5 10000000000000000000000000000000000000000000000000000000000000000) 1e+32)))

(test "sqrt6"
      (lambda ()
        ;; Test for ordinary numbers.
        ; (assert-eq (sqrt6 0) 0) ; termination failure
        (assert-eq (sqrt6 1) 1.0)
        (assert-eq (sqrt6 2) 1.414213562373095)
        (assert-eq (sqrt6 3) 1.7320508075688772)
        (assert-eq (sqrt6 4) 2.0)
        (assert-eq (sqrt6 5) 2.23606797749979)
        (assert-eq (sqrt6 6) 2.449489742783178)
        (assert-eq (sqrt6 7) 2.6457513110645907)
        (assert-eq (sqrt6 8) 2.82842712474619)
        (assert-eq (sqrt6 9) 3.0)
        (assert-eq (sqrt6 10) 3.162277660168379)
        (assert-eq (sqrt6 (+ 100 37)) 11.704699910719626)
        (assert-eq (sqrt6 (+ (sqrt6 2) (sqrt6 3))) 1.773771228186423)
        (assert-eq (square (sqrt6 1000)) 1000.0)
        ;; Test for very small and large numbers.
        (assert-eq (sqrt6 0.000001) 0.001)
        (assert-eq (sqrt6 10000000000000000000000000000000000000000000000000000000000000000) 1e+32)))

(test "sqrt7"
      (lambda ()
        ;; Test for ordinary numbers.
        (assert-eq (sqrt7 0) 0.0)
        (assert-eq (sqrt7 1) 1.0)
        (assert-eq (sqrt7 2) 1.414213562373095)
        (assert-eq (sqrt7 3) 1.7320508075688772)
        (assert-eq (sqrt7 4) 2.0)
        (assert-eq (sqrt7 5) 2.23606797749979)
        (assert-eq (sqrt7 6) 2.449489742783178)
        (assert-eq (sqrt7 7) 2.6457513110645907)
        (assert-eq (sqrt7 8) 2.82842712474619)
        (assert-eq (sqrt7 9) 3.0)
        (assert-eq (sqrt7 10) 3.162277660168379)
        (assert-eq (sqrt7 (+ 100 37)) 11.704699910719626)
        (assert-eq (sqrt7 (+ (sqrt7 2) (sqrt7 3))) 1.773771228186423)
        (assert-eq (square (sqrt7 1000)) 1000.0)
        ;; Test for very small and large numbers.
        (assert-eq (sqrt7 0.000001) 0.001)
        (assert-eq (sqrt7 10000000000000000000000000000000000000000000000000000000000000000) 1e+32)))
