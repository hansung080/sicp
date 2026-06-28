(load "../common/testing.scm")

(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

(test "a-plus-abs-b"
      (lambda ()
        (assert-eq (a-plus-abs-b 1 2) 3)
        (assert-eq (a-plus-abs-b 1 -2) 3)))
