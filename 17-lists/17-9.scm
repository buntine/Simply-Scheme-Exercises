; Write list-ref

(define (list-ref2 lst n)
  (cond
    ((empty? lst) #f)
    ((= n 0) (car lst))
    (else (list-ref2 (cdr lst) (- n 1)))))
