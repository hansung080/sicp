(load "../common/testing.scm")
(load "fixed-point.scm")
(load "half-interval-method.scm")
(load "polynomial-roots.scm")

(define (sqrt0 x)
  (fixed-point (lambda (y) (average (/ x y) y))
               1.0))

(define (cbrt0 x)
  (fixed-point (lambda (y) (/ (+ (/ x (square y))
                                 (* 2 y))
                              3))
               1.0))

;; Golden Ratio (φ)
;;
;;   Find the golden ratio by finding a root of the equation:
;;     φ^2 = φ + 1
;;     φ^2 - φ - 1 = 0
;;     φ = (1 + sqrt(5)) / 2 = 1.6180...
;;   
;;   Find the golden ratio by finding a fixed point of the function:
;;     φ^2 = φ + 1
;;     φ = 1 + 1 / φ
;;     Thus φ is a fixed point of f(φ) = 1 + 1 / φ
;;
(define (golden-ratio1)
  (/ (+ 1 (sqrt0 5)) 2))

(define (golden-ratio2)
  (car (quadratic-roots 1 -1 -1)))

(define (golden-ratio3)
  (half-interval-method (lambda (x) (- (* x x) x 1))
                        1.0
                        2.0))

(define (golden-ratio4)
  (fixed-point (lambda (x) (+ 1 (/ 1 x)))
               1.0))

;; A Root of the Equation x^x = y (x to the power of x equals y)
;;
;;   x^x = y
;;   log(x^x) = log(y)
;;   x * log(x) = log(y)
;;   x = log(y) / log(x)
;;   2x = log(y) / log(x) + x
;;   x = (log(y) / log(x) + x) / 2
;;
;;   Without average damping, find a fixed point of the function:
;;     f(x) = log(y) / log(x)
;;
;;     Notes:
;;       - `fixed-point-exact` causes a termination failure (2-cycle).
;;       - `fixed-point-abs-err` takes 38 iterations.
;;       - `fixed-point-rel-err` takes 34 iterations.
;;       - `fixed-point-checked` takes 91 iterations.
;;
;;   With average damping, find a fixed point of the function:
;;     f(x) = (log(y) / log(x) + x) / 2
;;
;;     Notes:
;;       - `fixed-point-exact` takes 27 iterations.
;;       - `fixed-point-abs-err` takes 14 iterations.
;;       - `fixed-point-rel-err` takes 13 iterations.
;;       - `fixed-point-checked` takes 27 iterations.
;;
(define (x-pow-x-root-without-damping1 y)
  (fixed-point-exact (lambda (x) (/ (log y) (log x)))
                     1.1))

(define (x-pow-x-root-without-damping2 y)
  (fixed-point-abs-err (lambda (x) (/ (log y) (log x)))
                       1.1))

(define (x-pow-x-root-without-damping3 y)
  (fixed-point-rel-err (lambda (x) (/ (log y) (log x)))
                       1.1))

(define (x-pow-x-root-without-damping4 y)
  (fixed-point-checked (lambda (x) (/ (log y) (log x)))
                       1.1))

(define (x-pow-x-root-with-damping1 y)
  (fixed-point-exact (lambda (x) (average (/ (log y) (log x)) x))
                     1.1))

(define (x-pow-x-root-with-damping2 y)
  (fixed-point-abs-err (lambda (x) (average (/ (log y) (log x)) x))
                       1.1))

(define (x-pow-x-root-with-damping3 y)
  (fixed-point-rel-err (lambda (x) (average (/ (log y) (log x)) x))
                       1.1))

(define (x-pow-x-root-with-damping4 y)
  (fixed-point-checked (lambda (x) (average (/ (log y) (log x)) x))
                       1.1))

