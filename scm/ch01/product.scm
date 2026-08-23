;; Higher-Order Product
;;
;;   product(term, a, next, b) = term(a) * term(next(a)) * term(next(next(a))) * ... * term(b)
;;
;; Linear Recursive Process
(define (product1 term a next b)
  (if (> a b)
      1
      (* (term a)
         (product1 term (next a) next b))))

;; Linear Iterative Process
(define (product2 term a next b)
  (define (iter result a)
    (if (> a b)
        result
        (iter (* result (term a))
              (next a))))
  (iter 1 a))

(define product product2)

;; Wallis Product for π/2
;;
;;   (2 * 2 * 4 * 4 * 6 * 6 * ...) / (1 * 3 * 3 * 5 * 5 * 7 * ...) = π/2
;;
;; Infinite Product for π/4 (implemented by pi-product)
;;
;;   (2 * 4 * 4 * 6 * 6 * 8 * ...) / (3 * 3 * 5 * 5 * 7 * 7 * ...)
;;   = {(2 * 4) / (3 * 3)} * {(4 * 6) / (5 * 5)} * {(6 * 8) / (7 * 7)} * ...
;;   = π/4
(define (pi-product0 a b)
  (if (> a b)
      1.0
      (* (/ (* a (+ a 2))
            (* (+ a 1) (+ a 1)))
         (pi-product0 (+ a 2) b))))

;; DrRacket/Scheme uses arbitrary-precision exact integers and 64-bit IEEE 754 inexact floats.
;;
;; GOOD: Each term satisfies 0 < term(x) < 1, and the final product converges to π/4.
;;       Thus, it avoids both the large intermediate integers and float overflow.
(define (pi-product-by1 a b product)
  (define (term x)
    (exact->inexact
     (/ (* x (+ x 2))
        (* (+ x 1) (+ x 1)))))
  (define (next x)
    (+ x 2))
  (product term a next b))

;; BAD: If `x` is an exact integer, the intermediate products can become very large,
;;      potentially causing performance and memory overhead.
;;      If `x` is an inexact float, float overflow can occur.
(define (pi-product-by2 a b product)
  (define (term-dividend x)
    (* x (+ x 2)))
  (define (term-divisor x)
    (* x x))
  (define (next x)
    (+ x 2))
  (exact->inexact
   (/ (product term-dividend a next b)
      (product term-divisor (+ a 1) next (+ b 1)))))

(define (pi-product1 a b)
  (pi-product-by1 a b product1))

(define (pi-product2 a b)
  (pi-product-by1 a b product2))

(define (pi-product3 a b)
  (pi-product-by2 a b product1))

(define (pi-product4 a b)
  (pi-product-by2 a b product2))

(define pi-product pi-product0)
