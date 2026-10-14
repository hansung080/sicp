(define (positive?_ x)
  (> x 0))

(define (negative?_ x)
  (< x 0))

(define (even?_ n)
  (= (remainder_ n 2) 0))

(define (odd?_ n)
  (not (even?_ n)))

(define (abs_ x)
  (if (< x 0)
      (- x)
      x))

;; Return the quotient of truncating division.
(define (quotient_ m n)
  (truncate (/ m n)))

;; Return the quotient of floor division.
(define (floor-quotient m n)
  (floor_ (/ m n)))

;; Return the remainder of truncating division.
(define (remainder_ m n)
  (- m (* n (quotient_ m n))))

;; Return the remainder of floor division.
(define (modulo_ m n)
  (- m (* n (floor-quotient m n))))

;; Return the greatest integer less than or equal to `x`.
(define (floor_ x)
  (let ((i (truncate x)))
    (if (or (>= x 0)
            (= x i))
        i
        (- i 1))))

;; Return the least integer greater than or equal to `x`.
(define (ceiling_ x)
  (let ((i (truncate x)))
    (if (or (<= x 0)
            (= x i))
        i
        (+ i 1))))

;; Return the nearest integer to `x` (ties up).
(define (round-half-up x)
  (let* ((lo (floor_ x))
         (hi (+ lo 1))
         (d (- x lo)))
    (if (< d 0.5)
        lo
        hi)))

;; Return the nearest integer to `x` (ties down).
(define (round-half-down x)
  (let* ((lo (floor_ x))
         (hi (+ lo 1))
         (d (- x lo)))
    (if (<= d 0.5)
        lo
        hi)))

;; Return the nearest integer to `x` (ties away from zero).
;; (adopted by the C standard library)
(define (round-half-away-from-zero1 x)
  (let* ((lo (floor_ x))
         (hi (+ lo 1))
         (d (- x lo)))
    (cond ((< d 0.5) lo)
          ((> d 0.5) hi)
          ((>= x 0) hi)
          (else lo))))

;; Return the nearest integer to `x` (ties away from zero).
;; (adopted by the C standard library; traditional implementation; exact-to-inexact conversion occurs)
(define (round-half-away-from-zero2 x)
  (if (>= x 0)
      (floor_ (+ x 0.5))
      (ceiling_ (- x 0.5))))

(define round-half-away-from-zero round-half-away-from-zero1)

;; Return the nearest integer to `x` (ties toward zero).
(define (round-half-toward-zero x)
  (let* ((lo (floor_ x))
         (hi (+ lo 1))
         (d (- x lo)))
    (cond ((< d 0.5) lo)
          ((> d 0.5) hi)
          ((>= x 0) lo)
          (else hi))))

;; Return the nearest integer to `x` (ties to even).
;; (adopted by IEEE 754, Scheme, and Python; aka banker's rounding)
(define (round-half-to-even x)
  (let* ((lo (floor_ x))
         (hi (+ lo 1))
         (d (- x lo)))
    (cond ((< d 0.5) lo)
          ((> d 0.5) hi)
          ((even?_ lo) lo)
          (else hi))))

;; Return the nearest integer to `x` (ties to odd).
(define (round-half-to-odd x)
  (let* ((lo (floor_ x))
         (hi (+ lo 1))
         (d (- x lo)))
    (cond ((< d 0.5) lo)
          ((> d 0.5) hi)
          ((odd?_ lo) lo)
          (else hi))))

(define round_ round-half-to-even)

(define (identity x)
  x)

(define (inc x)
  (+ x 1))

(define (dec x)
  (- x 1))

(define (square x)
  (* x x))

(define (cube x)
  (* x x x))

(define (average x y)
  (/ (+ x y) 2))

;; Check whether `divisor` divides `dividend` (i.e. divisor ∣ dividend; ∣ denotes DIVIDES (U+2223)).
(define (divides? divisor dividend)
  (= (remainder_ dividend divisor) 0))

;; Expt (Logarithmic Iterative Process)
(define (expt0 b n)
  (define (iter a b n)
    (cond ((= n 0) a)
          ((even?_ n) (iter a (* b b) (/ n 2)))
          (else (iter (* a b) b (- n 1)))))
  (iter 1 b n))

;; Exprem (Logarithmic Recursive Process)
;;
;;   Remainder Property
;;
;;     (a * b) % m = {(a % m) * (b % m)} % m
;;     (a * b) % m = {(a % m) * b} % m
;;     (a * b) % m = {a * (b % m)} % m
;;
;;   Recurrence Relation
;;
;;     b^0 % m = error (m = 0), 0 (m = 1 or -1), 1 (else)
;;     b^n % m = {b^(n/2) % m}^2 % m    (n is even)
;;     b^n % m = b * {b^(n-1) % m} % m  (n is odd)
;;
;;   Order of Growth
;;
;;     Time complexity:  Θ(log2(n))
;;     Space complexity: Θ(log2(n))
;;
(define (exprem b n m)
  (cond ((= n 0)
         (cond ((= m 0) (remainder_ 0 0))
               ((or (= m 1) (= m -1)) 0)
               (else 1)))
        ((even?_ n)
         (remainder_ (square (exprem b (/ n 2) m))
                     m))
        (else
         (remainder_ (* b (exprem b (- n 1) m))
                     m))))

(define (lshift m n)
  (* m (expt0 2 n)))

(define (rshift1 m n)
  (inexact->exact
   (floor_ (/ m (expt0 2 n)))))

(define (rshift2 m n)
  (let ((d (expt0 2 n)))
    (if (>= m 0)
        (quotient_ m d)
        (- (quotient_ (+ (- m) d -1) d)))))

(define rshift rshift2)
