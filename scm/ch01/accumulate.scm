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

;; Higher-Order Filtered-Accumulate
;;
;;   filtered-accumulate(predicate?, combiner, null-value, term, a, next, b)
;;   = combiner(term(a), term(next(a)), term(next(next(a))), ..., term(b))
;;     for values a' where predicate?(a') is true
;;
;; Linear Recursive Process
(define (filtered-accumulate1 predicate? combiner null-value term a next b)
  (cond ((> a b) null-value)
        ((predicate? a) (combiner (term a)
                                  (filtered-accumulate1 predicate? combiner null-value term (next a) next b)))
        (else (filtered-accumulate1 predicate? combiner null-value term (next a) next b))))

;; Linear Iterative Process
(define (filtered-accumulate2 predicate? combiner null-value term a next b)
  (define (iter result a)
    (cond ((> a b) result)
          ((predicate? a) (iter (combiner result (term a))
                                (next a)))
          (else (iter result (next a)))))
  (iter null-value a))

(define filtered-accumulate filtered-accumulate2)
