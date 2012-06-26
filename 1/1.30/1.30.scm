(define (sum-recursive term a next b) ; Old and busted recursive version
  (if (> a b)
      0
      (+ (term a)
         (sum-recursive term (next a) next b))))

(define (sum-iterative term a next b) ; New iterative hotness
  (define (iter a result)   ; Just by adding the explicit accumulator, "result"
    (if (> a b)
        result
        (iter (next a) (+ (term a) result))))
  (iter a 0))

(define (identity x) x)
(define (inc x) (+ x 1))

; (sum-iterative identity 1 inc 10)
; (sum-recursive identity 1 inc 10)