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
;;   Left Riemann Sum
;;
;;     ∫<a, b>f(x)dx ≈ {f(a) + f(a + dx) + f(a + 2dx) + ... + f(a + n*dx)} * dx
;;     where n is the largest integer such that a + n*dx <= b
;;
;;   Midpoint Riemann Sum (implemented by integral)
;;
;;     ∫<a, b>f(x)dx ≈ {f(a + dx/2) + f(a + dx/2 + dx) + f(a + dx/2 + 2dx) + ... + f(a + dx/2 + n*dx)} * dx
;;     where n is the largest integer such that a + dx/2 + n*dx <= b
;;
;;   Right Riemann Sum
;;
;;     ∫<a, b>f(x)dx ≈ {f(a + dx) + f(a + 2dx) + f(a + 3dx) + ... + f(a + n*dx)} * dx
;;     where n is the largest integer such that a + n*dx <= b
;;
(define (integral1 f a b dx)
  (define (add-dx x)
    (+ x dx))
  (* (sum1 f (+ a (/ dx 2.0)) add-dx b)
     dx))

;; Simpson Integral Approximation
;;
;;   Simpson's rule
;;
;;     For even n, let h = (b - a) / n and y_k = f(a + kh):
;;       ∫<a, b>f(x)dx ≈ {y_0 + 4y_1 + 2y_2 + 4y_3 + 2y_4 + ... + 2y_(n-2) + 4y_(n-1) + y_n} * (h / 3)
;;                     = [y_0 + 4{y_1 + y_3 + ... + y_(n-1)} + 2{y_2 + y_4 + ... + y_(n-2)} + y_n] * (h / 3)
;;
(define (simpson-integral1 f a b n) ; `n` must be even.
  (define h (/ (- b a) n))
  (define (add-2h x)
    (+ x h h))
  (* (+ (f a)
        (* 4 (sum1 f (+ a h) add-2h b))
        (* 2 (sum1 f (+ a h h) add-2h b))
        (f b))
     (/ h 3)))

(define integral simpson-integral1)
