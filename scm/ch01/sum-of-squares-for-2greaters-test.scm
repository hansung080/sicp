(load "../common/testing.scm")
(load "sum-of-squares-for-2greaters.scm")

(define (test-sum-of-squares-for-2greaters)
  (assert-eq (sum-of-squares-for-2greaters 1 2 3) 13)
  (assert-eq (sum-of-squares-for-2greaters 2 1 3) 13)
  (assert-eq (sum-of-squares-for-2greaters 3 2 1) 13)
  (assert-eq (sum-of-squares-for-2greaters 1 2 1) 5)
  (assert-eq (sum-of-squares-for-2greaters 2 1 2) 8)
  (assert-eq (sum-of-squares-for-2greaters 2 2 2) 8))


(define (test-sum-of-squares-for-2greaters-table)
  (for-each
   (lambda (case)
     (assert-eq (apply sum-of-squares-for-2greaters (car case))
                (cadr case)))
   '(((1 2 3) 13)
     ((2 1 3) 13)
     ((3 2 1) 13)
     ((1 2 1) 5)
     ((2 1 2) 8)
     ((2 2 2) 8))))

(test-sum-of-squares-for-2greaters)
(test-sum-of-squares-for-2greaters-table)
