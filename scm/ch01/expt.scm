(load "../common/math.scm")

;; Linear-Recursive Process (time complexity: Θ(n), space complexity: Θ(n))
;; 
;;   b^0 = 1
;;   b^n = b * b^(n-1)  (n >= 1)
;;
;; Substitution Model for (expt1 2 8)
;;
;;   (expt1 2 8)
;;   (* 2 (expt1 2 7))
;;   (* 2 (* 2 (expt1 2 6)))
;;   (* 2 (* 2 (* 2 (expt1 2 5))))
;;   (* 2 (* 2 (* 2 (* 2 (expt1 2 4)))))
;;   (* 2 (* 2 (* 2 (* 2 (* 2 (expt1 2 3))))))
;;   (* 2 (* 2 (* 2 (* 2 (* 2 (* 2 (expt1 2 2)))))))
;;   (* 2 (* 2 (* 2 (* 2 (* 2 (* 2 (* 2 (expt1 2 1))))))))
;;   (* 2 (* 2 (* 2 (* 2 (* 2 (* 2 (* 2 (* 2 (expt1 2 0)))))))))
;;   (* 2 (* 2 (* 2 (* 2 (* 2 (* 2 (* 2 (* 2 1))))))))
;;   (* 2 (* 2 (* 2 (* 2 (* 2 (* 2 (* 2 2)))))))
;;   (* 2 (* 2 (* 2 (* 2 (* 2 (* 2 4))))))
;;   (* 2 (* 2 (* 2 (* 2 (* 2 8)))))
;;   (* 2 (* 2 (* 2 (* 2 16))))
;;   (* 2 (* 2 (* 2 32)))
;;   (* 2 (* 2 64))
;;   (* 2 128)
;;   256
(define (expt1 b n)
  (if (= n 0)
      1
      (* b (expt1 b (- n 1)))))

;; Linear-Iterative Process (time complexity: Θ(n), space complexity: Θ(1))
;; 
;;   ab^n = abb^(n-1) = (ab)b^(n-1) = a'b'^n'
;;
;;   a' <- ab
;;   b' <- b
;;   n' <- n-1
;;
;; Substitution Model for (expt2 2 8)
;;
;;   (expt2 2 8)
;;   (iter 8 1)
;;   (iter 7 2)
;;   (iter 6 4)
;;   (iter 5 8)
;;   (iter 4 16)
;;   (iter 3 32)
;;   (iter 2 64)
;;   (iter 1 128)
;;   (iter 0 256)
;;   256
(define (expt2 b n)
  (define (iter i result)
    (if (= i 0)
        result
        (iter (- i 1)
              (* result b))))
  (iter n 1))

;; Logarithmic-Recursive Process (time complexity: Θ(log2(n)), space complexity: Θ(log2(n)))
;;
;;   b^0 = 1
;;   b^n = {b^(n/2)}^2  (n is even)
;;   b^n = b * b^(n-1)  (n is odd)
;;
;; Substitution Model for (fast-expt1 2 8)
;;
;;   (fast-expt1 2 8)
;;   (square (fast-expt1 2 4))
;;   (square (square (fast-expt1 2 2)))
;;   (square (square (square (fast-expt1 2 1))))
;;   (square (square (square (* 2 (fast-expt1 2 0)))))
;;   (square (square (square (* 2 1))))
;;   (square (square (square 2)))
;;   (square (square 4))
;;   (square 16)
;;   256
;;
;; Substitution Model for (fast-expt1 2 11)
;;
;;   (fast-expt1 2 11)
;;   (* 2 (fast-expt1 2 10))
;;   (* 2 (square (fast-expt1 2 5)))
;;   (* 2 (square (* 2 (fast-expt1 2 4))))
;;   (* 2 (square (* 2 (square (fast-expt1 2 2)))))
;;   (* 2 (square (* 2 (square (square (fast-expt1 2 1))))))
;;   (* 2 (square (* 2 (square (square (* 2 (fast-expt1 2 0)))))))
;;   (* 2 (square (* 2 (square (square (* 2 1))))))
;;   (* 2 (square (* 2 (square (square 2)))))
;;   (* 2 (square (* 2 (square 4))))
;;   (* 2 (square (* 2 16)))
;;   (* 2 (square 32))
;;   (* 2 1024)
;;   2048
(define (fast-expt1 b n)
  (cond ((= n 0) 1)
        ((even?_ n) (square (fast-expt1 b (/ n 2))))
        (else (* b (fast-expt1 b (- n 1))))))

(define expt_ expt1)
