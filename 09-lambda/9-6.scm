; Write a procedure sentence-version that takes a function F as its argument
; and returns a function G . F should take a single word as argument. G should take a
; sentence as argument and return the sentence formed by applying F to each word of that
; argument.
;
; > ((sentence-version first) ’(if i fell))
; (I I F)
;
; > ((sentence-version square) ’(8 2 4 6))
; (64 4 16 36)
;
; Andy note: This solution seems almost *too* simple, considering the explanation of
;            the question!

(define (sentence-version f)
  (lambda (sent) (every f sent)))

