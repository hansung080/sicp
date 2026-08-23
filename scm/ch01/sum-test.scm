(load "../common/testing.scm")
(load "sum.scm")

(test "sum-integers"
      (lambda ()
        (assert-eq (sum-integers0 1 4) 10)
        (assert-eq (sum-integers1 1 4) 10)
        (assert-eq (sum-integers2 1 4) 10)))

(test "sum-cubes"
      (lambda ()
        (assert-eq (sum-cubes0 1 4) 100)
        (assert-eq (sum-cubes1 1 4) 100)
        (assert-eq (sum-cubes2 1 4) 100)))

(test "pi-sum"
      (lambda ()
        (assert-eq (* (pi-sum0 1 1000) 8) 3.139592655589783)
        (assert-eq (* (pi-sum1 1 1000) 8) 3.139592655589783)
        (assert-eq (* (pi-sum2 1 1000) 8) 3.139592655589782)))

(test "integral"
      (lambda ()
        (assert-eq (integral1 cube 0 1 0.01) 0.24998750000000042)
        (assert-eq (integral1 cube 0 1 0.001) 0.249999875000001)
        (assert-eq (integral2 cube 0 1 0.01) 0.24998750000000042)
        (assert-eq (integral2 cube 0 1 0.001) 0.24999987500000073)))

(test "simpson-integral"
      (lambda ()
        (assert-eq (simpson-integral1 cube 0 1 100.0) 0.25000000000000044)
        (assert-eq (simpson-integral1 cube 0 1 1000.0) 0.25000000000000083)
        (assert-eq (simpson-integral2 cube 0 1 100.0) 0.25000000000000044)
        (assert-eq (simpson-integral2 cube 0 1 1000.0) 0.2500000000000005)))
