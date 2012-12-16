(define (square x) (* x x))

; Without higher-order procedures. This is taken more or less directly from the "scale-tree" example.

(define (square-tree-a tree factor)
  (cond ((null? tree) nil)
        ((not (pair? tree)) (square tree))
        (else (cons (square-tree (car tree) factor)
                    (square-tree (cdr tree) factor)))))

; With higher-order procedures.

(define (square-tree-b tree)
  (map (lambda (sub-tree)
         (if (pair? sub-tree)
             (square-tree-b sub-tree)
             (square sub-tree)))
       tree))

(square-tree-b
 (list 1
       (list 2 (list 3 4) 5)
       (list 6 7)))

; (1 (4 (9 16) 25) (36 49))