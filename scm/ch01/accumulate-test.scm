(load "../common/math.scm")
(load "../common/testing.scm")
(load "accumulate.scm")

(test "accumulate1"
      (lambda ()
        (define (sum term a next b)
          (accumulate1 + 0 term a next b))
        (define (sum-integers a b)
          (sum identity a inc b))
        (assert-eq (sum-integers 1 4) 10)

        (define (product term a next b)
          (accumulate1 * 1 term a next b))
        (define (product-integers a b)
          (product identity a inc b))
        (assert-eq (product-integers 1 4) 24)))

(test "accumulate2"
      (lambda ()
        (define (sum term a next b)
          (accumulate2 + 0 term a next b))
        (define (sum-integers a b)
          (sum identity a inc b))
        (assert-eq (sum-integers 1 4) 10)

        (define (product term a next b)
          (accumulate2 * 1 term a next b))
        (define (product-integers a b)
          (product identity a inc b))
        (assert-eq (product-integers 1 4) 24)))
