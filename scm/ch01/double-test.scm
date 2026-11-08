(load "../common/math.scm")
(load "../common/testing.scm")
(load "double.scm")

(test "double"
      (lambda ()
        (assert-eq ((double inc) 5) 7)
        (assert-eq (((double (double double)) inc) 5) 21)
        (assert-eq ((double (double (double (double inc)))) 5) 21)))
