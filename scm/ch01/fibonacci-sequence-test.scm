(load "../common/testing.scm")
(load "expt.scm")
(load "sqrt.scm")

;; Fibonacci Sequence Recurrence Relation
;;
;;   Fib(0) = 0
;;   Fib(1) = 1
;;   Fib(n) = Fib(n-1) + Fib(n-2)  (n >= 2)
;;
;; Substitution Model for Recursive Procedure That Generates a Tree-Recursive Process
;;
;;   (fib1 5)
;;   (+ (fib1 4) (fib1 3))
;;   (+ (+ (fib1 3) (fib1 2)) (fib1 3))
;;   (+ (+ (+ (fib1 2) (fib1 1)) (fib1 2)) (fib1 3))
;;   (+ (+ (+ (+ (fib1 1) (fib1 0)) (fib1 1)) (fib1 2)) (fib1 3))
;;   (+ (+ (+ (+ 1 (fib1 0)) (fib1 1)) (fib1 2)) (fib1 3))
;;   (+ (+ (+ (+ 1 0) (fib1 1)) (fib1 2)) (fib1 3))
;;   (+ (+ (+ 1 (fib1 1)) (fib1 2)) (fib1 3))
;;   (+ (+ (+ 1 1) (fib1 2)) (fib1 3))
;;   (+ (+ 2 (fib1 2)) (fib1 3))
;;   (+ (+ 2 (+ (fib1 1) (fib1 0))) (fib1 3))
;;   (+ (+ 2 (+ 1 (fib1 0))) (fib1 3))
;;   (+ (+ 2 (+ 1 0)) (fib1 3))
;;   (+ (+ 2 1) (fib1 3))
;;   (+ 3 (fib1 3))
;;   (+ 3 (+ (fib1 2) (fib1 1)))
;;   (+ 3 (+ (+ (fib1 1) (fib1 0)) (fib1 1)))
;;   (+ 3 (+ (+ 1 (fib1 0)) (fib1 1)))
;;   (+ 3 (+ (+ 1 0) (fib1 1)))
;;   (+ 3 (+ 1 (fib1 1)))
;;   (+ 3 (+ 1 1))
;;   (+ 3 2)
;;   5
;;
;; Tree-Recursive Process
;;
;;                                            (fib1 5)
;;                          (fib1 4)                             (fib1 3)
;;               (fib1 3)              (fib1 2)           (fib1 2)      (fib1 1)
;;        (fib1 2)      (fib1 1)  (fib1 1) (fib1 0)  (fib1 1) (fib1 0)  1
;;   (fib1 1) (fib1 0)  1         1        0         1        0
;;   1        0
;;
(define (fib1 n)
  (cond ((= n 0) 0)
        ((= n 1) 1)
        (else (+ (fib1 (- n 1))
                 (fib1 (- n 2))))))

;; Iteration Rule for Recursive Procedure That Generates a Linear-Iterative Process (Tail-Recursive Procedure)
;;
;;   Loop Invariant:
;;     (a, b) = (Fib(i), Fib(i+1))
;;
;;   Iteration Rule:
;;     a' <- b
;;     b' <- a + b
;; 
;; Linear-Iterative Process
;;
;;   n:        0 1 2 3 4 5 6  7  8 ...
;;   (fib2 n): 0 1 1 2 3 5 8 13 21 ...
;;   i=0:      a b
;;   i=1:        a b
;;   i=2:          a b
;;   ...
;;
(define (fib2 n)
  (define (iter a b i)
    (if (= i n)
        a
        (iter b
              (+ a b)
              (+ i 1))))
  (iter 0 1 0))

;; Fibonacci Sequence Formula Using Golden Ratio (φ)
;;
;;   Fib(n) = round(φ^n / sqrt(5))  (φ^2 = φ + 1, φ = (1 + sqrt(5)) / 2 = 1.6180...)
;;
(define φ (/ (+ 1 (sqrt_ 5)) 2))

(define (fib3 n)
  (round_ (/ (expt_ φ n) (sqrt_ 5))))

