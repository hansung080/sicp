(load "../common/math.scm")
(load "../common/testing.scm")
(load "compose.scm")

(test "compose"
      (lambda ()
        (assert-eq ((compose square inc) 6) 49)))
