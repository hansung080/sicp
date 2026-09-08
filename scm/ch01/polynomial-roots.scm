(load "../ch01/cbrt.scm")
(load "../ch01/sqrt.scm")

;; Quadratic Formula for a Quadratic Equation
;;
;;   ax^2 + bx + c = 0
;;   -> x = {-b +|- sqrt(b^2 - 4ac)} / 2a
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

;; Cardano's Formula for a Depressed Cubic Equation
;;
;;   x^3 + px + q = 0
;;   -> x_0 = cbrt[-q/2 + sqrt{(q/2)^2 + (p/3)^3}] + cbrt[-q/2 - sqrt{(q/2)^2 + (p/3)^3}]
;;
;;   For the three roots:
;;     x_0 = u + v
;;     x_1 = wu + (w^2)v
;;     x_2 = (w^2)u + wv
;;     where 1, w, and w^2 are the three roots of w^3 = 1
;;           w^3 = 1
;;           w^3 - 1 = 0
;;           (w - 1)(w^2 + w + 1) = 0
;;           w = 1 or w = -1/2 +|- sqrt(3)i/2
;;
;;   For the discriminant (q/2)^2 + (p/3)^3:
;;     discriminant > 0 -> one real root (x_0) and two conjugate imaginary roots (x_1, x_2).
;;     discriminant = 0 -> three real roots, counted with multiplicity (x_0, x_1, x_2).
;;     discriminant < 0 -> three distinct real roots (x_0, x_1, x_2).
;;                         `depressed-cubic-root` does not work because `sqrt_` and `cbrt` do not handle
;;                         imaginary numbers, which are required by casus irreducibilis.
;;
(define (depressed-cubic-root c3 c1 c0)
  (let* ((p (/ c1 c3))
         (q (/ c0 c3))
         (sqrt-value (sqrt_ (+ (square (/ q 2)) (cube (/ p 3))))))
    (+ (cbrt (+ (/ (- q) 2) sqrt-value))
       (cbrt (- (/ (- q) 2) sqrt-value)))))
