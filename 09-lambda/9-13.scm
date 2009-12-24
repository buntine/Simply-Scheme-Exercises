; Write a procedure compose that takes two functions f and g as arguments. It
; should return a new function, the composition of its input functions, which computes
; f (g (x )) when passed the argument x .
;
; > ((compose sqrt abs) -25)
; 5
;
; > (define second (compose first bf))
; > (second ’(higher order function))
; ORDER

(define (compose f g)
  (lambda (x) (f (g x))))
