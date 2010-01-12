; Write length.

(define (count-items lst i)
  (if (empty? lst)
    i
    (count-items (cdr lst) (+ i 1))))

(define (length2 lst)
  (count-items lst 0))

; Andy note: You could also implement this with reduce:

(define (length3 lst)
  (reduce +
    (map (lambda (n) 1) lst)))
