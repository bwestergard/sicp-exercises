(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (display (* guess 1.0))
    (newline)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (average x y) (/ (+ x y) 2))

(fixed-point (lambda (x) (/ (log 1000) (log x))) 2) ; No damping

(fixed-point (lambda (x) (average x (/ (log 1000) (log x)))) 2) ; Damping. Converges significantly faster.
;2.0
;5.9828921423310435
;4.922168721308343
;4.628224318195455
;4.568346513136242
;4.5577305909237005
;4.555909809045131
;4.555599411610624
;4.5555465521473675
;4.555537551999825