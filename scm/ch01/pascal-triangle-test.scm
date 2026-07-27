(load "../common/testing.scm")

;; Pascal's Triangle
;;
;;       1
;;      1 1
;;     1 2 1
;;    1 3 3 1
;;   1 4 6 4 1
;;      ...
;;
;; Pascal's Triangle Recurrence Relation
;;
;;   Pascal(row, col) = 1  (col = 1)
;;   Pascal(row, col) = 1  (col = row)
;;   Pascal(row, col) = Pascal(row-1, col-1) + Pascal(row-1, col)  (otherwise)
;;
;; Recursive Procedure That Generates a Tree-Recursive Process
(define (pascal row col)
  (cond ((= col 1) 1)
        ((= col row) 1)
        (else (+ (pascal (- row 1) (- col 1))
                 (pascal (- row 1) col)))))

(define (display-pascal-triangle height)
  (define (row-iter row)
    (define (space-iter space)
      (if (<= space (- height row))
          (begin
            (display " ")
            (space-iter (+ space 1)))))
    (define (column-iter col)
      (if (<= col row)
          (begin
            (display (pascal row col))
            (if (not (= col row))
                (display " "))
            (column-iter (+ col 1)))))
    (if (<= row height)
        (begin
          (space-iter 1)
          (column-iter 1)
          (newline)
          (row-iter (+ row 1)))))
  (row-iter 1))

(test "pascal"
      (lambda ()
        (assert-eq (pascal 1 1) 1)
        (assert-eq (pascal 2 1) 1)
        (assert-eq (pascal 2 2) 1)
        (assert-eq (pascal 3 1) 1)
        (assert-eq (pascal 3 2) 2)
        (assert-eq (pascal 3 3) 1)
        (assert-eq (pascal 4 1) 1)
        (assert-eq (pascal 4 2) 3)
        (assert-eq (pascal 4 3) 3)
        (assert-eq (pascal 4 4) 1)
        (assert-eq (pascal 5 1) 1)
        (assert-eq (pascal 5 2) 4)
        (assert-eq (pascal 5 3) 6)
        (assert-eq (pascal 5 4) 4)
        (assert-eq (pascal 5 5) 1)))

;; (display-pascal-triangle 5)
;; Output:
;;     1
;;    1 1
;;   1 2 1
;;  1 3 3 1
;; 1 4 6 4 1
