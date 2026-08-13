;; Unlike the built-in quotient, which raises an error if m or n is not an integer,
;; the user-defined quotient_ does not.
;; ```
;; (define (quotient_ m n)
;;   (truncate (/ m n)))
;; ```
;;
;; Unlike the built-in remainder, which raises an error if m or n is not an integer,
;; the user-defined remainder_ does not.
;; ```
;; (define (remainder_ m n)
;;   (- m (* n (truncate (/ m n)))))
;; ```

(define (abs_ x)
  (if (< x 0)
      (- x)
      x))

(define (even?_ n)
  (= (remainder n 2) 0))

(define (odd?_ n)
  (not (even?_ n)))

;; floor(x) = the greatest integer less than or equal to x
(define (floor_ x)
  (let ((i (truncate x)))
    (if (or (>= x 0)
            (= x i))
        i
        (- i 1))))

;; ceiling(x) = the least integer greater than or equal to x
(define (ceiling_ x)
  (let ((i (truncate x)))
    (if (or (<= x 0)
            (= x i))
        i
        (+ i 1))))

;; round-half-up(x) = the nearest integer to x; ties up
(define (round-half-up x)
  (let* ((lo (floor_ x))
         (hi (+ lo 1))
         (d (- x lo)))
    (if (< d 0.5)
        lo
        hi)))

;; round-half-down(x) = the nearest integer to x; ties down
(define (round-half-down x)
  (let* ((lo (floor_ x))
         (hi (+ lo 1))
         (d (- x lo)))
    (if (<= d 0.5)
        lo
        hi)))

;; round-half-away-from-zero1(x) = the nearest integer to x; ties away from zero
;; (adopted by the C standard library)
(define (round-half-away-from-zero1 x)
  (let* ((lo (floor_ x))
         (hi (+ lo 1))
         (d (- x lo)))
    (cond ((< d 0.5) lo)
          ((> d 0.5) hi)
          ((>= x 0) hi)
          (else lo))))

;; round-half-away-from-zero2(x) = the nearest integer to x; ties away from zero
;; (adopted by the C standard library; traditional implementation; exact-to-inexact conversion occurs)
(define (round-half-away-from-zero2 x)
  (if (>= x 0)
      (floor_ (+ x 0.5))
      (ceiling_ (- x 0.5))))

(define round-half-away-from-zero round-half-away-from-zero1)

;; round-half-toward-zero(x) = the nearest integer to x; ties toward zero
(define (round-half-toward-zero x)
  (let* ((lo (floor_ x))
         (hi (+ lo 1))
         (d (- x lo)))
    (cond ((< d 0.5) lo)
          ((> d 0.5) hi)
          ((>= x 0) lo)
          (else hi))))

;; round-half-to-even(x) = the nearest integer to x; ties to even
;; (aka banker's rounding; adopted by IEEE 754, Scheme, and Python)
(define (round-half-to-even x)
  (let* ((lo (floor_ x))
         (hi (+ lo 1))
         (d (- x lo)))
    (cond ((< d 0.5) lo)
          ((> d 0.5) hi)
          ((even?_ lo) lo)
          (else hi))))

;; round-half-to-odd(x) = the nearest integer to x; ties to odd
(define (round-half-to-odd x)
  (let* ((lo (floor_ x))
         (hi (+ lo 1))
         (d (- x lo)))
    (cond ((< d 0.5) lo)
          ((> d 0.5) hi)
          ((odd?_ lo) lo)
          (else hi))))

(define round_ round-half-to-even)

(define (square x)
  (* x x))

(define (cube x)
  (* x x x))

(define (average x y)
  (/ (+ x y) 2))

(define (<< m n)
  (* m (expt 2 n)))

(define (>>1 m n)
  (inexact->exact
   (floor_ (/ m (expt 2 n)))))

(define (>>2 m n)
  (let ((d (expt 2 n)))
    (if (>= m 0)
        (quotient m d)
        (- (quotient (+ (- m) d -1) d)))))

(define >> >>2)

;; Check whether `divisor` divides `dividend` (i.e. divisor ∣ dividend; ∣ denotes DIVIDES (U+2223)).
(define (divides? divisor dividend)
  (= (remainder dividend divisor) 0))

;; Expmod (Logarithmic Recursive Process)
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
;;     time complexity:  Θ(log2(n))
;;     space complexity: Θ(log2(n))
;;
(define (expmod b n m)
  (cond ((= n 0)
         (cond ((= m 0) (remainder 0 0))
               ((or (= m 1) (= m -1)) 0)
               (else 1)))
        ((even?_ n)
         (remainder (square (expmod b (/ n 2) m))
                    m))
        (else
         (remainder (* b (expmod b (- n 1) m))
                    m))))
