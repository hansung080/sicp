(load "../common/math.scm")

(define (cbrt x)
  ;; y = y''
  (define (good-enough? guess next-guess)
    (= guess next-guess))
  ;; y'' <- (x / y^2 + 2y) / 3
  (define (improve guess)
    (/ (+ (/ x (square guess))
          (* 2 guess))
       3))
  (define (try guess)
    (let ((next-guess (improve guess)))
      (if (good-enough? guess next-guess)
          guess
          (try next-guess))))
  (try 1.0))
