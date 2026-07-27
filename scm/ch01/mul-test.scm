(load "../common/math.scm")
(load "../common/testing.scm")

(define (double x)
  (+ x x))

(define (halve x)
  (/ x 2))

;; Linear-Recursive Process (time complexity: Θ(b), space complexity: Θ(b))
;;
;;   a * 0 = 0
;;   a * b = a + a * (b - 1)  (b >= 1)
;;
(define (mul1 a b)
  (if (= b 0)
      0
      (+ a (mul1 a (- b 1)))))

;; Linear-Iterative Process (time complexity: Θ(b), space complexity: Θ(1))
;;
;;   s + a * b = s + a + a * (b - 1) = (s + a) + a * (b - 1) = s' + a' * b'
;;
;;   s' <- s + a
;;   a' <- a
;;   b' <- b - 1
;;
(define (mul2 a b)
  (define (iter s b)
    (if (= b 0)
        s
        (iter (+ s a) (- b 1))))
  (iter 0 b))


;; Logarithmic-Recursive Process (time complexity: Θ(log2(b)), space complexity: Θ(log2(b)))
;;
;;   a * 0 = 0
;;   a * b = {a * (b / 2)} * 2  (b is even)
;;   a * b = a + a * (b - 1)    (b is odd)
;;
(define (fast-mul1 a b)
  (cond ((= b 0) 0)
        ((even?_ b) (double (fast-mul1 a (halve b))))
        (else (+ a (fast-mul1 a (- b 1))))))

;; Logarithmic-Iterative Process (time complexity: Θ(log2(b)), space complexity: Θ(1))
;;
;;   When b = 0:
;;
;;     Return s.
;;
;;   When b is even:
;;
;;     s + a * b = s + {a * (b / 2)} * 2 = s + (a * 2) * (b / 2) = s' + a' * b'
;;
;;     s' <- s
;;     a' <- a * 2
;;     b' <- b / 2
;;
;;   When b is odd:
;;
;;     s + a * b = s + a + a * (b - 1) = (s + a) + a * (b - 1) = s' + a' * b'
;;
;;     s' <- s + a
;;     a' <- a
;;     b' <- b - 1
;;
(define (fast-mul2 a b)
  (define (iter s a b)
    (cond ((= b 0) s)
          ((even?_ b) (iter s (double a) (halve b)))
          (else (iter (+ s a) a (- b 1)))))
  (iter 0 a b))

(test "mul1"
      (lambda ()
        (assert-eq (mul1 2 0) 0)
        (assert-eq (mul1 2 1) 2)
        (assert-eq (mul1 2 2) 4)
        (assert-eq (mul1 2 3) 6)
        (assert-eq (mul1 2 8) 16)
        (assert-eq (mul1 2 11) 22)))

(test "mul2"
      (lambda ()
        (assert-eq (mul2 2 0) 0)
        (assert-eq (mul2 2 1) 2)
        (assert-eq (mul2 2 2) 4)
        (assert-eq (mul2 2 3) 6)
        (assert-eq (mul2 2 8) 16)
        (assert-eq (mul2 2 11) 22)))

(test "fast-mul1"
      (lambda ()
        (assert-eq (fast-mul1 2 0) 0)
        (assert-eq (fast-mul1 2 1) 2)
        (assert-eq (fast-mul1 2 2) 4)
        (assert-eq (fast-mul1 2 3) 6)
        (assert-eq (fast-mul1 2 8) 16)
        (assert-eq (fast-mul1 2 11) 22)))

(test "fast-mul2"
      (lambda ()
        (assert-eq (fast-mul2 2 0) 0)
        (assert-eq (fast-mul2 2 1) 2)
        (assert-eq (fast-mul2 2 2) 4)
        (assert-eq (fast-mul2 2 3) 6)
        (assert-eq (fast-mul2 2 8) 16)
        (assert-eq (fast-mul2 2 11) 22)))
