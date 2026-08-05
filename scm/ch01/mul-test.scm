(load "../common/math.scm")
(load "../common/testing.scm")

(define (double x)
  (+ x x))

(define (halve x)
  (/ x 2))

;; Linear Recursive Process
;;
;;   Recurrence Relation
;;
;;     a * 0 = 0
;;     a * b = a + a * (b - 1)  (b >= 1)
;;
;;   Order of Growth
;;
;;     time complexity:  Θ(b)
;;     space complexity: Θ(b)
;;
(define (mul1 a b)
  (if (= b 0)
      0
      (+ a (mul1 a (- b 1)))))

;; Linear Iterative Process
;;
;;   Iteration Rule
;;
;;     s + a * b = s + a + a * (b - 1) = (s + a) + a * (b - 1) = s' + a' * b'
;;
;;     s' <- s + a
;;     a' <- a
;;     b' <- b - 1
;;
;;   Order of Growth
;;
;;     time complexity:  Θ(b)
;;     space complexity: Θ(1)
;;
(define (mul2 a b)
  (define (iter s b)
    (if (= b 0)
        s
        (iter (+ s a) (- b 1))))
  (iter 0 b))


;; Logarithmic Recursive Process
;;
;;   Recurrence Relation
;;
;;     a * 0 = 0
;;     a * b = {a * (b / 2)} * 2  (b is even)
;;     a * b = a + a * (b - 1)    (b is odd)
;;
;;   Order of Growth
;;
;;     time complexity:  Θ(log2(b))
;;     space complexity: Θ(log2(b))
;;
(define (fast-mul1 a b)
  (cond ((= b 0) 0)
        ((even?_ b) (double (fast-mul1 a (halve b))))
        (else (+ a (fast-mul1 a (- b 1))))))

;; Logarithmic Iterative Process
;;
;;   Iteration Rule
;;
;;     When b = 0:
;;       Return s.
;;
;;     When b is even:
;;       s + a * b = s + {a * (b / 2)} * 2 = s + (a * 2) * (b / 2) = s' + a' * b'
;;
;;       s' <- s
;;       a' <- a * 2
;;       b' <- b / 2
;;
;;     When b is odd:
;;       s + a * b = s + a + a * (b - 1) = (s + a) + a * (b - 1) = s' + a' * b'
;;
;;       s' <- s + a
;;       a' <- a
;;       b' <- b - 1
;;
;;   Order of Growth
;;
;;     time complexity:  Θ(log2(b))
;;     space complexity: Θ(1)
;;
(define (fast-mul2 a b)
  (define (iter s a b)
    (cond ((= b 0) s)
          ((even?_ b) (iter s (double a) (halve b)))
          (else (iter (+ s a) a (- b 1)))))
  (iter 0 a b))

;; À la Russe Algorithm (Russian Peasant Multiplication, Logarithmic Recursive Process)
;;
;;   Recurrence Relation
;;
;;     0 * b = 0
;;     a * b = (a >> 1) * (b << 1)      (a is even)
;;     a * b = b + (a >> 1) * (b << 1)  (a is odd)
;;
;;   Example
;;
;;      a     b  result
;;     45    37  37
;;     22    74  37
;;     11   148  37 + 148
;;      5   296  37 + 148 + 296
;;      2   592  37 + 148 + 296
;;      1  1184  37 + 148 + 296 + 1184
;;      0     -  37 + 148 + 296 + 1184 + 0 = 1665
;;
;;   Order of Growth
;;
;;     time complexity:  Θ(log2(a))
;;     space complexity: Θ(log2(a))
;;
(define (russe-mul1 a b)
  (cond ((= a 0) 0)
        ((even?_ a) (russe-mul1 (>> a 1) (<< b 1)))
        (else (+ b (russe-mul1 (>> a 1) (<< b 1))))))

