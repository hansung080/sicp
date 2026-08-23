(load "../common/testing.scm")
(load "product.scm")

(test "pi-product"
      (lambda ()
        (assert-eq (* (pi-product0 2 1000) 4) 3.1431607055322752)
        (assert-eq (* (pi-product1 2 1000) 4) 3.1431607055322752)
        (assert-eq (* (pi-product2 2 1000) 4) 3.1431607055322712)
        (assert-eq (* (pi-product3 2 1000) 4) 3.1431607055322663)
        (assert-eq (* (pi-product4 2 1000) 4) 3.1431607055322663)))
