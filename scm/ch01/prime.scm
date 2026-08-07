(load "../common/math.scm")

;; Mathematical Definition of Prime Number
;;
;;   A prime number is a natural number greater than 1 whose only positive divisors are 1 and itself.
;;
;; Basic Primality Test
;;
;;   Closed-Form Formula
;;
;;     prime?(n) = false                     (n <= 1)
;;     prime?(n) = smallest-divisor(n) == n  (n > 1; smallest-divisor(n) = [2, sqrt(n)] or n)
;;
;;   Order of Growth
;;
;;     time complexity:  Θ(sqrt(n))
;;     space complexity: Θ(1)
;;
(define (prime0? n)
  (define (smallest-divisor n)
    (define (try candidate)
      (cond ((> (square candidate) n) n)
            ((divide? n candidate) candidate)
            (else (try (+ candidate 2)))))
    (if (divide? n 2)
        2
        (try 3)))
  (if (<= n 1)
      #f
      (= (smallest-divisor n) n)))

(define prime? prime0?)
