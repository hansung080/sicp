;; Factorial Recurrence Relation
;; 
;;   0! = 1
;;   n! = n * (n-1)!  (n >= 1)
;;
;; Recursive procedure that generates a recursive process
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
(define (factorial1 n)
  (if (= n 0)
      1
      (* n (factorial1 (- n 1)))))

;; Recursive procedure that generates an iterative process (tail-recursive procedure)
;;
;;   (factorial2 5)
;;   (iter 5 1)
;;   (iter 4 5)
;;   (iter 3 20)
;;   (iter 2 60)
;;   (iter 1 120)
;;   (iter 0 120)
;;   120
(define (factorial2 n)
  (define (iter i result)
    (if (= i 0)
        result
        (iter (- i 1)
              (* result i))))
  (iter n 1))

(define factorial factorial2)
