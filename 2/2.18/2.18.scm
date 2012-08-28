(define (append list1 list2)
  (if (null? list1)
      list2
      (cons (car list1) (append (cdr list1) list2))))

(define (reverse L)
  (if (null? (cdr L))
      L
      (append (reverse (cdr L)) (list (car L)))))

(reverse (list 1 2 3 4 5 7 8 9 10))