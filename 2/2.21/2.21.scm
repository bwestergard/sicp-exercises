(define (square-list-a items)
  (if (null? items)
      nil
      (cons (square (car items)) (square-list-a (cdr items)))))

(define (square-list-b items)
  (map (lambda (x) (* x x)) items))

(define (square x)
  (* x x))

(define foo (list 324 5345 5464 112))

(square-list-a foo)
(square-list-b foo)