(define (cont-frac-iterative n d k)
  (define (frac-term i accumulate)
   (if (< i 0)
      (/ (n i) accumulate)
      (frac-term (- i 1) (+ (d i) (/ (n (+ i 1)) accumulate)))))
  (frac-term k (/ (n k) (d k))))

(define cont-frac cont-frac-iterative)

(define (tan-cf x k)
  (define (d k)
    (+ (* k 2) 1.0))
  (define (n k)
    (if (= k 0)
        x
        (* x x -1)
        ))
  (cont-frac n d k))
