(define (filtered-accumulate filter combiner null-value term a next b)
  (define filtered-term (if (filter (term a)) (term a) null-value))
  (if (> a b)
      null-value
      (combiner filtered-term (filtered-accumulate filter combiner null-value term (next a) next b)))
  )