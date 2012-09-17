(define (for-each procedure list)
  (procedure (car list))
  (if (null? (cdr list))
      true
      (for-each procedure (cdr list))
  ))

(for-each (lambda (x) (newline) (display x))
          (list 57 321 88))
