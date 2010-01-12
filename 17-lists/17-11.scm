; Write before-in-list?, which takes a list and two elements of the list. It
; should return #t if the second argument appears in the list argument before the third
; argument:
;
; > (before-in-list? ’(back in the ussr) ’in ’ussr)
; #T
;
; > (before-in-list? ’(back in the ussr) ’the ’back)
; #F
;
; The procedure should also return #f if either of the supposed elements doesn’t appear
; at all.

(define (before-in-list? lst a b)
  (cond
    ((null? lst) #f)
    ((equal? (car lst) a) (member? b (cdr lst)))
    ((equal? (car lst) b) #f)
    (else (before-in-list? (cdr lst) a b))))
