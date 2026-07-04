(load "../common/testing.scm")

(define (count-change amount)
  (define (coin-denomination coin-type)
    (case coin-type
      ((1) 1)
      ((2) 5)
      ((3) 10)
      ((4) 25)
      ((5) 50)))
  (define (cc amount coin-type)
    (cond ((= amount 0) 1)
          ((or (< amount 0) (= coin-type 0)) 0)
          (else (+ (cc (- amount (coin-denomination coin-type))
                       coin-type)
                   (cc amount
                       (- coin-type 1))))))
  (cc amount 5))

(test "count-change"
      (lambda ()
        (assert-eq (count-change 11) 4)
        (assert-eq (count-change 22) 9)
        (assert-eq (count-change 100) 292)))
