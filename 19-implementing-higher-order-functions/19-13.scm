; Write deep-reduce, similar to tree-reduce, but for structured lists:
;
; > (deep-reduce word ’(r ((a (m b) (l)) (e (r)))))
; RAMBLER

(define (deep-reduce func lst)
  (cond ((null? lst) (func))
        ((list? (car lst)) 
          (func (deep-reduce func (car lst))
                (deep-reduce func (cdr lst))))
        (else (func (car lst)
                    (deep-reduce func (cdr lst))))))
