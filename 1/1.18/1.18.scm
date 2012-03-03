(define (* a b)
  (cond ((< a b) (mul-iter a b 0))
        (else (mul-iter b a 0))) ; This is a pretty epic optimization for cases like (979797 3)
  )

(define (mul-iter a b t)
  (cond ((or (= a 0) (= b 0)) t)
        ((even? a) (mul-iter (halve a) (double b) t))
        (else      (mul-iter (- a 1) b (+ t b)))
      )
  )

(define (even? n) (= (remainder n 2) 0)) ; This exercise is less academic than it seems if you assume these are implemented with bitshifting at hardware level.
(define (double n) (+ n n))
(define (halve n) (/ n 2))