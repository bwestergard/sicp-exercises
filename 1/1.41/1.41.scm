(define (double f)
  (lambda (x) (f (f x))))

(define (inc x) (+ x 1))

; What value is returned by...?

(((double (double double)) inc) 5)

; At first I thought it would be 5 + 8. In other words, I read this as composing "doubling" 3 times:

((double (double (double inc))) 5)

; But that's not what's going on. In fact we're "doubling" the double prodcedure (giving us an "quadrupling" procedure), then "doubling" (composing twice) the result (quadrupling the quadrupling). So it's 5 + 16.

; If you think about it, this is the most mind-boggling exercise yet, and lays the groundwork for the definition of data structures in terms of first-order functions.