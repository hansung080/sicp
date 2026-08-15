(load "../common/math.scm")

(#%require sicp) ; for random

;; Mathematical Definition of Prime Number
;;
;;   A prime number is a natural number greater than 1 whose only positive divisors are 1 and itself.
;;
;; Basic Primality Test (Deterministic Primality Test)
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
            ((divides? candidate n) candidate)
            (else (try (+ candidate 2)))))
    (if (divides? 2 n)
        2
        (try 3)))
  (if (<= n 1)
      #f
      (= (smallest-divisor n) n)))

;; Fermat Primality Test (Probabilistic Primality Test)
;;
;;   Fermat's Little Theorem
;;
;;     If n is prime and a is an integer such that 0 < a < n:
;;       a^n and a are congruent modulo n (i.e. a^n ≡ a (mod n)).
;;
;;       a^n % n = a % n = a
;;
;;     Proof:
;;       If n is prime and a is an integer such that 0 < a < n:
;;         {a % n, 2a % n, ..., (n-1)a % n} = {1, 2, ..., n-1}
;;         a * 2a * ... * (n-1)a ≡ 1 * 2 * ... * n-1 (mod n)
;;         a^(n-1)(1 * 2 * ... * n-1) ≡ 1 * 2 * ... * n-1 (mod n)
;;         a^(n-1)(n-1)! ≡ (n-1)! (mod n)
;;         a^(n-1) ≡ 1 (mod n)
;;         a^n ≡ a (mod n)
;;
;;     Notes:
;;       - If n is prime, the expression always succeeds.
;;       - If n is composite, the expression usually fails, but it may succeed.
;;
;;   Fermat Test
;;
;;     1. Choose a random integer a in the range [1, n-1].
;;     2. Check whether a^n % n = a.
;;        2-1. If step 2 succeeds, n is probably prime.
;;             Thus, repeat from step 1 to increase confidence.
;;        2-2. If step 2 fails, n is certainly composite.
;;             Thus, stop the test.
;;
;;     Notes:
;;       - The Fermat test does not produce false negatives.
;;       - The Fermat test produces false positives, particularly for Carmichael numbers.
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
  (fast-prime1-with-times? n 20))

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

;; Miller-Rabin Primality Test (Probabilistic Primality Test)
;;
;;   Modified Fermat's Little Theorem
;;
;;     If n is prime and a is an integer such that 0 < a < n:
;;       a^(n-1) and 1 are congruent modulo n (i.e. a^(n-1) ≡ 1 (mod n)).
;;
;;       a^(n-1) % n = 1 % n = 1
;;
;;     Notes:
;;       - If n is prime, the expression always succeeds.
;;       - If n is composite, the expression usually fails, but it may succeed.
;;
;;     In the recursive process of expmod, for an integer x such that 0 < x < n:
;;       x^2 % n = 1 % n = 1
;;
;;     Notes:
;;       - If n is an odd prime, the equation has no nontrivial solutions (i.e. x != 1 and x != n-1).
;;       - If n is composite, the equation may have nontrivial solutions.
;;
;;   Miller-Rabin Test
;;
;;     1. Choose a random integer a in the range [1, n-1].
;;     2. Check whether a^(n-1) % n = 1.
;;        2-1. In the recursive process of expmod, check whether x^2 % n = 1 for x != 1 and x != n-1.
;;             2-1-1. If step 2-1 succeeds, n is certainly composite.
;;                    Thus, expmod returns the special result (0).
;;             2-1-2. If step 2-1 fails, we cannot distinguish whether n is prime or composite.
;;                    Thus, expmod returns the normal result.
;;        2-2. If step 2 succeeds, n is probably prime.
;;             Thus, repeat from step 1 to increase confidence.
;;        2-3. If step 2 fails, n is certainly composite.
;;             Thus, stop the test.
;;
;;     Notes:
;;       - The Miller-Rabin test does not produce false negatives.
;;       - The Miller-Rabin test significantly improves upon the false-positive problem of the Fermat test,
;;         but it can still produce false positives.
;;
;;   Order of Growth
;;
;;     The time and space complexities depend on the implementation of checked-expmod.
;;
;;     time complexity:  Θ(log2(n))
;;     space complexity: Θ(log2(n))
;;
(define (fast-prime2? n)
  (fast-prime2-with-times? n 20))

(define (fast-prime2-with-times? n times)
  (define (checked-sqmod x m)
    (if (and (not (or (= x 1)
                      (= x (- m 1))))
             (= (remainder (* x x) m) 1))
        0
        (remainder (* x x) m)))
  (define (checked-expmod b n m)
    (cond ((= n 0)
           (cond ((= m 0) (remainder 0 0))
                 ((or (= m 1) (= m -1)) 0)
                 (else 1)))
          ((even?_ n)
           (checked-sqmod (checked-expmod b (/ n 2) m)
                          m))
          (else
           (remainder (* b (checked-expmod b (- n 1) m))
                      m))))
  (define (miller-rabin-test? n)
    (define (try a)
      (= (checked-expmod a (- n 1) n) 1))
    (try (+ (random (- n 1)) 1)))
  (define (iter i)
    (cond ((<= n 1) #f)
          ((= i 0) #t)
          ((miller-rabin-test? n) (iter (- i 1)))
          (else #f)))
  (iter times))

(define prime? prime0?)

;; Sieve of Eratosthenes
;;
;;   The Sieve of Eratosthenes is an algorithm that finds prime numbers by repeatedly eliminating composite numbers
;;   from 2 up to a given limit.
;;
;;           2(O)   3(O)   4(X)   5(O)   6(X)   7(O)   8(X)   9(X)  10(X)
;;   11(O)  12(X)  13(O)  14(X)  15(X)  16(X)  17(O)  18(X)  19(O)  20(X)
;;   21(X)  22(X)  23(O)  24(X)  25(X)  26(X)  27(X)  28(X)  29(O)  30(X)
;;   ...
;;
(define (primes-up-to limit)
  (let ((composites (make-vector (+ limit 1) #f)))
    (let ((half (quotient limit 2)))
      (define (sieve i)
        (define (mark-multiples j)
          (if (<= j limit)
              (begin
                (vector-set! composites j #t)
                (mark-multiples (+ j i)))))
        (if (<= i half)
            (begin
              (if (not (vector-ref composites i))
                  (mark-multiples (+ i i)))
              (sieve (+ i 1)))))
      (sieve 2))

    (define (count-primes count i)
      (cond ((> i limit)
             count)
            ((vector-ref composites i)
             (count-primes count (+ i 1)))
            (else
             (count-primes (+ count 1) (+ i 1)))))

    (let ((primes (make-vector (count-primes 0 2))))
      (define (store-primes i j)
        (cond ((> i limit)
               primes)
              ((vector-ref composites i)
               (store-primes (+ i 1) j))
              (else
               (vector-set! primes j i)
               (store-primes (+ i 1) (+ j 1)))))
      (store-primes 2 0))))
