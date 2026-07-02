(load "../common/testing.scm")
(load "math.scm")

(test "abs_"
      (lambda ()
        (assert-eq (abs_ 0) 0)
        (assert-eq (abs_ 3) 3)
        (assert-eq (abs_ -3) 3)
        (assert-eq (abs_ 3.5) 3.5)
        (assert-eq (abs_ -3.5) 3.5)))

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
        (assert-eq (round-half-away-from-zero2 0) 0.0) ; exact integer -> inexact real
        (assert-eq (round-half-away-from-zero2 1) 1.0) ; exact integer -> inexact real
        (assert-eq (round-half-away-from-zero2 1.4) 1.0)
        (assert-eq (round-half-away-from-zero2 1.5) 2.0)
        (assert-eq (round-half-away-from-zero2 1.6) 2.0)
        (assert-eq (round-half-away-from-zero2 -1) -1.0) ; exact integer -> inexact real
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
