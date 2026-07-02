(load "../common/testing.scm")
(load "expt.scm")
(load "sqrt.scm")

;; Fibonacci Sequence Recurrence Relation
;;
;;   Fib(0) = 0
;;   Fib(1) = 1
;;   Fib(n) = Fib(n-1) + Fib(n-2)  (n >= 2)
;;
;; Substitution Model for Recursive Procedure that Generates a Tree-recursive Process
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
;; Tree-recursive Process (f5 is (fib1 5))
;;
;;                       f5
;;             f4                f3
;;        f3        f2        f2    f1
;;     f2    f1   f1  f0    f1  f0  1
;;   f1  f0  1    1   0     1   0
;;   1   0
(define (fib1 n)
  (cond ((= n 0) 0)
        ((= n 1) 1)
        (else (+ (fib1 (- n 1))
                 (fib1 (- n 2))))))

;; Fibonacci Sequence Using Golden Ratio (φ)
;;
;;   Fib(n) = round(φ^n / sqrt(5))  (φ^2 = φ + 1, φ = (1 + sqrt(5)) / 2 = 1.6180...)
(define φ (/ (+ 1 (sqrt_ 5)) 2))

(define (fib3 n)
  (round_ (/ (expt_ φ n) (sqrt_ 5))))

(test "fib1"
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

(test "fib3"
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
