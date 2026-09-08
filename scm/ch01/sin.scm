(load "../common/math.scm")

;; Sine (Logarithmic Recursive Process)
;;
;;   Recurrence Relation
;;
;;     x is an angle in radians.
;;
;;     sin(x) = x                        (|x| <= 0.1)
;;     sin(x) = 3sin(x/3) - 4sin^3(x/3)  (|x| > 0.1)
;;
;;   Order of Growth
;;
;;     time complexity:  Θ(log3(x))
;;     space complexity: Θ(log3(x))
;;
;;   Substitution Model
;;
;;     sin-aux is called 5 times.
;;
;;     (sin_ 12.15)
;;     (sin-aux (sin_ 4.05))
;;     (sin-aux (sin-aux (sin_ 1.3499999999999999)))
;;     (sin-aux (sin-aux (sin-aux (sin_ 0.44999999999999996))))
;;     (sin-aux (sin-aux (sin-aux (sin-aux (sin_ 0.15)))))
;;     (sin-aux (sin-aux (sin-aux (sin-aux (sin-aux (sin_ 0.049999999999999996))))))
;;     (sin-aux (sin-aux (sin-aux (sin-aux (sin-aux 0.049999999999999996)))))
;;     (sin-aux (sin-aux (sin-aux (sin-aux 0.1495))))
;;     (sin-aux (sin-aux (sin-aux 0.4351345505)))
;;     (sin-aux (sin-aux 0.9758465331678772))
;;     (sin-aux -0.7895631144708228)
;;     -0.39980345741334
;;
(define (sin_ x)
  (if (<= (abs_ x) 0.1)
      x
      (sin-aux (sin_ (/ x 3.0)))))

(define (sin-aux x)
  (- (* 3 x)
     (* 4 (cube x))))
