(define x (list (list 1 2) (list 3 4)))

(define (deep-reverse list)
  (reverse (map reverse list))) ; It's this kind of thing, right here, that makes scheme so sweet.

x
; ((1 2) (3 4))

(reverse x)
; ((3 4) (1 2))

(deep-reverse x)
; ((4 3) (2 1))