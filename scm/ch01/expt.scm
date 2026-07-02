(define (expt1 b n)
  (if (= n 0)
      1
      (* b (expt1 b (- n 1)))))

(define expt_ expt1)
