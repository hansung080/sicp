;; Recursive Procedure That Generates a Recursive Process
;;
;;   Recurrence Relation
;;
;;     0! = 1
;;     n! = n * (n-1)!  (n >= 1)
;;
;;   Order of Growth
;;
;;     time complexity:  Θ(n)
;;     space complexity: Θ(n)
;;
;;   Substitution Model
;;
;;     The height represents time complexity, and the width represents space complexity.
;;
;;     (factorial1 5)
;;     (* 5 (factorial1 4))
;;     (* 5 (* 4 (factorial1 3)))
;;     (* 5 (* 4 (* 3 (factorial1 2))))
;;     (* 5 (* 4 (* 3 (* 2 (factorial1 1)))))
;;     (* 5 (* 4 (* 3 (* 2 (* 1 (factorial1 0))))))
;;     (* 5 (* 4 (* 3 (* 2 (* 1 1)))))
;;     (* 5 (* 4 (* 3 (* 2 1))))
;;     (* 5 (* 4 (* 3 2)))
;;     (* 5 (* 4 6))
;;     (* 5 24)
;;     120
;;
(define (factorial1 n)
  (if (= n 0)
      1
      (* n (factorial1 (- n 1)))))

;; Recursive Procedure That Generates an Iterative Process (Tail-Recursive Procedure)
;;
;;   Iteration Rule
;;
;;     result' <- result * i
;;     i'      <- i - 1
;;
;;   Order of Growth
;;
;;     Scheme provides proper tail recursion, ensuring that tail-recursive procedures run in constant space.
;;
;;     time complexity:  Θ(n)
;;     space complexity: Θ(1)
;;
;;   Substitution Model
;;
;;     (factorial2 5)
;;     (iter 1 1)
;;     (iter 1 2)
;;     (iter 2 3)
;;     (iter 6 4)
;;     (iter 24 5)
;;     (iter 120 6)
;;     120
;;
(define (factorial2 n)
  (define (iter result i)
    (if (> i n)
        result
        (iter (* result i)
              (+ i 1))))
  (iter 1 1))

(define factorial factorial2)
