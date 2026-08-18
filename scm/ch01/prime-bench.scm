(load "../common/benchmarking.scm")
(load "prime.scm")

(define (timed-prime-test-by n prime?)
  (define (report)
    (display n)
    (display " (")
    (display (elapsed-microseconds (lambda () (prime? n))))
    (display "μs)")
    (newline))
  (if (prime? n)
      (report)))

(define (search-for-primes-by lower upper prime?)
  (define (iter i)
    (if (<= i upper)
        (begin
          (timed-prime-test-by i prime?)
          (iter (+ i 2)))))
  (iter (if (odd?_ lower)
            lower
            (+ lower 1))))

(bench "(search-for-primes-by/prime0? lower upper)"
       (lambda ()
         (search-for-primes-by 1000 1019 prime0?)
         (newline)
         (search-for-primes-by 10000 10037 prime0?)
         (newline)
         (search-for-primes-by 100000 100043 prime0?)
         (newline)
         (search-for-primes-by 1000000 1000037 prime0?)
         (newline)))

(bench "(search-for-primes-by/fast-prime1-with-times10? lower upper)"
       (lambda ()
         (define (fast-prime1-with-times10? n)
           (fast-prime1-with-times? n 10))
         (search-for-primes-by 1000 1019 fast-prime1-with-times10?)
         (newline)
         (search-for-primes-by 10000 10037 fast-prime1-with-times10?)
         (newline)
         (search-for-primes-by 100000 100043 fast-prime1-with-times10?)
         (newline)
         (search-for-primes-by 1000000 1000037 fast-prime1-with-times10?)
         (newline)))

(bench "(search-for-primes-by/fast-prime2-with-times10? lower upper)"
       (lambda ()
         (define (fast-prime2-with-times10? n)
           (fast-prime2-with-times? n 10))
         (search-for-primes-by 1000 1019 fast-prime2-with-times10?)
         (newline)
         (search-for-primes-by 10000 10037 fast-prime2-with-times10?)
         (newline)
         (search-for-primes-by 100000 100043 fast-prime2-with-times10?)
         (newline)
         (search-for-primes-by 1000000 1000037 fast-prime2-with-times10?)
         (newline)))

(bench "(primes-up-to 100)"
       (lambda ()
         (report "(primes1-up-to/by/prime0? 100)"
                 (lambda () (primes1-up-to/by 100 prime0?)))
         (report "(primes1-up-to/by/fast-prime1? 100)"
                 (lambda () (primes1-up-to/by 100 fast-prime1?)))
         (report "(primes1-up-to/by/fast-prime2? 100)"
                 (lambda () (primes1-up-to/by 100 fast-prime2?)))
         (report "(primes2-up-to/list 100)"
                 (lambda () (primes2-up-to/list 100)))
         (report "(primes2-up-to/vector 100)"
                 (lambda () (primes2-up-to/vector 100)))
         (newline)))

(bench "(length (primes-up-to 1000))"
       (lambda ()
         (report "(length (primes1-up-to/by/prime0? 1000))"
                 (lambda () (length (primes1-up-to/by 1000 prime0?))))
         (report "(length (primes1-up-to/by/fast-prime1? 1000))"
                 (lambda () (length (primes1-up-to/by 1000 fast-prime1?))))
         (report "(length (primes1-up-to/by/fast-prime2? 1000))"
                 (lambda () (length (primes1-up-to/by 1000 fast-prime2?))))
         (report "(length (primes2-up-to/list 1000))"
                 (lambda () (length (primes2-up-to/list 1000))))
         (report "(length (primes2-up-to/vector 1000))"
                 (lambda () (vector-length (primes2-up-to/vector 1000))))
         (newline)))

(bench "(primes-between 1000000 1000037)"
       (lambda ()
         (report "(primes1-between/by/prime0? 1000000 1000037)"
                 (lambda () (primes1-between/by 1000000 1000037 prime0?)))
         (report "(primes1-between/by/fast-prime1? 1000000 1000037)"
                 (lambda () (primes1-between/by 1000000 1000037 fast-prime1?)))
         (report "(primes1-between/by/fast-prime2? 1000000 1000037)"
                 (lambda () (primes1-between/by 1000000 1000037 fast-prime2?)))
         (report "(primes2-between/list 1000000 1000037)"
                 (lambda () (primes2-between/list 1000000 1000037)))
         (report "(primes2-between/vector 1000000 1000037)"
                 (lambda () (primes2-between/vector 1000000 1000037)))))
