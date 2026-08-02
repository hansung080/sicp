(load "../common/testing.scm")
(load "gcd.scm")

(test "slow-gcd"
      (lambda ()
        (assert-eq (slow-gcd 0 0) 0) ; In traditional mathematics, GCD(0, 0) is not defined.
        (assert-eq (slow-gcd 9 0) 9)
        (assert-eq (slow-gcd 0 9) 9)
        (assert-eq (slow-gcd 1 1) 1)
        (assert-eq (slow-gcd 9 1) 1)
        (assert-eq (slow-gcd 1 9) 1)
        (assert-eq (slow-gcd 206 40) 2)
        (assert-eq (slow-gcd 40 206) 2)))

(test "gcd0"
      (lambda ()
        (assert-eq (gcd0 0 0) 0) ; In traditional mathematics, GCD(0, 0) is not defined.
        (assert-eq (gcd0 9 0) 9)
        (assert-eq (gcd0 0 9) 9)
        (assert-eq (gcd0 1 1) 1)
        (assert-eq (gcd0 9 1) 1)
        (assert-eq (gcd0 1 9) 1)
        (assert-eq (gcd0 206 40) 2)
        (assert-eq (gcd0 40 206) 2)))
