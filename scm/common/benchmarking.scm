(#%require sicp) ; for runtime

(define (bench name thunk)
  (display "# BENCHMARK: ")
  (display name)
  (newline)
  (thunk))

(define (report-with name thunk elapsed unit)
  (display name)
  (display " => ")
  (display (thunk))
  (display " (")
  (display (elapsed thunk))
  (display unit)
  (display ")")
  (newline))

(define (report-microseconds name thunk)
  (report-with name thunk elapsed-microseconds "μs"))

(define (report-milliseconds name thunk)
  (report-with name thunk elapsed-milliseconds "ms"))

(define (report-seconds name thunk)
  (report-with name thunk elapsed-seconds "s"))

(define report report-microseconds)

;; `runtime` returns the elapsed time since the Unix epoch (1970-01-01 00:00:00 UTC) in microseconds.
(define (elapsed-microseconds thunk)
  (let ((start (runtime)))
    (thunk)
    (- (runtime) start)))

(define (elapsed-milliseconds thunk)
  (exact->inexact (/ (elapsed-microseconds thunk) 1000)))

(define (elapsed-seconds thunk)
  (exact->inexact (/ (elapsed-microseconds thunk) 1000000)))
