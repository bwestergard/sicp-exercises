(define (fold-right op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (fold-right op initial (cdr sequence)))))

(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter initial sequence))

(fold-right / 1 (list 1 2 3)) ; 3/2
(fold-left / 1 (list 1 2 3)) ; 2/3
(display (fold-right list nil (list 1 2 3))) ; 1 2 3
(display (fold-left list nil (list 1 2 3))) ; 3 2 1. Weird, I get (((() 1) 2) 3)

; fold -left and -right are equivalent if op is commutative.