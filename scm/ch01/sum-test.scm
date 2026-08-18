(load "../common/testing.scm")
(load "sum.scm")

(test "sum-integers"
      (lambda ()
        (assert-eq (sum-integers 2 4) 9)
        (assert-eq (sum-integers0 2 4) 9)))

(test "sum-cubes"
      (lambda ()
        (assert-eq (sum-cubes 2 4) 99)
        (assert-eq (sum-cubes0 2 4) 99)))

(test "pi-sum"
      (lambda ()
        (assert-eq (* (pi-sum 1 1000) 8) 3.139592655589783)
        (assert-eq (* (pi-sum0 1 1000) 8) 3.139592655589783)))

(test "integral"
      (lambda ()
        (assert-eq (integral cube 0 1 0.01) 0.24998750000000042)
        (assert-eq (integral cube 0 1 0.001) 0.249999875000001)))
