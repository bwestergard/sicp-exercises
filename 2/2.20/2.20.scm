(define (same-parity reference . others)
  (define (remove-mismatch others)
    (if (null? others)
        nil
        (if (equal? (even? (car others)) (even? reference))
            (cons (car others) (remove-mismatch (cdr others)))
            (remove-mismatch (cdr others)))
        )
    )
  (remove-mismatch (cons reference others))
  )

(same-parity 1 2 3 4 5 6 7)

(same-parity 2 3 4 5 6 7)