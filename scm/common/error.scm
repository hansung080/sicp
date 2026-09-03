(define (error0 msg . args)
  (define port (current-error-port))
  (display "error: " port)
  (display msg port)
  (define (print-args args)
    (if (not (null? args))
        (begin
          (display " " port)
          (write (car args) port)
          (print-args (cdr args)))))
  (print-args args)
  (newline port))

(define error error0)
; (#%require sicp) ; for error
