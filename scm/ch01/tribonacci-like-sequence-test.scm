(load "../common/testing.scm")

;; Tribonacci Sequence Recurrence Relation
;;
;;   Trib(0) = 0
;;   Trib(1) = 0
;;   Trib(2) = 1
;;   Trib(n) = Fib(n-1) + Fib(n-2) + Fib(n-3)  (n >= 3)
;;
;; Tribonacci-like Sequence Recurrence Relation
;;
;;   f(n) = n                         (n < 3)
;;   f(n) = f(n-1) + f(n-2) + f(n-3)  (n >= 3)
;;
;; Recursive Procedure That Generates a Tree-Recursive Process
(define (f1 n)
  (if (< n 3)
      n
      (+ (f1 (- n 1))
         (f1 (- n 2))
         (f1 (- n 3)))))

;; Iteration Rule for Recursive Procedure That Generates a Linear-Iterative Process (Tail-Recursive Procedure)
;;
;;   Loop Invariant: (a, b, c) = (f(i), f(i+1), f(i+2))
;;
;;   a' <- b
;;   b' <- c
;;   c' <- a + b + c
;;
;; Linear-Iterative Process
;;
;;   n:      0 1 2 3 4  5  6  7  8 ...
;;   (f2 n): 0 1 2 3 6 11 20 37 68 ...
;;   i=0:    a b c
;;   i=1:      a b c
;;   i=2:        a b c
;;   ...
;;
(define (f2 n)
  (define (iter a b c i)
    (if (= i n)
        a
        (iter b
              c
              (+ a b c)
              (+ i 1))))
  (iter 0 1 2 0))

(test "tribonacci-like-sequence1"
      (lambda ()
        (assert-eq (f1 0) 0)
        (assert-eq (f1 1) 1)
        (assert-eq (f1 2) 2)
        (assert-eq (f1 3) 3)
        (assert-eq (f1 4) 6)
        (assert-eq (f1 5) 11)
        (assert-eq (f1 6) 20)
        (assert-eq (f1 7) 37)
        (assert-eq (f1 8) 68)))

(test "tribonacci-like-sequence2"
      (lambda ()
        (assert-eq (f2 0) 0)
        (assert-eq (f2 1) 1)
        (assert-eq (f2 2) 2)
        (assert-eq (f2 3) 3)
        (assert-eq (f2 4) 6)
        (assert-eq (f2 5) 11)
        (assert-eq (f2 6) 20)
        (assert-eq (f2 7) 37)
        (assert-eq (f2 8) 68)))
