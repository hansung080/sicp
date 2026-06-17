(load "../common/testing.scm")

(assert-eq 10
           10)

(assert-eq (+ 5 3 4)
           12)

(assert-eq (- 9 1)
           8)

(assert-eq (/ 6 2)
           3)

(assert-eq (+ (* 2 4) (- 4 6))
           6)

(define a 3)

(define b (+ a 1))

(assert-eq (+ a b (* a b))
           19)

(assert-eq (= a b)
           #f)

(assert-eq (if (and (> b a) (< b (* a b)))
               b
               a)
           4)

(assert-eq (cond ((= a 4) 6)
                 ((= b 4) (+ 6 7 a))
                 (else 25))
           16)

(assert-eq (+ 2 (if (> b a) b a))
           6)

(assert-eq (* (cond ((> a b) a)
                    ((< a b) b)
                    (else -1))
              (+ a 1))
           16)
