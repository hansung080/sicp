;; Factorial Recurrence Relation
;; 
;;   0! = 1
;;   n! = n * (n-1)!  (n >= 1)
;;
;; Substitution Model for Recursive Procedure That Generates a Recursive Process
;;
;;   (factorial1 5)
;;   (* 5 (factorial1 4))
;;   (* 5 (* 4 (factorial1 3)))
;;   (* 5 (* 4 (* 3 (factorial1 2))))
;;   (* 5 (* 4 (* 3 (* 2 (factorial1 1)))))
;;   (* 5 (* 4 (* 3 (* 2 (* 1 (factorial1 0))))))
;;   (* 5 (* 4 (* 3 (* 2 (* 1 1)))))
;;   (* 5 (* 4 (* 3 (* 2 1))))
;;   (* 5 (* 4 (* 3 2)))
;;   (* 5 (* 4 6))
;;   (* 5 24)
;;   120
;;
(define (factorial1 n)
  (if (= n 0)
      1
      (* n (factorial1 (- n 1)))))

;; Substitution Model for Recursive Procedure That Generates an Iterative Process (Tail-Recursive Procedure)
;;
;;   (factorial2 5)
;;   (iter 1 5)
;;   (iter 5 4)
;;   (iter 20 3)
;;   (iter 60 2)
;;   (iter 120 1)
;;   (iter 120 0)
;;   120
;;
(define (factorial2 n)
  (define (iter result i)
    (if (= i 0)
        result
        (iter (* result i)
              (- i 1))))
  (iter 1 n))

(define factorial factorial2)
