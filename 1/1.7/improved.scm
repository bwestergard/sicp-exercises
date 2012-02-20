(define (sqrt-iter lastguess guess x)
  (if (good-enough? lastguess guess x)
      guess
      (sqrt-iter guess (improve guess x) x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? lastguess guess x)
  (< (/ (abs (- lastguess guess)) x) 0.001))

(define (sqrt x)
  (sqrt-iter 1.0 x x))

(define (square x)
  (* x x))

