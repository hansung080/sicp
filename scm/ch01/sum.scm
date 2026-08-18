(load "../common/math.scm")

;; Higher-Order Procedure: Sum (Linear Recursive Process)
;;
;;   sum-terms(a, b) = term(a) + term(next(a)) + term(next(a)) + ... + term(b)
(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))


(define (sum-integers a b)
  (if (> a b)
      0
      (+ a (sum-integers (+ a 1) b))))

(define (sum-integers0 a b)
  (sum identity a inc b))

(define (sum-cubes a b)
  (if (> a b)
      0
      (+ (cube a) (sum-cubes (+ a 1) b))))

(define (sum-cubes0 a b)
  (sum cube a inc b))

;; Leibniz Series for π/4
;;
;;   1 - 1/3 + 1/5 - 1/7 + ... = π/4
;;
;; Infinite Series for π/8 (implemented by pi-sum)
;;
;;   1/(1*3) + 1/(5*7) + 1/(9*11) + ... = π/8
;;
(define (pi-sum a b)
  (if (> a b)
      0
      (+ (/ 1.0 (* a (+ a 2))) (pi-sum (+ a 4) b))))

(define (pi-sum0 a b)
  (define (term x)
    (/ 1.0 (* x (+ x 2))))
  (define (next x)
    (+ x 4))
  (sum term a next b))

;; Integral Approximation Using Riemann Sum
;;
;;   Assumption
;;
;;     Assume b − a = n * dx for some integer n.
;;
;;   Left Riemann Sum
;;
;;     S<a, b>f(x)dx ≈ {f(a) + f(a + dx) + f(a + 2dx) + ... + f(b - dx)} * dx
;;
;;   Midpoint Riemann Sum (implemented by integral)
;;
;;     S<a, b>f(x)dx ≈ {f(a + dx/2) + f(a + dx/2 + dx) + f(a + dx/2 + 2dx) + ... + f(b - dx/2)} * dx
;;
;;   Right Riemann Sum
;;
;;     S<a, b>f(x)dx ≈ {f(a + dx) + f(a + 2dx) + f(a + 3dx) + ... + f(b)} * dx
;;
(define (integral f a b dx)
  (define (add-dx x)
    (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b)
     dx))
