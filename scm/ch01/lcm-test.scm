(load "../common/testing.scm")
(load "lcm.scm")

(test "lcm_"
      (lambda ()
        (assert-eq (lcm_ 0 0) 0) ; In traditional mathematics, LCM(0, 0) is not defined.
        (assert-eq (lcm_ 9 0) 0) ; In traditional mathematics, LCM(9, 0) is not defined.
        (assert-eq (lcm_ 0 9) 0) ; In traditional mathematics, LCM(0, 9) is not defined.
        (assert-eq (lcm_ 1 1) 1)
        (assert-eq (lcm_ 9 1) 9)
        (assert-eq (lcm_ 1 9) 9)
        (assert-eq (lcm_ 206 40) 4120)
        (assert-eq (lcm_ 40 206) 4120)))
