(load "../common/testing.scm")
(load "cbrt.scm")

(define (cbrt0 x)
  (expt x 1/3))

;; Scheme `expt` and Python `math.cbrt` produce different results for some of the tests below.
;; (Python `math.cbrt` produces correctly rounded results to the precision of IEEE 754 64-bit floating-point numbers.)
(test "cbrt0"
      (lambda ()                                                      ; Python math.cbrt
        ;; Test for ordinary numbers.
        (assert-eq (cbrt0 0) 0)                                       ; 0.0
        (assert-eq (cbrt0 1) 1)                                       ; 1.0
        (assert-eq (cbrt0 2) 1.2599210498948732)                      ; 1.2599210498948732
        (assert-eq (cbrt0 3) 1.4422495703074083)                      ; 1.4422495703074083
        (assert-eq (cbrt0 4) 1.5874010519681994)                      ; 1.5874010519681996
        (assert-eq (cbrt0 5) 1.7099759466766968)                      ; 1.709975946676697
        (assert-eq (cbrt0 6) 1.8171205928321397)                      ; 1.8171205928321397
        (assert-eq (cbrt0 7) 1.912931182772389)                       ; 1.9129311827723892
        (assert-eq (cbrt0 8) 2.0)                                     ; 2.0
        (assert-eq (cbrt0 9) 2.080083823051904)                       ; 2.080083823051904
        (assert-eq (cbrt0 10) 2.154434690031884)                      ; 2.154434690031884
        (assert-eq (cbrt0 (+ 100 37)) 5.155136735475772)              ; 5.1551367354757724
        (assert-eq (cbrt0 (+ (cbrt0 2) (cbrt0 3))) 1.392849702964866) ; 1.392849702964866
        (assert-eq (cube (cbrt0 1000)) 999.9999999999995)             ; 1000.0
        ;; Test for very small and large numbers.
        (assert-eq (cbrt0 0.000000001) 0.0010000000000000005)         ; 0.001
        (assert-eq (cbrt0 1000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000) 9.99999999999996e+31))) ; 1e+32

(test "cbrt1"
  (lambda ()
    ;; Test for ordinary numbers.
    (assert-eq (cbrt1 0) 1.1377797470191208e-108)
    (assert-eq (cbrt1 1) 1.0)
    (assert-eq (cbrt1 2) 1.2599210498948732)
    ; (assert-eq (cbrt1 3) 1.4422495703074083) ; termination failure
    ; (assert-eq (cbrt1 4) 1.5874010519681996) ; termination failure
    ; (assert-eq (cbrt1 5) 1.709975946676697)  ; termination failure
    (assert-eq (cbrt1 6) 1.8171205928321397)
    ; (assert-eq (cbrt1 7) 1.9129311827723892) ; termination failure
    (assert-eq (cbrt1 8) 2.0)
    (assert-eq (cbrt1 9) 2.080083823051904)
    ; (assert-eq (cbrt1 10) 2.154434690031884) ; termination failure
    (assert-eq (cbrt1 (+ 100 37)) 5.1551367354757724)
    ; (assert-eq (cbrt1 (+ (cbrt1 2) (cbrt1 3))) 1.392849702964866) ; termination failure
    (assert-eq (cube (cbrt1 1000)) 1000.0)
    ;; Test for very small and large numbers.
    (assert-eq (cbrt1 0.000000001) 0.001)
    ; (assert-eq (cbrt1 1000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000) 1e+32) ; termination failure
    ))

(test "cbrt2"
      (lambda ()
        ;; Test for ordinary numbers.
        (assert-eq (cbrt2 0) 0.0877914951989026)
        (assert-eq (cbrt2 1) 1.0)
        (assert-eq (cbrt2 2) 1.259933493449977)
        (assert-eq (cbrt2 3) 1.4422497895989996)
        (assert-eq (cbrt2 4) 1.5874096961416333)
        (assert-eq (cbrt2 5) 1.7100597366002945)
        (assert-eq (cbrt2 6) 1.817120681877066)
        (assert-eq (cbrt2 7) 1.9129320405969417)
        (assert-eq (cbrt2 8) 2.000004911675504)
        (assert-eq (cbrt2 9) 2.0801035255095734)
        (assert-eq (cbrt2 10) 2.1544959251533746)
        (assert-eq (cbrt2 (+ 100 37)) 5.15513673840956)
        (assert-eq (cbrt2 (+ (cbrt2 2) (cbrt2 3))) 1.3928519224798794)
        (assert-eq (cube (cbrt2 1000)) 1000.0000435797309)
        ;; Test for very small and large numbers.
        (assert-eq (cbrt2 0.000000001) 0.08779152249543483) ; accuracy failure
        ; (assert-eq (cbrt2 1000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000) 1e+32) ; termination failure
        ))

(test "cbrt3"
      (lambda ()
        ;; Test for ordinary numbers.
        ; (assert-eq (cbrt3 0) 0.0) ; error: division by zero
        (assert-eq (cbrt3 1) 1.0)
        (assert-eq (cbrt3 2) 1.259933493449977)
        (assert-eq (cbrt3 3) 1.4422497895989996)
        (assert-eq (cbrt3 4) 1.5874096961416333)
        (assert-eq (cbrt3 5) 1.7100597366002945)
        (assert-eq (cbrt3 6) 1.8175229025826798)
        (assert-eq (cbrt3 7) 1.9129320405969417)
        (assert-eq (cbrt3 8) 2.000004911675504)
        (assert-eq (cbrt3 9) 2.0801035255095734)
        (assert-eq (cbrt3 10) 2.1544959251533746)
        (assert-eq (cbrt3 (+ 100 37)) 5.1552597174244825)
        (assert-eq (cbrt3 (+ (cbrt3 2) (cbrt3 3))) 1.3930989192537933)
        (assert-eq (cube (cbrt3 1000)) 1000.3616513898074)
        ;; Test for very small and large numbers.
        (assert-eq (cbrt3 0.000000001) 0.0010000009808132022)
        (assert-eq (cbrt3 1000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000) 1.0002023018509312e+32)))

