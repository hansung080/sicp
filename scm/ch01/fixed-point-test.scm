(load "../common/testing.scm")
(load "fixed-point.scm")
(load "half-interval-method.scm")

(test "fixed-point"
      (lambda ()
        ;; A fixed point of `cos` is a root of `cos(x) - x = 0`.
        (assert-eq (fixed-point cos 1.0) 0.7390893414033927)
        (assert-eq (half-interval-method (lambda (x) (- (cos x) x)) 0.0 1.0) 0.73876953125)
        ;; A fixed point of `sin + cos` is a root of `sin(x) + cos(x) - x = 0`.
        (assert-eq (fixed-point (lambda (x) (+ (sin x) (cos x))) 1.0) 1.2587228743052672)
        (assert-eq (half-interval-method (lambda (x) (- (+ (sin x) (cos x)) x)) 1.0 2.0) 1.25830078125)))
