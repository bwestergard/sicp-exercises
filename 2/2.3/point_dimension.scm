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

(define (make-rect bottomleft h w)
  (list bottomleft h w))

(define (rect-height rect)
  (car (cdr rect)))

(define (rect-width rect)
  (car (cdr (cdr rect))))

(rect-area (make-rect (make-point 13 17) 12 5))