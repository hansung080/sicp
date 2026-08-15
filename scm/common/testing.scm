(define (test name thunk)
  (thunk))

(define (assert condition)
  (if (not condition)
      (begin
        (display "ASSERTION FAILED: ")
        (write condition)
        (newline))))

(define (assert-eq left right)
  (if (not (equal? left right))
      (begin
        (display "ASSERTION FAILED: ")
        (write left)
        (display " != ")
        (write right)
        (newline))))

(define (assert-ne left right)
  (if (equal? left right)
      (begin
        (display "ASSERTION FAILED: ")
        (write left)
        (display " == ")
        (write right)
        (newline))))
