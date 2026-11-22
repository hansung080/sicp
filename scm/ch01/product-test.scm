(load "../common/testing.scm")
(load "product.scm")

(test "pi-over-four"
      (lambda ()
        (assert-eq (* (pi-over-four0 1000) 4) 3.1423781499034225)
        (assert-eq (* (pi-over-four1 1000) 4) 3.1423781499034225)
        (assert-eq (* (pi-over-four2 1000) 4) 3.1423781499034176)
        (assert-eq (* (pi-over-four3 1000) 4) 3.1423781499034096)
        (assert-eq (* (pi-over-four4 1000) 4) 3.1423781499034096)))
