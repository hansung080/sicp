(load "../common/testing.scm")
(load "tan.scm")

(test "tan_"
      (lambda ()
        (assert-eq (tan_ 0) 0)
        (assert-eq (tan_ 0.5) 0.5463024898437905)
        (assert-eq (tan_ 1) 1.557407724654856)))
