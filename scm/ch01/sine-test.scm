(load "../common/math.scm")
(load "../common/testing.scm")

;; Sine Recurrence Relation (x is an angle in radians)
;; 
;;   sin x = x                        (|x| <= 0.1)
;;   sin x = 3sin(x/3) - 4sin^3(x/3)  (|x| > 0.1)
;;
;; Substitution Model for (sine 12.15)
;;   - `p` is called 5 times.
;;
;;   (sine 12.15)
;;   (p (sine 4.05))
;;   (p (p (sine 1.3499999999999999)))
;;   (p (p (p (sine 0.44999999999999996))))
;;   (p (p (p (p (sine 0.15)))))
;;   (p (p (p (p (p (sine 0.049999999999999996))))))
;;   (p (p (p (p (p 0.049999999999999996)))))
;;   (p (p (p (p 0.1495))))
;;   (p (p (p 0.4351345505)))
;;   (p (p 0.9758465331678772))
;;   (p -0.7895631144708228)
;;   -0.39980345741334
;;
;; Order of Growth for (sine angle)
;;
;;   Θ(log3(angle))
(define (sine angle)
  (if (not (> (abs_ angle) 0.1))
      angle
      (p (sine (/ angle 3.0)))))

(define (p x)
  (- (* 3 x)
     (* 4 (cube x))))

(test "sine"
      (lambda ()
        (assert-eq (sine 12.15) -0.39980345741334)))