(test "fixed-point"
      (lambda ()
        ;; A fixed point of `cos` is a root of `cos(x) - x = 0`.
        (assert-eq (half-interval-method (lambda (x) (- (cos x) x)) 0.0 1.0) 0.73876953125)
        (assert-eq (fixed-point-exact cos 1.0) 0.7390851332151607)
        (assert-eq (fixed-point-abs-err cos 1.0) 0.7390822985224023)
        (assert-eq (fixed-point-rel-err cos 1.0) 0.7390822985224023)
        (assert-eq (fixed-point-checked cos 1.0) 0.7390851332151607)
        ;; A fixed point of `sin + cos` is a root of `sin(x) + cos(x) - x = 0`.
        (assert-eq (half-interval-method (lambda (x) (- (+ (sin x) (cos x)) x)) 1.0 2.0) 1.25830078125)
        ; (assert-eq (fixed-point-exact (lambda (x) (+ (sin x) (cos x))) 1.0) 1.2587281774926766) ; termination failure (2-cycle)
        (assert-eq (fixed-point-abs-err (lambda (x) (+ (sin x) (cos x))) 1.0) 1.2587315962971173)
        (assert-eq (fixed-point-rel-err (lambda (x) (+ (sin x) (cos x))) 1.0) 1.2587315962971173)
        (assert-eq (fixed-point-checked (lambda (x) (+ (sin x) (cos x))) 1.0) 1.2587281774926766)))

(test "sqrt0"
      (lambda ()
        ;; Test for ordinary numbers.
        (assert-eq (sqrt0 0) 0.0)
        (assert-eq (sqrt0 1) 1.0)
        (assert-eq (sqrt0 2) 1.414213562373095)
        (assert-eq (sqrt0 3) 1.7320508075688772)
        (assert-eq (sqrt0 4) 2.0)
        (assert-eq (sqrt0 5) 2.23606797749979)
        (assert-eq (sqrt0 6) 2.449489742783178)
        (assert-eq (sqrt0 7) 2.6457513110645907)
        (assert-eq (sqrt0 8) 2.82842712474619)
        (assert-eq (sqrt0 9) 3.0)
        (assert-eq (sqrt0 10) 3.162277660168379)
        (assert-eq (sqrt0 (+ 100 37)) 11.704699910719626)
        (assert-eq (sqrt0 (+ (sqrt0 2) (sqrt0 3))) 1.773771228186423)
        (assert-eq (square (sqrt0 1000)) 1000.0)
        ;; Test for very small and large numbers.
        (assert-eq (sqrt0 0.000001) 0.001)
        (assert-eq (sqrt0 10000000000000000000000000000000000000000000000000000000000000000) 1e+32)))

(test "cbrt0"
      (lambda ()
        ;; Test for ordinary numbers.
        (assert-eq (cbrt0 0) 5e-324)
        (assert-eq (cbrt0 1) 1.0)
        (assert-eq (cbrt0 2) 1.2599210498948732)
        (assert-eq (cbrt0 3) 1.4422495703074085)
        (assert-eq (cbrt0 4) 1.5874010519681994)
        (assert-eq (cbrt0 5) 1.709975946676697)
        (assert-eq (cbrt0 6) 1.8171205928321397)
        (assert-eq (cbrt0 7) 1.912931182772389)
        (assert-eq (cbrt0 8) 2.0)
        (assert-eq (cbrt0 9) 2.080083823051904)
        (assert-eq (cbrt0 10) 2.154434690031884)
        (assert-eq (cbrt0 (+ 100 37)) 5.1551367354757724)
        (assert-eq (cbrt0 (+ (cbrt0 2) (cbrt0 3))) 1.392849702964866)
        (assert-eq (cube (cbrt0 1000)) 1000.0)
        ;; Test for very small and large numbers.
        (assert-eq (cbrt0 0.000000001) 0.001)
        (assert-eq (cbrt0 1000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000) 1e+32)))

(test "golden-ratio"
      (lambda ()
        (assert-eq (golden-ratio1) 1.618033988749895)
        (assert-eq (golden-ratio2) 1.618033988749895)
        (assert-eq (golden-ratio3) 1.61767578125)
        (assert-eq (golden-ratio4) 1.618033988749895)))

(test "x-pow-x-root"
      (lambda ()
        ; (assert-eq (x-pow-x-root-without-damping1 1000) 4.555535705195127) ; termination failure (2-cycle)
        (assert-eq (x-pow-x-root-without-damping2 1000) 4.555538934848503)
        (assert-eq (x-pow-x-root-without-damping3 1000) 4.555552779647764)
        (assert-eq (x-pow-x-root-without-damping4 1000) 4.555535705195127)
        (assert-eq (x-pow-x-root-with-damping1 1000) 4.555535705195128)
        (assert-eq (x-pow-x-root-with-damping2 1000) 4.555536364911781)
        (assert-eq (x-pow-x-root-with-damping3 1000) 4.55553957996306)
        (assert-eq (x-pow-x-root-with-damping4 1000) 4.555535705195128)))
