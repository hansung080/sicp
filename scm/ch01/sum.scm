(load "../common/math.scm")

;; Higher-Order Sum (Linear Recursive Process)
;;
;;   sum(term, a, next, b) = term(a) + term(next(a)) + term(next(next(a))) + ... + term(b)
;;
(define (sum1 term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum1 term (next a) next b))))


(define (sum-integers0 a b)
  (if (> a b)
      0
      (+ a (sum-integers0 (+ a 1) b))))

(define (sum-integers1 a b)
  (sum1 identity a inc b))

(define sum-integers sum-integers0)

(define (sum-cubes0 a b)
  (if (> a b)
      0
      (+ (cube a) (sum-cubes0 (+ a 1) b))))

(define (sum-cubes1 a b)
  (sum1 cube a inc b))

(define sum-cubes sum-cubes0)

;; Leibniz Series for π/4
;;
;;   1 - 1/3 + 1/5 - 1/7 + ... = π/4
;;
;; Infinite Series for π/8 (implemented by pi-sum)
;;
;;   1/(1*3) + 1/(5*7) + 1/(9*11) + ... = π/8
;;
(define (pi-sum0 a b)
  (if (> a b)
      0
      (+ (/ 1.0 (* a (+ a 2))) (pi-sum0 (+ a 4) b))))

(define (pi-sum1 a b)
  (define (term x)
    (/ 1.0 (* x (+ x 2))))
  (define (next x)
    (+ x 4))
  (sum1 term a next b))

(define pi-sum pi-sum0)

;; Riemann Integral Approximation
;;
;;   Assumption
;;
;;     Assume b − a = n * dx for some integer n.
;;
;;   Left Riemann Sum
;;
;;     ∫<a, b>f(x)dx ≈ {f(a) + f(a + dx) + f(a + 2dx) + ... + f(b - dx)} * dx
;;
;;   Midpoint Riemann Sum (implemented by integral)
;;
;;     ∫<a, b>f(x)dx ≈ {f(a + dx/2) + f(a + dx/2 + dx) + f(a + dx/2 + 2dx) + ... + f(b - dx/2)} * dx
;;
;;   Right Riemann Sum
;;
;;     ∫<a, b>f(x)dx ≈ {f(a + dx) + f(a + 2dx) + f(a + 3dx) + ... + f(b)} * dx
;;
(define (integral1 f a b dx)
  (define (add-dx x)
    (+ x dx))
  (* (sum1 f (+ a (/ dx 2.0)) add-dx b)
     dx))

(define integral integral1)
