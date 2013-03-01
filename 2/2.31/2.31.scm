(define (tree-map proc tree)
  (map (lambda (sub-tree)
         (if (pair? sub-tree)
             (tree-map proc sub-tree)
             (proc sub-tree)))
       tree))

(define (square x) (* x x))

(define (square-tree tree) (tree-map square tree))

; (1 (4 (9 16) 25) (36 49))

(square-tree
 (list 1
       (list 2 (list 3 4) 5)
       (list 6 7)))