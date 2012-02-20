(define (cbrt-iter lastguess guess x)
  (if (good-enough? lastguess guess x)
      (* guess 1.0)
      (cbrt-iter guess (improve guess x) x)))

(define (improve y x)
  (/ (+ (/ x (square y)) (* 2 y)) 3))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? lastguess guess x)
  (< (/ (abs (- lastguess guess)) x) 0.0001))

(define (cbrt x)
  (cbrt-iter (* 4 x) x x))

(define (cube x)
  (* (* x x) x))

(define (square x)
  (* x x))

; This works pretty well.
; (cube (cbrt 0.00347001))