(define (integral f a b n)
  (define h (/ (- b a) n))
  (define (x k) (+ a (* k h)))
  (define (coeff k) (cond ((= k 0) 1)
                          ((= k n) 1)
                          (else (if (even? k) 2 4))))
  (define (integral-term k) (* (f (x k)) (coeff k)))
  (* (/ h 3)
     (sum integral-term
          0
          inc
          n)))

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (cube x) (* x x x))

(define (inc n) (+ n 1))