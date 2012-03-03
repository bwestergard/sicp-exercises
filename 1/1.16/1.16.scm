(define (fast-expt b n) ; This is the given recursive solution.
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))

(define (expi b n a) ; Iterative version.
  (cond ((= n 0) a)
  ((even? n) (expi (square b) (/ n 2) a)) ; Kind of leaning on the edge case (n = 0) behavior here.
  (else (expi b (- n 1) (* b a)))
  )
)

(define (even? n)
  (= (remainder n 2) 0))

(define (square n) (* n n))