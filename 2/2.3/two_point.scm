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

(define (rect-area rect)
  (* (rect-height rect) (rect-width rect)))

(define (rect-perimeter rect)
  (* 2 (+ (rect-height rect) (rect-width rect))))

; End definitions common to both implementations. Wish I could do a file include.

(define (make-rect bottomleft topright)
  (cons bottomleft topright))

(define (rect-height rect)
  (-
   (y-point (car rect))
   (y-point (cdr rect))
   ))

(define (rect-width rect)
  (-
   (x-point (car rect))
   (x-point (cdr rect))
   ))

(define foo-rect (make-rect (make-point 0 0) (make-point 12 5)))

(rect-area foo-rect)