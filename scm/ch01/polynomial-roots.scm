(load "../ch01/cbrt.scm")
(load "../ch01/sqrt.scm")

;; Quadratic Formula
;;
;;   ax^2 + bx + c = 0  (a != 0)
;;   -> x = {-b +|- sqrt(b^2 - 4ac)} / (2a)
;;
;;   For the discriminant b^2 - 4ac:
;;     discriminant > 0 -> two distinct real roots.
;;     discriminant = 0 -> two real roots, counted with multiplicity.
;;     discriminant < 0 -> two conjugate imaginary roots.
;;                         `quadratic-root` does not work because `sqrt_` does not handle imaginary numbers.
;;
(define (quadratic-roots c2 c1 c0)
  (let ((sqrt-value (sqrt_ (- (square c1) (* 4 c2 c0)))))
    (list (/ (+ (- c1) sqrt-value) (* 2 c2))
          (/ (- (- c1) sqrt-value) (* 2 c2)))))

;; Depressed Cubic Formula (Cardano's Formula)
;;
;;   x^3 + px + q = 0
;;   -> x_1 = cbrt[-q/2 + sqrt{(q/2)^2 + (p/3)^3}] + cbrt[-q/2 - sqrt{(q/2)^2 + (p/3)^3}]
;;
;;   For the three roots:
;;     x_1 = u + v
;;     x_2 = wu + (w^2)v
;;     x_3 = (w^2)u + wv
;;     where 1, w, and w^2 are the three roots of w^3 = 1
;;           w^3 = 1
;;           w^3 - 1 = 0
;;           (w - 1)(w^2 + w + 1) = 0
;;           w = 1 or w = {-1 +|- sqrt(3)i} / 2
;;
;;   For the discriminant (q/2)^2 + (p/3)^3:
;;     discriminant > 0 -> one real root (x_1) and two conjugate imaginary roots (x_2, x_3).
;;     discriminant = 0 -> three real roots, counted with multiplicity (x_1, x_2, x_3).
;;     discriminant < 0 -> three distinct real roots (x_1, x_2, x_3).
;;                         `depressed-cubic-root` does not work because `sqrt_` and `cbrt` do not handle
;;                         imaginary numbers, which are required by casus irreducibilis.
;;
(define (depressed-cubic-root c3 c1 c0)
  (let* ((p (/ c1 c3))
         (q (/ c0 c3))
         (sqrt-value (sqrt_ (+ (square (/ q 2)) (cube (/ p 3))))))
    (+ (cbrt (+ (/ (- q) 2) sqrt-value))
       (cbrt (- (/ (- q) 2) sqrt-value)))))

;; Cubic Formula
;;
;;   Method:
;;     general cubic -> Tschirnhaus transformation -> depressed cubic -> Cardano's formula
;;
;;   ax^3 + bx^2 + cx + d = 0  (a != 0)
;;
;;   Let:
;;     x = y - b/(3a)
;;
;;   Then:
;;     y^3 + py + q = 0
;;     where p = (3ac - b^2) / (3a^2)
;;           q = {2b^3 - 9abc + 27(a^2)d} / (27a^3)
;;
;;   Thus:
;;     x_1 = -b/(3a) + y_1
;;     x_2 = -b/(3a) + y_2
;;     x_3 = -b/(3a) + y_3
;;
(define (cubic-root c3 c2 c1 c0)
  (- (depressed-cubic-root 1
                           (/ (- (* 3 c3 c1) (* c2 c2))
                              (* 3 c3 c3))
                           (/ (+ (- (* 2 c2 c2 c2) (* 9 c3 c2 c1)) (* 27 c3 c3 c0))
                              (* 27 c3 c3 c3)))
     (/ c2 (* 3 c3))))
