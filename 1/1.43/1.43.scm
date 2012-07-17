(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated g n)
  (if (= n 1)
      g
      (compose g (repeated g (- n 1)))))

(define (square x) (* x x))

((repeated square 2) 5)