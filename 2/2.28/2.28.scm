(define x (list (list 1 2) (list 3 4)))

(define (fringe tree)
  (if (pair? tree)
      (append (fringe (list-ref tree 0)) (fringe (list-ref tree 1))) ; To admit non-binary trees, you could use map/accumulate here.
      (list tree)))

(fringe x)
; (1 2 3 4)

(fringe (list x x))
; (1 2 3 4 1 2 3 4)