(load "../common/testing.scm")
(load "sum.scm")

(test "sum-integers"
      (lambda ()
        (assert-eq (sum-integers0 1 4) 10)
        (assert-eq (sum-integers1 1 4) 10)
        (assert-eq (sum-integers2 1 4) 10)))

(test "sum-squares"
      (lambda ()
        (assert-eq (sum-squares0 1 4) 30)
        (assert-eq (sum-squares1 1 4) 30)
        (assert-eq (sum-squares2 1 4) 30)))

(test "sum-cubes"
      (lambda ()
        (assert-eq (sum-cubes0 1 4) 100)
        (assert-eq (sum-cubes1 1 4) 100)
        (assert-eq (sum-cubes2 1 4) 100)))

(test "pi-over-eight"
      (lambda ()
        (assert-eq (* (pi-over-eight0 1000) 8) 3.141092653621043)
        (assert-eq (* (pi-over-eight1 1000) 8) 3.141092653621043)
        (assert-eq (* (pi-over-eight2 1000) 8) 3.141092653621038)))

(test "integral"
      (lambda ()
        (assert-eq (integral1 cube 0 1 100) 0.24998750000000042)
        (assert-eq (integral1 cube 0 1 1000) 0.249999875000001)
        (assert-eq (integral2 cube 0 1 100) 0.24998750000000042)
        (assert-eq (integral2 cube 0 1 1000) 0.24999987500000073)))

(test "simpson-integral"
      (lambda ()
        (assert-eq (simpson-integral1 cube 0 1 100) 0.25000000000000044)
        (assert-eq (simpson-integral1 cube 0 1 1000) 0.25000000000000083)
        (assert-eq (simpson-integral2 cube 0 1 100) 0.25000000000000044)
        (assert-eq (simpson-integral2 cube 0 1 1000) 0.2500000000000005)))
