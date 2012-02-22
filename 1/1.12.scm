(define (pascal r c)
  (cond ((= c r) 1)
        ((= c 0) 1)
        ((> c r) 0) ; Inessential, arbitrary definition
        (else (+ (pascal (- r 1) (- c 1)) (pascal (- r 1) c)))
        ))


; Pascal's triangle using a more convienent indexing convention than that suggested in the book.

; e.g.

; 1 0 0 0 0
; 1 1 0 0 0
; 1 2 1 0 0
; 1 3 3 1 0
; 1 4 6 4 1

; So (pascal 4 2) returns 6. Worth noting that this is hideously inefficient.