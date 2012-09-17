(define (square-list-a items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things) 
              (cons answer
                    (square (car things))))))
  (iter items nil))

(define (square-list-b items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things) 
              (cons (square (car things))
                    answer))))
  (iter items nil))

(define (square x) (* x x))

(define foo (list 1 2 3 4 5))

; The basic problem in versions A/B is that in order to append to a list
; we need to insert replace the cdr of the innermost/last cons
; cell of the existing list, as the 'append' language primitive does.
; As is, these are wrapping another cons cell around the answer passed from
; the calling procedure. Version A places the existing portion of the answer
; in the car, B in the car.

; I actually ran into this problem on an earlier question, because I'd somehow
; missed the mention of "append". Butting my heading against the problem for 15
; minutes was educational.

(square-list-a foo)

(square-list-b foo)

; Here is a version that works properly.
; Note that if append is defined as show earlier in the book, and cons/cdr/car are constant time, append is O(n) and this is O(n^2).
; This seems to make the whole cons/car/cdr thing a bit academic.

(define (square-list-c items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things) 
              (append answer (list (square (car things)))
                      ))))
  (iter items nil))

(square-list-c foo)