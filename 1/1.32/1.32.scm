(define (accumulate-recursive combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a) (accumulate combiner null-value term (next a) next b))))

(define (accumulate-iterative combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (combiner result (term a))))
    )
  (iter a null-value))

(define accumulate accumulate-recursive)

(define (sum term a next b)
  (accumulate + 0 term a next b) ; The first two arguments to accumulate are an operator and its identity element, algebraically speaking
  )

(define (product term a next b)
  (accumulate * 1 term a next b)
  )