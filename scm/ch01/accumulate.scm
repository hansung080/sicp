;; Higher-Order Accumulate
;;
;;   accumulate(combiner, null-value, term, a, next, b)
;;   = combiner(term(a), term(next(a)), term(next(next(a))), ..., term(b))
;;
;; Linear Recursive Process
(define (accumulate1 combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a)
                (accumulate1 combiner null-value term (next a) next b))))

;; Linear Iterative Process
(define (accumulate2 combiner null-value term a next b)
  (define (iter result a)
    (if (> a b)
        result
        (iter (combiner result (term a))
              (next a))))
  (iter null-value a))

(define accumulate accumulate2)
