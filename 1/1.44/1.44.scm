(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated g n)
  (if (= n 1)
      g
      (compose g (repeated g (- n 1)))))

(define (average x y z) (/ (+ x y z) 3))

(define (smooth f)
  (define dx 0.001)
  (lambda (x) (average (f (- x dx)) (f x) (f (+ x dx)))))

(define (foo x) ; Just some function to smooth.
  (- (* x x x 2) (* x x 4)))

(((repeated smooth 10) foo) 4)
