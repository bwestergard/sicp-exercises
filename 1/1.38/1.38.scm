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

(define cont-frac cont-frac-recursive)

(define (d k)
    (if (= (remainder (+ k 2) 3) 0)
        (* (/ (+ k 2) 3) 2) ; This is totally perspicuous, right? :)
        1))

(define (n k)
  1.0)

(+ 2 (cont-frac n d 100))
