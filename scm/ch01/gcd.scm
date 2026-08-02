;; Euclidean Algorithm Using Subtraction (Linear Iterative Process)
;;
;;   Iteration Rule
;;
;;     Let:
;;       A and B are positive integers, and G is the greatest common divisor of them.
;;
;;       A = a * G
;;       B = b * G
;;
;;     Then:
;;       a and b are coprime, and (a - b) and b are coprime.
;;
;;       A - B = (a - b) * G
;;
;;     Thus:
;;       GCD(A, B) = GCD(A - B, B)
;;       GCD(A, B) = GCD(B, A)
;;       GCD(0, B) = B
;;
;;   Example
;;
;;     GCD(40, 206)
;;     = GCD(206, 40)
;;     = GCD(166, 40)
;;     = GCD(126, 40)
;;     = GCD(86, 40)
;;     = GCD(46, 40)
;;     = GCD(6, 40)
;;     = GCD(40, 6)
;;     = GCD(34, 6)
;;     = GCD(28, 6)
;;     = GCD(22, 6)
;;     = GCD(16, 6)
;;     = GCD(10, 6)
;;     = GCD(4, 6)
;;     = GCD(6, 4)
;;     = GCD(2, 4)
;;     = GCD(4, 2)
;;     = GCD(2, 2)
;;     = GCD(0, 2)
;;     = 2
;;
;;   Order of Growth
;;
;;     time complexity:  Θ(a + b)
;;     space complexity: Θ(1)
;;
(define (slow-gcd a b)
  (cond ((= b 0) a) ; special case where b is initially 0
        ((= a 0) b) ; base case
        ((< a b) (slow-gcd (- b a) a))
        (else (slow-gcd (- a b) b))))

;; Euclidean Algorithm Using Remainder (Logarithmic Iterative Process)
(define (fast-gcd a b)
  0)

(define gcd_ fast-gcd)
