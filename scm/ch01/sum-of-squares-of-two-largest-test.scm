(load "../common/testing.scm")

(define (sum-of-squares a b)
  (+ (* a a) (* b b)))

(define (sum-of-squares-of-two-largest a b c)
  (if (< a b)
    (if (< a c)
      (sum-of-squares b c)
      (sum-of-squares b a))
    (if (< b c)
      (sum-of-squares a c)
      (sum-of-squares a b))))

(test "sum-of-squares-of-two-largest"
      (lambda ()
        (assert-eq (sum-of-squares-of-two-largest 1 2 3) 13)
        (assert-eq (sum-of-squares-of-two-largest 2 1 3) 13)
        (assert-eq (sum-of-squares-of-two-largest 3 2 1) 13)
        (assert-eq (sum-of-squares-of-two-largest 1 2 1) 5)
        (assert-eq (sum-of-squares-of-two-largest 2 1 2) 8)
        (assert-eq (sum-of-squares-of-two-largest 2 2 2) 8)))

(test "sum-of-squares-of-two-largest/table"
      (lambda ()
        (for-each
         (lambda (test-case)
           (assert-eq (apply sum-of-squares-of-two-largest (car test-case))
                      (cadr test-case)))
         '(((1 2 3) 13)
           ((2 1 3) 13)
           ((3 2 1) 13)
           ((1 2 1) 5)
           ((2 1 2) 8)
           ((2 2 2) 8)))))
