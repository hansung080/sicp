(load "../common/testing.scm")
(load "expt.scm")

(test "expt1"
      (lambda ()
        (assert-eq (expt1 2 0) 1)
        (assert-eq (expt1 2 1) 2)
        (assert-eq (expt1 2 2) 4)
        (assert-eq (expt1 2 3) 8)
        (assert-eq (expt1 2 8) 256)
        (assert-eq (expt1 2 11) 2048)))

(test "expt2"
      (lambda ()
        (assert-eq (expt2 2 0) 1)
        (assert-eq (expt2 2 1) 2)
        (assert-eq (expt2 2 2) 4)
        (assert-eq (expt2 2 3) 8)
        (assert-eq (expt2 2 8) 256)
        (assert-eq (expt2 2 11) 2048)))

(test "fast-expt1"
      (lambda ()
        (assert-eq (fast-expt1 2 0) 1)
        (assert-eq (fast-expt1 2 1) 2)
        (assert-eq (fast-expt1 2 2) 4)
        (assert-eq (fast-expt1 2 3) 8)
        (assert-eq (fast-expt1 2 8) 256)
        (assert-eq (fast-expt1 2 11) 2048)))
