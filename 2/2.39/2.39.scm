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

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (append seq1 seq2)
  (accumulate cons seq2 seq1))

(define (reverse-a sequence)
  (fold-right (lambda (x y) (append y (list x))) nil sequence))
(define (reverse-b sequence)
  (fold-left (lambda (x y) (cons y x)) nil sequence))

(define foo-list (list 1 2 3 4 5 6))

(reverse-a foo-list)
(reverse-b foo-list)