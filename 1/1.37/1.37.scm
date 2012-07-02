(define (cont-frac-recursive n d k)
  (define (frac-term i)
   (if (= i k)
      (/
       (n i)
       (d i))
      (/
       (n i)
       (+ (d i) (frac-term (+ i 1))))))
  (frac-term 0))

(define (cont-frac-iterative n d k)
  (define (frac-term i accumulate)
   (if (< i 0)
      (/ (n i) accumulate)
      (frac-term (- i 1) (+ (d i) (/ (n (+ i 1)) accumulate)))))
  (frac-term k (/ (n k) (d k))))

(define cont-frac cont-frac-iterative)

(/ 1 (cont-frac-recursive (lambda (i) 1.0) ; Golden ratio
           (lambda (i) i)
           1000))

(/ 1 (cont-frac-iterative (lambda (i) 1.0) ; Golden ratio
           (lambda (i) i)
           1000))