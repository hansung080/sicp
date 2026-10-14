(load "math.scm")
(load "testing.scm")

(test "positive?_"
      (lambda ()
        (assert-eq (positive?_ 0) #f)
        (assert-eq (positive?_ 3) #t)
        (assert-eq (positive?_ -3) #f)
        (assert-eq (positive?_ 3.5) #t)
        (assert-eq (positive?_ -3.5) #f)))

(test "negative?_"
      (lambda ()
        (assert-eq (negative?_ 0) #f)
        (assert-eq (negative?_ 3) #f)
        (assert-eq (negative?_ -3) #t)
        (assert-eq (negative?_ 3.5) #f)
        (assert-eq (negative?_ -3.5) #t)))

(test "even?_"
      (lambda ()
        (assert-eq (even?_ 0) #t)
        (assert-eq (even?_ 1) #f)
        (assert-eq (even?_ 2) #t)
        (assert-eq (even?_ 3) #f)
        (assert-eq (even?_ 4) #t)
        (assert-eq (even?_ -1) #f)
        (assert-eq (even?_ -2) #t)
        (assert-eq (even?_ -3) #f)
        (assert-eq (even?_ -4) #t)))

(test "odd?_"
      (lambda ()
        (assert-eq (odd?_ 0) #f)
        (assert-eq (odd?_ 1) #t)
        (assert-eq (odd?_ 2) #f)
        (assert-eq (odd?_ 3) #t)
        (assert-eq (odd?_ 4) #f)
        (assert-eq (odd?_ -1) #t)
        (assert-eq (odd?_ -2) #f)
        (assert-eq (odd?_ -3) #t)
        (assert-eq (odd?_ -4) #f)))

(test "abs_"
      (lambda ()
        (assert-eq (abs_ 0) 0)
        (assert-eq (abs_ 3) 3)
        (assert-eq (abs_ -3) 3)
        (assert-eq (abs_ 3.5) 3.5)
        (assert-eq (abs_ -3.5) 3.5)))

(test "quotient_"
      (lambda ()                           ; q = T(m/n)
        (assert-eq (quotient_ 0 5) 0)      ; q = T(0/5) = T(0) = 0
        (assert-eq (quotient_ 0 -5) 0)     ; q = T(0/-5) = T(0) = 0
        (assert-eq (quotient_ 10 5) 2)     ; q = T(10/5) = T(2) = 2
        (assert-eq (quotient_ 10 -5) -2)   ; q = T(10/-5) = T(-2) = -2
        (assert-eq (quotient_ -10 5) -2)   ; q = T(-10/5) = T(-2) = -2
        (assert-eq (quotient_ -10 -5) 2)   ; q = T(-10/-5) = T(2) = 2
        (assert-eq (quotient_ 11 5) 2)     ; q = T(11/5) = T(2.2) = 2
        (assert-eq (quotient_ 11 -5) -2)   ; q = T(11/-5) = T(-2.2) = -2
        (assert-eq (quotient_ -11 5) -2)   ; q = T(-11/5) = T(-2.2) = -2
        (assert-eq (quotient_ -11 -5) 2))) ; q = T(-11/-5) = T(2.2) = 2

(test "floor-quotient"
      (lambda ()                                ; q = F(m/n)
        (assert-eq (floor-quotient 0 5) 0)      ; q = F(0/5) = F(0) = 0
        (assert-eq (floor-quotient 0 -5) 0)     ; q = F(0/-5) = F(0) = 0
        (assert-eq (floor-quotient 10 5) 2)     ; q = F(10/5) = F(2) = 2
        (assert-eq (floor-quotient 10 -5) -2)   ; q = F(10/-5) = F(-2) = -2
        (assert-eq (floor-quotient -10 5) -2)   ; q = F(-10/5) = F(-2) = -2
        (assert-eq (floor-quotient -10 -5) 2)   ; q = F(-10/-5) = F(2) = 2
        (assert-eq (floor-quotient 11 5) 2)     ; q = F(11/5) = F(2.2) = 2
        (assert-eq (floor-quotient 11 -5) -3)   ; q = F(11/-5) = F(-2.2) = -3
        (assert-eq (floor-quotient -11 5) -3)   ; q = F(-11/5) = F(-2.2) = -3
        (assert-eq (floor-quotient -11 -5) 2))) ; q = F(-11/-5) = F(2.2) = 2

(test "remainder_"
      (lambda ()                             ; q = T(m/n)                  -> r = m - (n * q)
        (assert-eq (remainder_ 0 5) 0)       ; q = T(0/5) = T(0) = 0       -> r = 0 - (5 * 0) = 0
        (assert-eq (remainder_ 0 -5) 0)      ; q = T(0/-5) = T(0) = 0      -> r = 0 - (-5 * 0) = 0
        (assert-eq (remainder_ 10 5) 0)      ; q = T(10/5) = T(2) = 2      -> r = 10 - (5 * 2) = 0
        (assert-eq (remainder_ 10 -5) 0)     ; q = T(10/-5) = T(-2) = -2   -> r = 10 - (-5 * -2) = 0
        (assert-eq (remainder_ -10 5) 0)     ; q = T(-10/5) = T(-2) = -2   -> r = -10 - (5 * -2) = 0
        (assert-eq (remainder_ -10 -5) 0)    ; q = T(-10/-5) = T(2) = 2    -> r = -10 - (-5 * 2) = 0
        (assert-eq (remainder_ 11 5) 1)      ; q = T(11/5) = T(2.2) = 2    -> r = 11 - (5 * 2) = 1
        (assert-eq (remainder_ 11 -5) 1)     ; q = T(11/-5) = T(-2.2) = -2 -> r = 11 - (-5 * -2) = 1
        (assert-eq (remainder_ -11 5) -1)    ; q = T(-11/5) = T(-2.2) = -2 -> r = -11 - (5 * -2) = -1
        (assert-eq (remainder_ -11 -5) -1))) ; q = T(-11/-5) = T(2.2) = 2  -> r = -11 - (-5 * 2) = -1

(test "modulo_"
      (lambda ()                          ; q = F(m/n)                  -> r = m - (n * q)
        (assert-eq (modulo_ 0 5) 0)       ; q = F(0/5) = F(0) = 0       -> r = 0 - (5 * 0) = 0
        (assert-eq (modulo_ 0 -5) 0)      ; q = F(0/-5) = F(0) = 0      -> r = 0 - (-5 * 0) = 0
        (assert-eq (modulo_ 10 5) 0)      ; q = F(10/5) = F(2) = 2      -> r = 10 - (5 * 2) = 0
        (assert-eq (modulo_ 10 -5) 0)     ; q = F(10/-5) = F(-2) = -2   -> r = 10 - (-5 * -2) = 0
        (assert-eq (modulo_ -10 5) 0)     ; q = F(-10/5) = F(-2) = -2   -> r = -10 - (5 * -2) = 0
        (assert-eq (modulo_ -10 -5) 0)    ; q = F(-10/-5) = F(2) = 2    -> r = -10 - (-5 * 2) = 0
        (assert-eq (modulo_ 11 5) 1)      ; q = F(11/5) = F(2.2) = 2    -> r = 11 - (5 * 2) = 1
        (assert-eq (modulo_ 11 -5) -4)    ; q = F(11/-5) = F(-2.2) = -3 -> r = 11 - (-5 * -3) = -4
        (assert-eq (modulo_ -11 5) 4)     ; q = F(-11/5) = F(-2.2) = -3 -> r = -11 - (5 * -3) = 4
        (assert-eq (modulo_ -11 -5) -1))) ; q = F(-11/-5) = F(2.2) = 2  -> r = -11 - (-5 * 2) = -1

(test "truncate"
      (lambda ()
        (assert-eq (truncate 0) 0)
        (assert-eq (truncate 1) 1)
        (assert-eq (truncate 1.4) 1.0)
        (assert-eq (truncate 1.5) 1.0)
        (assert-eq (truncate 1.6) 1.0)
        (assert-eq (truncate -1) -1)
        (assert-eq (truncate -1.4) -1.0)
        (assert-eq (truncate -1.5) -1.0)
        (assert-eq (truncate -1.6) -1.0)))

(test "floor_"
      (lambda ()
        (assert-eq (floor_ 0) 0)
        (assert-eq (floor_ 1) 1)
        (assert-eq (floor_ 1.4) 1.0)
        (assert-eq (floor_ 1.5) 1.0)
        (assert-eq (floor_ 1.6) 1.0)
        (assert-eq (floor_ -1) -1)
        (assert-eq (floor_ -1.4) -2.0)
        (assert-eq (floor_ -1.5) -2.0)
        (assert-eq (floor_ -1.6) -2.0)))

(test "ceiling_"
      (lambda ()
        (assert-eq (ceiling_ 0) 0)
        (assert-eq (ceiling_ 1) 1)
        (assert-eq (ceiling_ 1.4) 2.0)
        (assert-eq (ceiling_ 1.5) 2.0)
        (assert-eq (ceiling_ 1.6) 2.0)
        (assert-eq (ceiling_ -1) -1)
        (assert-eq (ceiling_ -1.4) -1.0)
        (assert-eq (ceiling_ -1.5) -1.0)
        (assert-eq (ceiling_ -1.6) -1.0)))

(test "round-half-up"
      (lambda ()
        (assert-eq (round-half-up 0) 0)
        (assert-eq (round-half-up 1) 1)
        (assert-eq (round-half-up 1.4) 1.0)
        (assert-eq (round-half-up 1.5) 2.0)
        (assert-eq (round-half-up 1.6) 2.0)
        (assert-eq (round-half-up -1) -1)
        (assert-eq (round-half-up -1.4) -1.0)
        (assert-eq (round-half-up -1.5) -1.0)
        (assert-eq (round-half-up -1.6) -2.0)))

(test "round-half-down"
      (lambda ()
        (assert-eq (round-half-down 0) 0)
        (assert-eq (round-half-down 1) 1)
        (assert-eq (round-half-down 1.4) 1.0)
        (assert-eq (round-half-down 1.5) 1.0)
        (assert-eq (round-half-down 1.6) 2.0)
        (assert-eq (round-half-down -1) -1)
        (assert-eq (round-half-down -1.4) -1.0)
        (assert-eq (round-half-down -1.5) -2.0)
        (assert-eq (round-half-down -1.6) -2.0)))

(test "round-half-away-from-zero1"
      (lambda ()
        (assert-eq (round-half-away-from-zero1 0) 0)
        (assert-eq (round-half-away-from-zero1 1) 1)
        (assert-eq (round-half-away-from-zero1 1.4) 1.0)
        (assert-eq (round-half-away-from-zero1 1.5) 2.0)
        (assert-eq (round-half-away-from-zero1 1.6) 2.0)
        (assert-eq (round-half-away-from-zero1 -1) -1)
        (assert-eq (round-half-away-from-zero1 -1.4) -1.0)
        (assert-eq (round-half-away-from-zero1 -1.5) -2.0)
        (assert-eq (round-half-away-from-zero1 -1.6) -2.0)))

(test "round-half-away-from-zero2"
      (lambda ()
        (assert-eq (round-half-away-from-zero2 0) 0.0) ; inexact->exact
        (assert-eq (round-half-away-from-zero2 1) 1.0) ; inexact->exact
        (assert-eq (round-half-away-from-zero2 1.4) 1.0)
        (assert-eq (round-half-away-from-zero2 1.5) 2.0)
        (assert-eq (round-half-away-from-zero2 1.6) 2.0)
        (assert-eq (round-half-away-from-zero2 -1) -1.0) ; inexact->exact
        (assert-eq (round-half-away-from-zero2 -1.4) -1.0)
        (assert-eq (round-half-away-from-zero2 -1.5) -2.0)
        (assert-eq (round-half-away-from-zero2 -1.6) -2.0)))

(test "round-half-toward-zero"
      (lambda ()
        (assert-eq (round-half-toward-zero 0) 0)
        (assert-eq (round-half-toward-zero 1) 1)
        (assert-eq (round-half-toward-zero 1.4) 1.0)
        (assert-eq (round-half-toward-zero 1.5) 1.0)
        (assert-eq (round-half-toward-zero 1.6) 2.0)
        (assert-eq (round-half-toward-zero -1) -1)
        (assert-eq (round-half-toward-zero -1.4) -1.0)
        (assert-eq (round-half-toward-zero -1.5) -1.0)
        (assert-eq (round-half-toward-zero -1.6) -2.0)))

(test "round-half-to-even"
      (lambda ()
        (assert-eq (round-half-to-even 0) 0)
        (assert-eq (round-half-to-even 1) 1)
        (assert-eq (round-half-to-even 1.4) 1.0)
        (assert-eq (round-half-to-even 1.5) 2.0)
        (assert-eq (round-half-to-even 1.6) 2.0)
        (assert-eq (round-half-to-even -1) -1)
        (assert-eq (round-half-to-even -1.4) -1.0)
        (assert-eq (round-half-to-even -1.5) -2.0)
        (assert-eq (round-half-to-even -1.6) -2.0)))

(test "round-half-to-odd"
      (lambda ()
        (assert-eq (round-half-to-odd 0) 0)
        (assert-eq (round-half-to-odd 1) 1)
        (assert-eq (round-half-to-odd 1.4) 1.0)
        (assert-eq (round-half-to-odd 1.5) 1.0)
        (assert-eq (round-half-to-odd 1.6) 2.0)
        (assert-eq (round-half-to-odd -1) -1)
        (assert-eq (round-half-to-odd -1.4) -1.0)
        (assert-eq (round-half-to-odd -1.5) -1.0)
        (assert-eq (round-half-to-odd -1.6) -2.0)))

(test "identity"
      (lambda ()
        (assert-eq (identity 0) 0)
        (assert-eq (identity 3) 3)
        (assert-eq (identity -3) -3)
        (assert-eq (identity 3.5) 3.5)
        (assert-eq (identity -3.5) -3.5)))

(test "inc"
      (lambda ()
        (assert-eq (inc 0) 1)
        (assert-eq (inc 3) 4)
        (assert-eq (inc -3) -2)))

(test "dec"
      (lambda ()
        (assert-eq (dec 0) -1)
        (assert-eq (dec 3) 2)
        (assert-eq (dec -3) -4)))

(test "square"
      (lambda ()
        (assert-eq (square 0) 0)
        (assert-eq (square 3) 9)
        (assert-eq (square -3) 9)
        (assert-eq (square 3.5) 12.25)
        (assert-eq (square -3.5) 12.25)))

(test "cube"
      (lambda ()
        (assert-eq (cube 0) 0)
        (assert-eq (cube 3) 27)
        (assert-eq (cube -3) -27)
        (assert-eq (cube 3.5) 42.875)
        (assert-eq (cube -3.5) -42.875)))

(test "average"
      (lambda ()
        (assert-eq (average 0 0) 0)
        (assert-eq (average 1 3) 2)
        (assert-eq (average -1 -3) -2)
        (assert-eq (average 1.5 3.5) 2.5)
        (assert-eq (average -1.5 -3.5) -2.5)))

(test "divides?"
      (lambda ()
        (assert-eq (divides? 2 0) #t)
        (assert-eq (divides? 2 1) #f)
        (assert-eq (divides? 2 2) #t)
        (assert-eq (divides? 2 3) #f)
        (assert-eq (divides? 2 4) #t)
        (assert-eq (divides? 2 -4) #t)
        (assert-eq (divides? -2 4) #t)
        (assert-eq (divides? -2 -4) #t)))

(test "expt0"
      (lambda ()
        (assert-eq (expt0 0 0) 1)
        (assert-eq (expt0 0 1) 0)
        (assert-eq (expt0 0 2) 0)
        (assert-eq (expt0 2 0) 1)
        (assert-eq (expt0 2 1) 2)
        (assert-eq (expt0 2 2) 4)
        (assert-eq (expt0 2 3) 8)
        (assert-eq (expt0 2 8) 256)
        (assert-eq (expt0 2 11) 2048)))

(test "exprem"
      (lambda ()
        (assert-eq (exprem 0 0 3) 1)
        (assert-eq (exprem 0 1 3) 0)
        (assert-eq (exprem 0 2 3) 0)
        (assert-eq (exprem 2 0 3) 1)
        (assert-eq (exprem 2 1 3) 2)
        (assert-eq (exprem 2 2 3) 1)
        (assert-eq (exprem 2 3 3) 2)
        (assert-eq (exprem 2 8 3) 1)
        (assert-eq (exprem 2 11 3) 2)
        (assert-eq (exprem 2 0 1) 0)
        (assert-eq (exprem 2 1 1) 0)
        (assert-eq (exprem 2 2 1) 0)
        (assert-eq (exprem 2 0 -1) 0)
        (assert-eq (exprem 2 1 -1) 0)
        (assert-eq (exprem 2 2 -1) 0)))

(test "lshift"
      (lambda ()
        (assert-eq (lshift 4 0) 4)
        (assert-eq (lshift 4 1) 8)
        (assert-eq (lshift 4 2) 16)
        (assert-eq (lshift -4 0) -4)
        (assert-eq (lshift -4 1) -8)
        (assert-eq (lshift -4 2) -16)
        (assert-eq (lshift 5 0) 5)
        (assert-eq (lshift 5 1) 10)
        (assert-eq (lshift 5 2) 20)
        (assert-eq (lshift -5 0) -5)
        (assert-eq (lshift -5 1) -10)
        (assert-eq (lshift -5 2) -20)))

(test "rshift1"
      (lambda ()
        (assert-eq (rshift1 4 0) 4)
        (assert-eq (rshift1 4 1) 2)
        (assert-eq (rshift1 4 2) 1)
        (assert-eq (rshift1 -4 0) -4)
        (assert-eq (rshift1 -4 1) -2)
        (assert-eq (rshift1 -4 2) -1)
        (assert-eq (rshift1 5 0) 5)
        (assert-eq (rshift1 5 1) 2)
        (assert-eq (rshift1 5 2) 1)
        (assert-eq (rshift1 -5 0) -5)
        (assert-eq (rshift1 -5 1) -3)
        (assert-eq (rshift1 -5 2) -2)))

(test "rshift2"
      (lambda ()
        (assert-eq (rshift2 4 0) 4)
        (assert-eq (rshift2 4 1) 2)
        (assert-eq (rshift2 4 2) 1)
        (assert-eq (rshift2 -4 0) -4)
        (assert-eq (rshift2 -4 1) -2)
        (assert-eq (rshift2 -4 2) -1)
        (assert-eq (rshift2 5 0) 5)
        (assert-eq (rshift2 5 1) 2)
        (assert-eq (rshift2 5 2) 1)
        (assert-eq (rshift2 -5 0) -5)
        (assert-eq (rshift2 -5 1) -3)
        (assert-eq (rshift2 -5 2) -2)))
