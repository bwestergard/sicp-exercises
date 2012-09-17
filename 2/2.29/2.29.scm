(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))

(define (left-branch mobile)
  (list-ref mobile 0))

(define (right-branch mobile)
  (list-ref mobile 1))

(define (branch-length branch)
  (list-ref branch 0))

(define (branch-structure branch)
  (list-ref branch 1))

(define small-mobile (make-mobile (make-branch 1 20) (make-branch 1 20)))

(define ex-mobile (make-mobile (make-branch 2 small-mobile) (make-branch 0.5 160)))

(define (total-weight mobile)
  (if (pair? mobile)
      (+ (total-weight (branch-structure (left-branch mobile)))
         (total-weight (branch-structure (right-branch mobile)))
         )
      mobile
      )
  )

(define (balanced? mobile)
  (if (pair? mobile)
      (and 
       (=
        (* (total-weight (branch-structure (left-branch mobile)))
           (branch-length (left-branch mobile))
           )
        (* (total-weight (branch-structure (right-branch mobile)))
           (branch-length (right-branch mobile))
           )
        )
       (and (balanced? (branch-structure (left-branch mobile)))
            (balanced? (branch-structure (right-branch mobile)))))
     #t)
  )

(total-weight ex-mobile)

(balanced? ex-mobile)