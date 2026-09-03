(load "../common/error.scm")

(define (test name thunk)
  (thunk))

(define (assert1 condition)
  (if (not condition)
      (begin
        (display "assertion failed: ")
        (write condition)
        (newline))))

(define (assert2 condition)
  (if (not condition)
      (error "assertion failed:" condition)))

(define assert assert2)

(define (assert-eq1 left right)
  (if (not (equal? left right))
      (begin
        (display "assertion failed: ")
        (write left)
        (display " != ")
        (write right)
        (newline))))

(define (assert-eq2 left right)
  (if (not (equal? left right))
      (error "assertion failed:" left '!= right)))

(define assert-eq assert-eq2)

(define (assert-ne1 left right)
  (if (equal? left right)
      (begin
        (display "assertion failed: ")
        (write left)
        (display " == ")
        (write right)
        (newline))))

(define (assert-ne2 left right)
  (if (equal? left right)
      (error "assertion failed:" left '== right)))

(define assert-ne assert-ne2)
