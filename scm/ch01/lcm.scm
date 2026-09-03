(load "../ch01/gcd.scm")

;; Mathematical Definition of LCM
;;
;;   LCM is the least positive integer that is a multiple of both integers.
;;
;; Closed-Form Formula for LCM
;;
;;   Let:
;;     A and B are nonnegative integers, and G is the greatest common divisor of them.
;;
;;     A = a * G
;;     B = b * G
;;
;;   Then:
;;     L is the least common multiple of A and B.
;;
;;     L = a * b * G
;;     A * B = a * b * G^2 = L * G
;;
;;   Thus:
;;     L = 0            (A = 0 or B = 0)
;;     L = (A * B) / G  (otherwise; A, B, G, and L are nonnegative integers)
;;       = (A / G) * B
;;
;;   Note:
;;     For arbitrary integers A and B:
;;       L = |A * B| / G  (otherwise; A and B are integers, and G and L are nonnegative integers)
;;
(define (lcm_ a b)
  (if (or (= a 0) (= b 0))
      0
      (* (/ a (gcd_ a b)) b)))
