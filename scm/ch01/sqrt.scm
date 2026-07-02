(load "../common/math.scm")

;; BAD: good-enough1? fails for very small and very large numbers.
;;      good-enough2? addresses that issue, but still suffers from accuracy issues caused by the tolerance.
(define (sqrt1 x)
  (define tolerance 0.001)
  ;; WORSE: absolute error: |y^2 - x| < tolerance
  (define (good-enough1? guess)
    (< (abs_ (- (square guess) x)) tolerance))
  ;; BAD: relative error: |(y^2 - x) / x| < tolerance
  (define (good-enough2? guess)
    (< (abs_ (/ (- (square guess) x) x)) tolerance))
  ;; y'' <- (x / y + y) / 2
  (define (improve guess)
    (average (/ x guess) guess))
  (define (try guess)
    (if (good-enough2? guess)
        guess
        (try (improve guess))))
  (try 1.0))

;; BEST: good-enough1?, good-enough2?, and good-enough3? succeed for very small and very large numbers.
;;       good-enough3? is the best for accuracy.
(define (sqrt2 x)
  (define tolerance 0.00000000001)
  ;; GOOD: absolute error: |y - y''| < tolerance
  (define (good-enough1? guess next-guess)
    (< (abs_ (- guess next-guess)) tolerance))
  ;; BETTER: relative error: |(y - y'') / y''| < tolerance
  (define (good-enough2? guess next-guess)
    (< (abs_ (/ (- guess next-guess) next-guess)) tolerance))
  ;; BEST: no error: y = y''
  (define (good-enough3? guess next-guess)
    (= guess next-guess))
  ;; y'' <- (x / y + y) / 2
  (define (improve guess)
    (average (/ x guess) guess))
  (define (try guess)
    (let ((next-guess (improve guess)))
      (if (good-enough3? guess next-guess)
          guess
          (try next-guess))))
  (try 1.0))

(define sqrt_ sqrt2)
