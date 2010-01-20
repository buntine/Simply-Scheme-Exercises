; Our accumulate combines elements from right to left. That is,
;
; (accumulate - '(2 3 4 5))
;
; computes 2 − (3 − (4 − 5)). Write left-accumulate, which will compute ((2 − 3) − 4) − 5
; instead. (The result will be the same for an operation such as +, for which grouping
; order doesn't matter, but will be different for -.)

; Andy note: I've implemented this simply just to demonstrate I understand the concept.
;            You could take it further to work with all data types.

(define (last sent)
  (if (null? (cdr sent))
      (car sent)
      (last (cdr sent))))

(define (butlast sent)
  (if (null? (cdr sent))
      '()
      (cons (car sent) (butlast (cdr sent)))))

(define (left-accumulate func lst)
  (cond
    ((null? lst) 0)
    ((< (length lst) 3) (apply func lst))
    (else
      (func (left-accumulate func (butlast lst))
            (last lst)))))
