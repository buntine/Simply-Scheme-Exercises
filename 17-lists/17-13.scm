; Here is a procedure that counts the number of words anywhere within a structured
; list:
;
; (define (deep-count lst)
;    (cond ((null? lst) 0)
;          ((word? (car lst)) (+ 1 (deep-count (cdr lst))))
;          (else (+ (deep-count (car lst))
;                      (deep-count (cdr lst))))))
;
; Although this procedure works, it's more complicated than necessary. Simplify it.

(define (deep-count lst)
   (cond ((null? lst) 0)
         ((word?  1))
         (else (reduce + (map (lambda (n) (deep-count n)) lst)))))
