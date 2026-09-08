(load "../common/testing.scm")
(load "sin.scm")

(test "sin_"
      (lambda ()
        (assert-eq (sin_ 0) 0)
        (assert-eq (sin_ 0.1) 0.1)
        (assert-eq (sin_ 0.2) 0.19881481481481483)
        (assert-eq (sin_ 3.14) 0.0008056774674223277)
        (assert-eq (sin_ 12.15) -0.39980345741334)))
