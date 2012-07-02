(define (product-iterative term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* (term a) result))))
  (iter a 1))

(define (product-recursive term a next b)
    (if (> a b)
        1
        (* (term a) (product-recursive term (next a) next b))
        ))

; Skipped the pi exercise. Trivial, you just write a two new term functions.

(define (factorial n) (product-iterative identity 1 inc n))

(define (square x) (* x x))
(define (identity x) x)
(define (inc x) (+ x 1))