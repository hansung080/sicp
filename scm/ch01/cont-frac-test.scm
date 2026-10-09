(load "../common/testing.scm")
(load "cont-frac.scm")

;; Substitution Model for a Recursive Process
;;
;;   (cont-frac1 (lambda (i) i) (lambda (i) i) 3)
;;   (recur 1)
;;   (/ 1 (+ 1 (recur 2)))
;;   (/ 1 (+ 1 (/ 2 (+ 2 (recur 3)))))
;;   (/ 1 (+ 1 (/ 2 (+ 2 (/ 3 (+ 3 (recur 4)))))))
;;   (/ 1 (+ 1 (/ 2 (+ 2 (/ 3 (+ 3 0))))))
;;   (/ 1 (+ 1 (/ 2 (+ 2 (/ 3 3)))))
;;   (/ 1 (+ 1 (/ 2 (+ 2 1))))
;;   (/ 1 (+ 1 (/ 2 3)))
;;   (/ 1 (+ 1 2/3))
;;   (/ 1 5/3)
;;   3/5
;;
(define (cont-frac1-exam)
  (cont-frac1 (lambda (i) i)
              (lambda (i) i)
              3))

;; Substitution Model for an Iterative Process
;;
;;   (cont-frac2 (lambda (i) i) (lambda (i) i) 3)
;;   (iter 0 3)
;;   (iter 1 2)
;;   (iter 2/3 1)
;;   (iter 3/5 0)
;;   3/5
;;
(define (cont-frac2-exam)
  (cont-frac2 (lambda (i) i)
              (lambda (i) i)
              3))

;; Reciprocal of Golden Ratio (1/φ)
;;
;;   φ   = (1 + sqrt(5)) / 2 = 1.6180...
;;   1/φ = 2 / (1 + sqrt(5)) = 0.6180...
;;
;;   Notes:
;;     φ^2 = φ + 1
;;     1/φ = φ - 1
;;
(define (golden-ratio-recip1 k)
  (cont-frac1 (lambda (i) 1.0)
              (lambda (i) 1.0)
              k))

(define (golden-ratio-recip2 k)
  (cont-frac2 (lambda (i) 1.0)
              (lambda (i) 1.0)
              k))

(test "cont-frac-exam"
      (lambda ()
        (assert-eq (cont-frac1-exam) 3/5)
        (assert-eq (cont-frac2-exam) 3/5)))

(test "golden-ratio-recip"
      (lambda ()
        ;; Hard-coded continued fractions for 1/φ (accurate to 4 decimal places for k >= 11)
        (assert-eq (/ 1.0 1)
                   1.0)
        (assert-eq (/ 1.0 (+ 1 (/ 1 1)))
                   0.5)
        (assert-eq (/ 1.0 (+ 1 (/ 1 (+ 1 (/ 1 1)))))
                   0.6666666666666666)
        (assert-eq (/ 1.0 (+ 1 (/ 1 (+ 1 (/ 1 (+ 1 (/ 1 1)))))))
                   0.6)
        (assert-eq (/ 1.0 (+ 1 (/ 1 (+ 1 (/ 1 (+ 1 (/ 1 (+ 1 (/ 1 1)))))))))
                   0.625)
        (assert-eq (/ 1.0 (+ 1 (/ 1 (+ 1 (/ 1 (+ 1 (/ 1 (+ 1 (/ 1 (+ 1 (/ 1 1)))))))))))
                   0.6153846153846154)
        (assert-eq (/ 1.0 (+ 1 (/ 1 (+ 1 (/ 1 (+ 1 (/ 1 (+ 1 (/ 1 (+ 1 (/ 1 (+ 1 (/ 1 1)))))))))))))
                   0.6190476190476191)
        (assert-eq (/ 1.0 (+ 1 (/ 1 (+ 1 (/ 1 (+ 1 (/ 1 (+ 1 (/ 1 (+ 1 (/ 1 (+ 1 (/ 1 (+ 1 (/ 1 1)))))))))))))))
                   0.6176470588235294)
        (assert-eq (/ 1.0 (+ 1 (/ 1 (+ 1 (/ 1 (+ 1 (/ 1 (+ 1 (/ 1 (+ 1 (/ 1 (+ 1 (/ 1 (+ 1 (/ 1 (+ 1 (/ 1 1)))))))))))))))))
                   0.6181818181818182)
        (assert-eq (/ 1.0 (+ 1 (/ 1 (+ 1 (/ 1 (+ 1 (/ 1 (+ 1 (/ 1 (+ 1 (/ 1 (+ 1 (/ 1 (+ 1 (/ 1 (+ 1 (/ 1 (+ 1 (/ 1 1)))))))))))))))))))
                   0.6179775280898876)
        (assert-eq (/ 1.0 (+ 1 (/ 1 (+ 1 (/ 1 (+ 1 (/ 1 (+ 1 (/ 1 (+ 1 (/ 1 (+ 1 (/ 1 (+ 1 (/ 1 (+ 1 (/ 1 (+ 1 (/ 1 (+ 1 (/ 1 1)))))))))))))))))))))
                   0.6180555555555556)
        ;; The `cont-frac` procedure for 1/φ (accurate to 4 decimal places for k >= 11)
        (assert-eq (golden-ratio-recip1 10) 0.6179775280898876)
        (assert-eq (golden-ratio-recip1 11) 0.6180555555555556)
        (assert-eq (golden-ratio-recip2 10) 0.6179775280898876)
        (assert-eq (golden-ratio-recip2 11) 0.6180555555555556)))
