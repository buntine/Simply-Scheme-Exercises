; Write length.

(define (count-items lst i)
  (if (empty? lst)
    i
    (count-items (cdr lst) (+ i 1))))

(define (length2 lst)
  (count-items lst 0))
