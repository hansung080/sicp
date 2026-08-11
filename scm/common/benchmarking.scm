(#%require sicp) ; for runtime

(define (bench name thunk)
  (display "# BENCHMARK: ")
  (display name)
  (newline)
  (thunk))

;; `runtime` returns the elapsed time since the Unix epoch (1970-01-01 00:00:00 UTC) in microseconds.
(define (elapsed-microseconds thunk)
  (let ((start (runtime)))
    (thunk)
    (- (runtime) start)))

(define (elapsed-milliseconds thunk)
  (exact->inexact (/ (elapsed-microseconds thunk) 1000)))

(define (elapsed-seconds thunk)
  (exact->inexact (/ (elapsed-microseconds thunk) 1000000)))
