(load "../common/math.scm")
(load "../common/testing.scm")
(load "accumulate.scm")
(load "gcd.scm")
(load "prime.scm")

(test "accumulate1"
      (lambda ()
        (define (sum term a next b)
          (accumulate1 + 0 term a next b))
        (define (sum-integers a b)
          (sum identity a inc b))
        (define (product term a next b)
          (accumulate1 * 1 term a next b))
        (define (product-integers a b)
          (product identity a inc b))

        (assert-eq (sum-integers 1 4) 10)
        (assert-eq (product-integers 1 4) 24)))

(test "accumulate2"
      (lambda ()
        (define (sum term a next b)
          (accumulate2 + 0 term a next b))
        (define (sum-integers a b)
          (sum identity a inc b))
        (define (product term a next b)
          (accumulate2 * 1 term a next b))
        (define (product-integers a b)
          (product identity a inc b))

        (assert-eq (sum-integers 1 4) 10)
        (assert-eq (product-integers 1 4) 24)))

(test "filtered-accumulate1"
      (lambda ()
        (define (sum-evens a b)
          (filtered-accumulate1 even?_ + 0 identity a inc b))
        (define (sum-prime-squares a b)
          (filtered-accumulate1 prime? + 0 square a inc b))
        (define (product-coprimes n)
          (define (coprime? i)
            (= (gcd_ i n) 1))
          (filtered-accumulate1 coprime? * 1 identity 1 inc (- n 1)))

        (assert-eq (sum-evens 1 10) 30)
        (assert-eq (sum-prime-squares 1 10) 87)
        (assert-eq (product-coprimes 10) 189)))

(test "filtered-accumulate2"
      (lambda ()
        (define (sum-evens a b)
          (filtered-accumulate2 even?_ + 0 identity a inc b))
        (define (sum-prime-squares a b)
          (filtered-accumulate2 prime? + 0 square a inc b))
        (define (product-coprimes n)
          (define (coprime? i)
            (= (gcd_ i n) 1))
          (filtered-accumulate2 coprime? * 1 identity 1 inc (- n 1)))

        (assert-eq (sum-evens 1 10) 30)
        (assert-eq (sum-prime-squares 1 10) 87)
        (assert-eq (product-coprimes 10) 189)))