;; À la Russe Algorithm (Russian Peasant Multiplication, Logarithmic Iterative Process)
;;
;;   Iteration Rule
;;
;;     When a = 0:
;;       Return result.
;;
;;     When a is even:
;;       result' <- result
;;       a'      <- (a >> 1)
;;       b'      <- (b << 1)
;;
;;     When a is odd:
;;       result' <- result + b
;;       a'      <- (a >> 1)
;;       b'      <- (b << 1)
;;
;;   Order of Growth
;;
;;     time complexity:  Θ(log2(a))
;;     space complexity: Θ(1)
;;
(define (russe-mul2 a b)
  (define (iter result a b)
    (cond ((= a 0) result)
          ((even?_ a) (iter result (>> a 1) (<< b 1)))
          (else (iter (+ result b) (>> a 1) (<< b 1)))))
  (iter 0 a b))

(test "mul1"
      (lambda ()
        (assert-eq (mul1 0 0) 0)
        (assert-eq (mul1 0 1) 0)
        (assert-eq (mul1 0 2) 0)
        (assert-eq (mul1 2 0) 0)
        (assert-eq (mul1 2 1) 2)
        (assert-eq (mul1 2 2) 4)
        (assert-eq (mul1 2 3) 6)
        (assert-eq (mul1 2 8) 16)
        (assert-eq (mul1 2 11) 22)))

(test "mul2"
      (lambda ()
        (assert-eq (mul2 0 0) 0)
        (assert-eq (mul2 0 1) 0)
        (assert-eq (mul2 0 2) 0)
        (assert-eq (mul2 2 0) 0)
        (assert-eq (mul2 2 1) 2)
        (assert-eq (mul2 2 2) 4)
        (assert-eq (mul2 2 3) 6)
        (assert-eq (mul2 2 8) 16)
        (assert-eq (mul2 2 11) 22)))

(test "fast-mul1"
      (lambda ()
        (assert-eq (fast-mul1 0 0) 0)
        (assert-eq (fast-mul1 0 1) 0)
        (assert-eq (fast-mul1 0 2) 0)
        (assert-eq (fast-mul1 2 0) 0)
        (assert-eq (fast-mul1 2 1) 2)
        (assert-eq (fast-mul1 2 2) 4)
        (assert-eq (fast-mul1 2 3) 6)
        (assert-eq (fast-mul1 2 8) 16)
        (assert-eq (fast-mul1 2 11) 22)))

(test "fast-mul2"
      (lambda ()
        (assert-eq (fast-mul2 0 0) 0)
        (assert-eq (fast-mul2 0 1) 0)
        (assert-eq (fast-mul2 0 2) 0)
        (assert-eq (fast-mul2 2 0) 0)
        (assert-eq (fast-mul2 2 1) 2)
        (assert-eq (fast-mul2 2 2) 4)
        (assert-eq (fast-mul2 2 3) 6)
        (assert-eq (fast-mul2 2 8) 16)
        (assert-eq (fast-mul2 2 11) 22)))

(test "russe-mul1"
      (lambda ()
        (assert-eq (russe-mul1 0 0) 0)
        (assert-eq (russe-mul1 0 1) 0)
        (assert-eq (russe-mul1 0 2) 0)
        (assert-eq (russe-mul1 2 0) 0)
        (assert-eq (russe-mul1 2 1) 2)
        (assert-eq (russe-mul1 2 2) 4)
        (assert-eq (russe-mul1 2 3) 6)
        (assert-eq (russe-mul1 2 8) 16)
        (assert-eq (russe-mul1 2 11) 22)
        (assert-eq (russe-mul1 45 37) 1665)))

(test "russe-mul2"
      (lambda ()
        (assert-eq (russe-mul2 0 0) 0)
        (assert-eq (russe-mul2 0 1) 0)
        (assert-eq (russe-mul2 0 2) 0)
        (assert-eq (russe-mul2 2 0) 0)
        (assert-eq (russe-mul2 2 1) 2)
        (assert-eq (russe-mul2 2 2) 4)
        (assert-eq (russe-mul2 2 3) 6)
        (assert-eq (russe-mul2 2 8) 16)
        (assert-eq (russe-mul2 2 11) 22)
        (assert-eq (russe-mul2 45 37) 1665)))
