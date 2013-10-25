; 2.41

(define (accumulate op initial sequence)
   (if (null? sequence)
       initial
       (op (car sequence)
           (accumulate op initial (cdr sequence)))))

(define (enumerate-interval low high)
  (if (> low high)
      nil
      (cons low (enumerate-interval (+ low 1) high))))

(define (flatmap proc seq)
  (accumulate append nil (map proc seq)))

(define ei enumerate-interval)

(define (filter predicate sequence)
  (cond ((null? sequence) nil)
        ((predicate (car sequence))
         (cons (car sequence)
               (filter predicate (cdr sequence))))
        (else (filter predicate (cdr sequence)))))

; Fun question: How do you extend this from 3-tuples to n-tuples?

(define (triples n)
  (flatmap (lambda (x)
             (flatmap (lambda (y)
                        (map (lambda (z) 
                               (list x y z))
                             (ei 1 n))
                        )
                      (ei 1 n))
             )
           (ei 1 n)
           )
  )

(define (sum list) (accumulate (lambda (x y) (+ x y)) 0 list))

(define (triples-sum n s) (filter (lambda (list) (= (sum list) s)) (triples n)))

(display (triples-sum 10 6))