;; Iteration Rule for Recursive Procedure That Generates a Logarithmic-Iterative Process (Tail-Recursive Procedure)
;;
;;   Let T is the iteration rule for a linear-iterative process:
;;     T(a, b) = (a + b, a)
;;     T^n(1, 0) = (Fib(n+1), Fib(n))
;;
;;   Let Tpq is the iteration rule for a logarithmic-iterative process:
;;     Tpq(a, b) = (bq + aq + ap, bp + aq)
;;     T01(a, b) = T(a, b)
;;     Tp'q'(a, b) = Tpq(Tpq(a, b)) = Tpq^2(a, b)
;;
;;   Find p' and q' such that Tp'q'(a, b) = Tpq^2(a, b):
;;     Tpq^2(a, b) = ((bp + aq)q + (bq + aq + ap)q + (bq + aq + ap)p,    (bp + aq)p + (bq + aq + ap)q)
;;                 = (bpq + aq^2 + bq^2 + aq^2 + apq + bpq + apq + ap^2, bp^2 + apq + bq^2 + aq^2 + apq)
;;                 = (b(2pq + q^2) + a(2pq + q^2) + a(p^2 + q^2),        b(p^2 + q^2) + a(2pq + q^2))
;;     p' = p^2 + q^2
;;     q' = 2pq + q^2
;;
;;   Thus, the iteration rule is:
;;     When i = 0:
;;       Return b.
;;
;;     When i is even:
;;       a' <- a
;;       b' <- b
;;       p' <- p^2 + q^2
;;       q' <- 2pq + q^2
;;       i' <- i/2
;;
;;     When n is odd:
;;       a' <- bq + aq + ap
;;       b' <- bp + aq
;;       p' <- p
;;       q' <- q
;;       i' <- i-1
;;
(define (fib4 n)
  (define (iter a b p q i)
    (cond ((= i 0)
           b)
          ((even?_ i)
           (iter a
                 b
                 (+ (* p p) (* q q))
                 (+ (* 2 p q) (* q q))
                 (/ i 2)))
          (else
           (iter (+ (* b q) (* a q) (* a p))
                 (+ (* b p) (* a q))
                 p
                 q
                 (- i 1)))))
  (iter 1 0 0 1 n))

(test "fibonacci-sequence1"
      (lambda ()
        (assert-eq (fib1 0) 0)
        (assert-eq (fib1 1) 1)
        (assert-eq (fib1 2) 1)
        (assert-eq (fib1 3) 2)
        (assert-eq (fib1 4) 3)
        (assert-eq (fib1 5) 5)
        (assert-eq (fib1 6) 8)
        (assert-eq (fib1 7) 13)
        (assert-eq (fib1 8) 21)))

(test "fibonacci-sequence2"
      (lambda ()
        (assert-eq (fib2 0) 0)
        (assert-eq (fib2 1) 1)
        (assert-eq (fib2 2) 1)
        (assert-eq (fib2 3) 2)
        (assert-eq (fib2 4) 3)
        (assert-eq (fib2 5) 5)
        (assert-eq (fib2 6) 8)
        (assert-eq (fib2 7) 13)
        (assert-eq (fib2 8) 21)))

(test "fibonacci-sequence3"
      (lambda ()
        (assert-eq (fib3 0) 0.0)
        (assert-eq (fib3 1) 1.0)
        (assert-eq (fib3 2) 1.0)
        (assert-eq (fib3 3) 2.0)
        (assert-eq (fib3 4) 3.0)
        (assert-eq (fib3 5) 5.0)
        (assert-eq (fib3 6) 8.0)
        (assert-eq (fib3 7) 13.0)
        (assert-eq (fib3 8) 21.0)))

(test "fibonacci-sequence4"
      (lambda ()
        (assert-eq (fib4 0) 0)
        (assert-eq (fib4 1) 1)
        (assert-eq (fib4 2) 1)
        (assert-eq (fib4 3) 2)
        (assert-eq (fib4 4) 3)
        (assert-eq (fib4 5) 5)
        (assert-eq (fib4 6) 8)
        (assert-eq (fib4 7) 13)
        (assert-eq (fib4 8) 21)))
