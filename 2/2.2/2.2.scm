(define (make-point x y)
  (cons x y))

(define (x-point point)
  (car point))

(define (y-point point)
  (cdr point))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(define (make-segment start end) ; Yay for abstraction barriers: four definitions equivalent to cons/car/cdr.
  (cons start end))

(define (start-segment segment)
  (car segment))

(define (end-segment segment)
  (cdr segment))

(define (midpoint-segment segment)
  (make-segment (/ 
                 (+ (x-point (start-segment segment)) (x-point (end-segment segment)))
                 2)
                (/ 
                 (+ (y-point (start-segment segment)) (y-point (end-segment segment)))
                 2))
  )

(print-point (midpoint-segment (make-segment (make-point 0 0) (make-point 100 100))))