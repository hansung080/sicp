(load "../common/testing.scm")
(load "product.scm")

(test "pi-over-four"
      (lambda ()
        (assert-eq (* (pi-over-four0 2 1000) 4) 3.1431607055322752)
        (assert-eq (* (pi-over-four1 2 1000) 4) 3.1431607055322752)
        (assert-eq (* (pi-over-four2 2 1000) 4) 3.1431607055322712)
        (assert-eq (* (pi-over-four3 2 1000) 4) 3.1431607055322663)
        (assert-eq (* (pi-over-four4 2 1000) 4) 3.1431607055322663)))
