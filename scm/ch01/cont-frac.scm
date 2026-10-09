;; Continued Fraction
;;
;;   N_1 / (D_1 + N_2 / (D_2 + N_3 / (D_3 + ...)))  (N: numerator, D: denominator)
;;
;; K-Term Finite Continued Fraction
;;
;;   N_1 / (D_1 + N_2 / (D_2 + N_3 / (D_3 + ... + N_k / D_k)))
;;
;;   When implementing it, add a virtual (k+1)th term, 0 (the additive identity), after the kth term,
;;   so that the kth term can be treated as a recursive case, not a base case.
;;
;;   N_1 / (D_1 + N_2 / (D_2 + N_3 / (D_3 + ... + N_k / (D_k + 0))))
;;
;; Recursive Process
(define (cont-frac1 n d k)
  (define (recur i)
    (if (> i k)
        0
        (/ (n i) (+ (d i) (recur (+ i 1))))))
  (recur 1))

;; Iterative Process
(define (cont-frac2 n d k)
  (define (iter result i)
    (if (= i 0)
        result
        (iter (/ (n i) (+ (d i) result))
              (- i 1))))
  (iter 0 k))

(define cont-frac cont-frac2)
