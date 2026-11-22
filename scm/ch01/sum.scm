(load "../common/math.scm")

;; Sum
;;
;;   sum(term, a, next, b) = ∑<k=0..n>{term(next^k(a))}
;;                         = term(a) + term(next(a)) + term(next^2(a)) + ... + term(next^n(a))
;;                           where n is the largest integer such that next^n(a) <= b
;;
;; Recursive Process
(define (sum1 term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum1 term (next a) next b))))

;; Iterative Process
(define (sum2 term a next b)
  (define (iter result a)
    (if (> a b)
        result
        (iter (+ result (term a))
              (next a))))
  (iter 0 a))

(define sum sum2)

;; Sum of Integers
;;
;;   sum-integers(a, b) = ∑<k=a..b>(k)
;;                      = a + (a+1) + (a+2) + ... + b
;;                        where a and b are integers such that a <= b
;;
(define (sum-integers0 a b)
  (if (> a b)
      0
      (+ a (sum-integers0 (+ a 1) b))))

(define (sum-integers1 a b)
  (sum1 identity a inc b))

(define (sum-integers2 a b)
  (sum2 identity a inc b))

(define sum-integers sum-integers0)

;; Sum of Squares
;;
;;   sum-squares(a, b) = ∑<k=a..b>(k^2)
;;                     = a^2 + (a+1)^2 + (a+2)^2 + ... + b^2
;;                       where a and b are integers such that a <= b
;;
(define (sum-squares0 a b)
  (if (> a b)
      0
      (+ (square a)
         (sum-squares0 (+ a 1) b))))

(define (sum-squares1 a b)
  (sum1 square a inc b))

(define (sum-squares2 a b)
  (sum2 square a inc b))

(define sum-squares sum-squares0)

;; Sum of Cubes
;;
;;   sum-cubes(a, b) = ∑<k=a..b>(k^3)
;;                   = a^3 + (a+1)^3 + (a+2)^3 + ... + b^3
;;                     where a and b are integers such that a <= b
;;
(define (sum-cubes0 a b)
  (if (> a b)
      0
      (+ (cube a)
         (sum-cubes0 (+ a 1) b))))

(define (sum-cubes1 a b)
  (sum1 cube a inc b))

(define (sum-cubes2 a b)
  (sum2 cube a inc b))

(define sum-cubes sum-cubes0)

;; Leibniz Series for π/4
;;
;;   ∑<k=0..∞>{(-1)^k / (2k + 1)} = 1 - 1/3 + 1/5 - 1/7 + ... = π/4
;;
;; Infinite Series for π/8 (implemented in `pi-over-eight`)
;;
;;   ∑<k=0..∞>[1 / {(4k + 1)(4k + 3)}] = 1/(1*3) + 1/(5*7) + 1/(9*11) + ... = π/8
;;
(define (pi-over-eight0 a b)
  (if (> a b)
      0
      (+ (/ 1.0 (* a (+ a 2)))
         (pi-over-eight0 (+ a 4) b))))

(define (pi-over-eight-by a b sum)
  (define (term x)
    (/ 1.0 (* x (+ x 2))))
  (define (next x)
    (+ x 4))
  (sum term a next b))

(define (pi-over-eight1 a b)
  (pi-over-eight-by a b sum1))

(define (pi-over-eight2 a b)
  (pi-over-eight-by a b sum2))

(define pi-over-eight pi-over-eight0)

;; Riemann Integral Approximation
;;
;;   Left Riemann Sum
;;
;;     ∫<a..b>{f(x)}dx ≈ ∑<k=0..n-1>{f(a + kΔx)} * Δx
;;                     = {f(a) + f(a + Δx) + f(a + 2Δx) + ... + f(a + (n-1)Δx)} * Δx
;;                       where n is the number of subintervals and Δx = (b - a) / n
;;
;;   Midpoint Riemann Sum (implemented in `integral`)
;;
;;     ∫<a..b>{f(x)}dx ≈ ∑<k=0..n-1>{f(a + Δx/2 + kΔx)} * Δx
;;                     = {f(a + Δx/2) + f(a + Δx/2 + Δx) + f(a + Δx/2 + 2Δx) + ... + f(a + Δx/2 + (n-1)Δx)} * Δx
;;                       where n is the number of subintervals and Δx = (b - a) / n
;;
;;   Right Riemann Sum
;;
;;     ∫<a..b>{f(x)}dx ≈ ∑<k=1..n>{f(a + kΔx)} * Δx
;;                     = {f(a + Δx) + f(a + 2Δx) + f(a + 3Δx) + ... + f(a + nΔx)} * Δx
;;                       where n is the number of subintervals and Δx = (b - a) / n
;;
;; Note:
;;   Originally, SICP takes the subinterval width `dx` as an input, but this implementation takes
;;   the number of subintervals `n` to make its interface consistent with `simpson-integral`.
(define (integral-by f a b n sum)
  (define dx (exact->inexact (/ (- b a) n)))
  (define (add-dx x)
    (+ x dx))
  (* (sum f (+ a (/ dx 2)) add-dx b)
     dx))

(define (integral1 f a b n)
  (integral-by f a b n sum1))

(define (integral2 f a b n)
  (integral-by f a b n sum2))

;; Simpson Integral Approximation
;;
;;   Simpson's Rule
;;
;;     For even n, let h = (b - a) / n and y_k = f(a + kh):
;;       ∫<a..b>{f(x)}dx ≈ ∑<k=0..n/2-1>{y_(2k) + 4y_(2k+1) + y_(2k+2)} * (h / 3)
;;                       = [y_0 + 4∑<k=0..n/2-1>{y_(2k+1)} + 2∑<k=1..n/2-1>{y_(2k)} + y_n] * (h / 3)
;;                       = {y_0 + 4y_1 + 2y_2 + 4y_3 + 2y_4 + ... + 2y_(n-2) + 4y_(n-1) + y_n} * (h / 3)
;;                       = [y_0 + 4{y_1 + y_3 + ... + y_(n-1)} + 2{y_2 + y_4 + ... + y_(n-2)} + y_n] * (h / 3)
;;
;; Precondition:
;;   `n` must be even.
(define (simpson-integral-by f a b n sum)
  (define h (exact->inexact (/ (- b a) n)))
  (define (add-2h x)
    (+ x h h))
  (* (+ (f a)
        (* 4 (sum f (+ a h) add-2h b))
        (* 2 (sum f (+ a h h) add-2h b))
        (f b))
     (/ h 3)))

(define (simpson-integral1 f a b n)
  (simpson-integral-by f a b n sum1))

(define (simpson-integral2 f a b n)
  (simpson-integral-by f a b n sum2))

(define integral simpson-integral2)
