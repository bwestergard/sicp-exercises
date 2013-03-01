(define x (list (list 1 2) (list 3 4) (list 1 (list 2 7) 3 4)))

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (count-leaves t)
  (accumulate + 0 (map (lambda (branch)
                         (if (pair? branch)
                             (count-leaves branch)
                             1))
                       t)))

(count-leaves x)