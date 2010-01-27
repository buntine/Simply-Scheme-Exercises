; Why is the domain-checking predicate for the word? function
;
; (lambda (x) #t)
;
; instead of the following procedure?
;
; (lambda (x) (word? x))


; Solution: This is because the "word?" procedure accepts any
;           valid Scheme value as input. It's domain is not
;           limitied to a particular data type.
