(load "../common/testing.scm")
(load "fixed-point.scm")
(load "half-interval-method.scm")

(define (sqrt0 x)
  (fixed-point-with (lambda (y) (average (/ x y) y))
                    1.0
                    close-exact?))

(define (cbrt0 x)
  (fixed-point-with (lambda (y) (/ (+ (/ x (square y))
                                      (* 2 y))
                                   3))
                    1.0
                    close-exact?))

(test "fixed-point"
      (lambda ()
        ;; A fixed point of `cos` is a root of `cos(x) - x = 0`.
        (assert-eq (fixed-point cos 1.0) 0.7390893414033927)
        (assert-eq (half-interval-method (lambda (x) (- (cos x) x)) 0.0 1.0) 0.73876953125)
        ;; A fixed point of `sin + cos` is a root of `sin(x) + cos(x) - x = 0`.
        (assert-eq (fixed-point (lambda (x) (+ (sin x) (cos x))) 1.0) 1.2587228743052672)
        (assert-eq (half-interval-method (lambda (x) (- (+ (sin x) (cos x)) x)) 1.0 2.0) 1.25830078125)))

(test "sqrt0"
      (lambda ()
        ;; Test for normal numbers.
        (assert-eq (sqrt0 1)
                   1.0)
        (assert-eq (sqrt0 2)
                   1.414213562373095)
        (assert-eq (sqrt0 9)
                   3.0)
        (assert-eq (sqrt0 (+ 100 37))
                   11.704699910719626)
        (assert-eq (sqrt0 (+ (sqrt0 2) (sqrt0 3)))
                   1.773771228186423)
        (assert-eq (square (sqrt0 1000))
                   1000.0)
        ;; Test for very small and large numbers.
        (assert-eq (sqrt0 0.000001)
                   0.001)
        (assert-eq (sqrt0 10000000000000000000000000000000000000000000000000000000000000000)
                   1e+32)))

(test "cbrt0"
      (lambda ()
        ;; Test for normal numbers.
        (assert-eq (cbrt0 1)
                   1.0)
        (assert-eq (cbrt0 2)
                   1.2599210498948732)
        (assert-eq (cbrt0 8)
                   2.0)
        (assert-eq (cbrt0 (+ 100 37))
                   5.1551367354757724)
        (assert-eq (cbrt0 (+ (cbrt0 2) (cbrt0 3)))
                   1.392849702964866)
        (assert-eq (cube (cbrt0 1000))
                   1000.0)
        ;; Test for very small and large numbers.
        (assert-eq (cbrt0 0.000000001)
                   0.001)
        (assert-eq (cbrt0 1000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000)
                   1e+32)))
