(load "../common/testing.scm")
(load "factorial.scm")

(test "factorial1"
      (lambda ()
        (assert-eq (factorial1 0) 1)
        (assert-eq (factorial1 1) 1)
        (assert-eq (factorial1 2) 2)
        (assert-eq (factorial1 3) 6)
        (assert-eq (factorial1 4) 24)
        (assert-eq (factorial1 5) 120)))

(test "factorial2"
      (lambda ()
        (assert-eq (factorial2 0) 1)
        (assert-eq (factorial2 1) 1)
        (assert-eq (factorial2 2) 2)
        (assert-eq (factorial2 3) 6)
        (assert-eq (factorial2 4) 24)
        (assert-eq (factorial2 5) 120)))
