; Define a procedure fourth that computes the fourth power of its argument. Do
; this two ways, first using the multiplication function, and then using square and not
; (directly) using multiplication.

(define (fourth-a x)
  (* x x x x))

(define (fourth-b x)
  (square (square x)))
