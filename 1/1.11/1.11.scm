; Iterative version of g.

(define (f n)
  (cond ((> n 3) (f-iter 1 2 3 (- n 3)))
        (else n)
        )
  )

(define (f-iter a b c n)
  (cond ((= n 0) c)
        (else (f-iter b c (+ c (* b 2) (* a 3)) (- n 1)))
        )
  )

; Recursive version of f.
(define (g n)
  (cond
    ((> n 3) (+
              (* (g (- n 1)) 1) ; I like symmetry. Bite me.
              (* (g (- n 2)) 2)
              (* (g (- n 3)) 3)
              )
             )
    ((< n 4) n)
    )
  )