(define (merge-sort l comp)
  
  (define (merge a b)
    (define (continue-merge a b merged)
      (if (or (= (length a) 0) (= (length b) 0))
          (append merged a b)
          (if (comp (car a) (car b))
              (continue-merge (cdr a) b (append merged (list (car a))))
              (continue-merge a (cdr b) (append merged (list (car b)))))))
    (continue-merge a b '()))
  
  (define (split u)
    (define (continue-split r a b)
      (if (> (length r) 1)
          (continue-split
           (cdr (cdr r))
           (append a (list (car r)))
           (append b (list (car (cdr r)))))
          (cons (append a r) b)))
    (continue-split u '() '()))
  
  (if (= (length l) 1)
      l
      (let (
            (top (car (split l)))
            (bot (cdr (split l)))
            )
        (merge (merge-sort top comp) (merge-sort bot comp))))
  )

(define (vector-*-scalar v s)
  (map (lambda (x) (* s x)) v))

(define (vector-+-vector a b)
  (map (lambda (x y) (+ x y)) a b))

(define (reduce m)
  
  (define (wrap outer inner)
    (append (list (car outer))
            (map
             (lambda (o-row i-row) (cons (car o-row) i-row))
             (cdr outer)
             inner)))

  (define (shed m)
    (map (lambda (row) (cdr row)) (cdr m)))
  
  (define (pivot v)
  (if (or (not (= (car v) 0)) (null? (cdr v)))
      (car v)
      (pivot (cdr v))))
  
  (define (eliminate m)
    
    (define (scale-vector v)
      (vector-*-scalar v (/ 1 (pivot v))))
    
    (if (= (car (car m)) 0)
        m
        (let ((scaled (scale-vector (car m))))
          (cons
           scaled
           (map (lambda (row) (vector-+-vector (vector-*-scalar scaled (* (pivot row) -1))
                                               row))
                (cdr m))
           ))))
  
  (let
      ((s (merge-sort m (lambda (x y) (> (abs (pivot x)) (abs (pivot y)))))))
    (if (= (length s) 1)
        (eliminate s)
        (wrap (eliminate s) (reduce (shed (eliminate s)))))))

(define foo-matrix '((1 3 4 5) (1 3 9 2) (1 3 9 2) (1 3 9 2)))

(display (reduce foo-matrix))