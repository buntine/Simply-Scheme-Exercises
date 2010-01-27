; The domain-checking function for equal? is
;
; (lambda (x y) #t)
;
; This seems silly; it's a function of two arguments that ignores both arguments and always
; returns #t. Since we know ahead of time that the answer is #t, why won't it work to have
; equal?'s entry in the a-list be
;
; (list 'equal? equal? 2 #t)


; Solution: It must conform to the domain the program expects. The procedure that calls it
;           expects to see a function with two arguments. If we just return the #t value,
;           an error will occur because we've provided the incorrect data type.
