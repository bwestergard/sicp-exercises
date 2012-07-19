; This is a brilliant question. A great way to lead into this sort of thing: http://en.wikipedia.org/wiki/Church_encoding
; Or, less seriously, http://en.wikipedia.org/wiki/FRACTRAN

(define (cons a b)
  (* (expt 2 a) (expt 3 b)))

(define (find-expt pair factor)
  (if (= (remainder pair factor) 0)
      (+ 1 (find-expt (quotient pair factor) factor))
      0))

(define (car pair)
  (find-expt pair 2)
  )
      
(define (cdr pair)
  (find-expt pair 3)
  )

(car (car (cons (cons 1 2) (cons 3 4)))) ; And they nest!
(cdr (car (cons (cons 1 2) (cons 3 4))))
(car (cdr (cons (cons 1 2) (cons 3 4))))
(cdr (cdr (cons (cons 1 2) (cons 3 4))))