;; The tests `cbrt4`, `cbrt5`, `cbrt6`, and `cbrt7` produce identical results, except for cbrt(0) and cbrt(4).
(test "cbrt4"
      (lambda ()
        ;; Test for ordinary numbers.
        (assert-eq (cbrt4 0) 5e-324)
        (assert-eq (cbrt4 1) 1.0)
        (assert-eq (cbrt4 2) 1.2599210498948732)
        (assert-eq (cbrt4 3) 1.4422495703074085)
        ; (assert-eq (cbrt4 4) 1.5874010519681996) ; termination failure (2-cycle)
        (assert-eq (cbrt4 5) 1.709975946676697)
        (assert-eq (cbrt4 6) 1.8171205928321397)
        (assert-eq (cbrt4 7) 1.912931182772389)
        (assert-eq (cbrt4 8) 2.0)
        (assert-eq (cbrt4 9) 2.080083823051904)
        (assert-eq (cbrt4 10) 2.154434690031884)
        (assert-eq (cbrt4 (+ 100 37)) 5.1551367354757724)
        (assert-eq (cbrt4 (+ (cbrt4 2) (cbrt4 3))) 1.392849702964866)
        (assert-eq (cube (cbrt4 1000)) 1000.0)
        ;; Test for very small and large numbers.
        (assert-eq (cbrt4 0.000000001) 0.001)
        (assert-eq (cbrt4 1000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000) 1e+32)))

(test "cbrt5"
      (lambda ()
        ;; Test for ordinary numbers.
        (assert-eq (cbrt5 0) 1.8131477592909546e-11)
        (assert-eq (cbrt5 1) 1.0)
        (assert-eq (cbrt5 2) 1.2599210498948732)
        (assert-eq (cbrt5 3) 1.4422495703074085)
        (assert-eq (cbrt5 4) 1.5874010519681996)
        (assert-eq (cbrt5 5) 1.709975946676697)
        (assert-eq (cbrt5 6) 1.8171205928321397)
        (assert-eq (cbrt5 7) 1.912931182772389)
        (assert-eq (cbrt5 8) 2.0)
        (assert-eq (cbrt5 9) 2.080083823051904)
        (assert-eq (cbrt5 10) 2.154434690031884)
        (assert-eq (cbrt5 (+ 100 37)) 5.1551367354757724)
        (assert-eq (cbrt5 (+ (cbrt5 2) (cbrt5 3))) 1.392849702964866)
        (assert-eq (cube (cbrt5 1000)) 1000.0)
        ;; Test for very small and large numbers.
        (assert-eq (cbrt5 0.000000001) 0.001)
        (assert-eq (cbrt5 1000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000) 1e+32)))

(test "cbrt6"
      (lambda ()
        ;; Test for ordinary numbers.
        (assert-eq (cbrt6 0) 5e-324)
        (assert-eq (cbrt6 1) 1.0)
        (assert-eq (cbrt6 2) 1.2599210498948732)
        (assert-eq (cbrt6 3) 1.4422495703074085)
        (assert-eq (cbrt6 4) 1.5874010519681996)
        (assert-eq (cbrt6 5) 1.709975946676697)
        (assert-eq (cbrt6 6) 1.8171205928321397)
        (assert-eq (cbrt6 7) 1.912931182772389)
        (assert-eq (cbrt6 8) 2.0)
        (assert-eq (cbrt6 9) 2.080083823051904)
        (assert-eq (cbrt6 10) 2.154434690031884)
        (assert-eq (cbrt6 (+ 100 37)) 5.1551367354757724)
        (assert-eq (cbrt6 (+ (cbrt6 2) (cbrt6 3))) 1.392849702964866)
        (assert-eq (cube (cbrt6 1000)) 1000.0)
        ;; Test for very small and large numbers.
        (assert-eq (cbrt6 0.000000001) 0.001)
        (assert-eq (cbrt6 1000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000) 1e+32)))

(test "cbrt7"
      (lambda ()
        ;; Test for ordinary numbers.
        (assert-eq (cbrt7 0) 5e-324)
        (assert-eq (cbrt7 1) 1.0)
        (assert-eq (cbrt7 2) 1.2599210498948732)
        (assert-eq (cbrt7 3) 1.4422495703074085)
        (assert-eq (cbrt7 4) 1.5874010519681994)
        (assert-eq (cbrt7 5) 1.709975946676697)
        (assert-eq (cbrt7 6) 1.8171205928321397)
        (assert-eq (cbrt7 7) 1.912931182772389)
        (assert-eq (cbrt7 8) 2.0)
        (assert-eq (cbrt7 9) 2.080083823051904)
        (assert-eq (cbrt7 10) 2.154434690031884)
        (assert-eq (cbrt7 (+ 100 37)) 5.1551367354757724)
        (assert-eq (cbrt7 (+ (cbrt7 2) (cbrt7 3))) 1.392849702964866)
        (assert-eq (cube (cbrt7 1000)) 1000.0)
        ;; Test for very small and large numbers.
        (assert-eq (cbrt7 0.000000001) 0.001)
        (assert-eq (cbrt7 1000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000) 1e+32)))
