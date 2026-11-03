(load "../common/math.scm")

;; Fixed Point of Function
;;
;;   A root of the equation f(x) = x is called a fixed point of the function f.
;;   In other words, if we give f an initial guess and repeatedly apply f as shown below,
;;   the value that remains unchanged under f is called a fixed point of f.
;;
;;   f(x_1) = x_2  (x_1 is the initial guess)
;;   f(x_2) = x_3
;;   f(x_3) = x_4
;;   ...
;;   f(x_n) = x_(n+1)  (x_n = x_(n+1); x_n is a fixed point of f)
;;
(define (fixed-point-with f initial-guess close-enough?)
  (define (try guess)
    (let ((next-guess (f guess)))
      (if (close-enough? guess next-guess)
          next-guess
          (try next-guess))))
  (try initial-guess))

(define fixed-point-tolerance 0.00001)

;; GOOD: Find the fixed point of `f` using exact equality: x_n = x_(n+1),
;;       which may cause a termination failure due to a cycle.
(define (fixed-point-exact f initial-guess)
  (fixed-point-with f
                    initial-guess
                    (lambda (guess next-guess) (= guess next-guess))))

;; BETTER: Find the fixed point of `f` using absolute error: |x_n - x_(n+1)| < tolerance,
;;         which may cause an accuracy problem.
(define (fixed-point-abs-err f initial-guess)
  (fixed-point-with f
                    initial-guess
                    (lambda (guess next-guess) (< (abs_ (- guess next-guess)) fixed-point-tolerance))))

;; BEST: Find the fixed point of `f` using relative error: |{x_n - x_(n+1)} / x_(n+1)| < tolerance,
;;       which may cause an accuracy problem.
(define (fixed-point-rel-err f initial-guess)
  (fixed-point-with f
                    initial-guess
                    (lambda (guess next-guess) (< (abs_ (/ (- guess next-guess) next-guess)) fixed-point-tolerance))))

;; BEST+: Find the fixed point of `f` using checked exact equality: x_n = x_(n+1) or x_(n+1) = x_(n-1),
;;        which detects a 2-cycle to allow termination.
(define (fixed-point-checked f initial-guess)
  (define (close-enough? guess next-guess prev-guess)
    (or (= guess next-guess)
        (= next-guess prev-guess)))
  (define (try guess prev-guess)
    (let ((next-guess (f guess)))
      (if (close-enough? guess next-guess prev-guess)
          next-guess
          (try next-guess guess))))
  (try initial-guess initial-guess))

(define fixed-point fixed-point-checked)
