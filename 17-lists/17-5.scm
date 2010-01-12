; Here's a procedure that takes two numbers as arguments and returns whichever
; number is larger:
;
; (define (max2 a b)
;   (if (> b a) b a))
;
; Use max2 to implement max, a procedure that takes one or more numeric arguments
; and returns the largest of them.

(define (max2 a b)
  (if (> b a) b a))

(define (maxxx n . the-rest)
  (if (null? the-rest)
    n
    (apply maxxx
           (cons (max2 n (car the-rest))
                 (cdr the-rest)))))
