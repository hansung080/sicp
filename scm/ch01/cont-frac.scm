;; Continued Fraction
;;
;;   N_1 / (D_1 + N_2 / (D_2 + N_3 / (D_3 + ...)))  (N: numerator, D: denominator)
;;
;; K-Term Finite Continued Fraction
;;
;;   N_1 / (D_1 + N_2 / (D_2 + N_3 / (D_3 + ... + N_k / D_k)))
;;
;; Recursive Process
(define (cont-frac1 n d k)
  (define (recur i)
    (if (= i k)
        (/ (n i) (d i))
        (/ (n i) (+ (d i) (recur (+ i 1))))))
  (recur 1))

;; Iterative Process
(define (cont-frac2 n d k)
  (define (iter result i)
    (if (= i 0)
        result
        (iter (/ (n i) (+ result (d i)))
              (- i 1))))
  (iter (/ (n k) (d k))
        (- k 1)))

(define cont-frac cont-frac2)
