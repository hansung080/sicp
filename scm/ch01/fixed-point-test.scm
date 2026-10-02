(load "../common/testing.scm")
(load "fixed-point.scm")

(test "fixed-point"
      (lambda ()
        (assert-eq (fixed-point cos 1.0) 0.7390893414033927)
        (assert-eq (fixed-point (lambda (x) (+ (sin x) (cos x))) 1.0) 1.2587228743052672)))
