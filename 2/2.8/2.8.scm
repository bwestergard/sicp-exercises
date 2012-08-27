(define (make-interval a b) (cons a b))
(define (upper-bound interval) (car interval))
(define (lower-bound interval) (cdr interval))

(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))

(define (sub-interval x y)
  (make-interval (- (upper-bound x) (lower-bound y))
                 (- (lower-bound x) (upper-bound y))))

(define life-savings (make-interval 10 20))
(define hacdc-dues (make-interval 5 10))
(define lottery-winnings (make-interval -2 -1)) ; Hrm, this seems off. Probably addressed later.

(sub-interval life-savings hacdc-dues)
(sub-interval life-savings lottery-winnings)
