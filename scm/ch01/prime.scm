(load "../common/math.scm")

(#%require sicp) ; for random

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

;; Fermat Primality Test
;;
;;   Fermat's Little Theorem
;;
;;     If n is prime and a is an integer such that 0 < a < n:
;;       a^n % n = a % n = a
;;
;;     Notes:
;;       - If n is prime, the expression always succeeds.
;;       - If n is composite, the expression usually fails, but it may succeed.
;;
;;   Fermat Test
;;
;;     1. Choose a random integer a from the range [1, n-1].
;;     2. Check whether a^n % n = a.
;;        2-1. If it succeeds, n is probably prime.
;;             Thus, repeat from step 1 to increase confidence.
;;        2-2. If it fails, n is certainly composite.
;;             Thus, stop the test.
;;
;;     Notes:
;;       - The Fermat Test does not produce false negatives.
;;       - The Fermat Test produces false positives, particularly for Carmichael numbers.
;;       - Carmichael numbers are composite numbers for which the expression succeeds for every a coprime to n
;;         (i.e. GCD(a, n) = 1).
;;
;;   Order of Growth
;;
;;     The time and space complexities depend on the implementation of expmod.
;;
;;     time complexity:  Θ(log2(n))
;;     space complexity: Θ(log2(n))
;;
(define (fast-prime1? n)
  (fast-prime1-with-times1? n 20))

(define (fast-prime1-with-times? n times)
  (define (fermat-test? n)
    (define (try a)
      (= (expmod a n n) a))
    (try (+ (random (- n 1)) 1)))
  (define (iter i)
    (cond ((<= n 1) #f)
          ((= i 0) #t)
          ((fermat-test? n) (iter (- i 1)))
          (else #f)))
  (iter times))

(define prime? prime0?)
