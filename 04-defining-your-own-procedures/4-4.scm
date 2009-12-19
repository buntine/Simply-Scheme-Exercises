; Each of the following procedure definitions has an error of some kind. Say what’s
; wrong and why, and fix it:

; Procedure:
; (define (sphere-volume r)
;   (* (/ 4 3) 3.141592654)
;   (* r r r))

; Problem: Contains two separate expressions.

; Solution:
(define (sphere-volume r)
  (* (* r r r)
     (* (/ 4 3) 3.141592654)))


; Procedure:
; (define (next x)
;   (x + 1))

; Problem: Uses infix notation.

; Solution:
(define (next x)
  (+ x 1))


; Procedure:
; (define (square)
;   (* x x))

; Problem: Uses unbound value 'x'.

; Solution:
(define (square x)
  (* x x))


; Procedure:
(define (triangle-area triangle)
  (* 0.5 base height))

; Problem: Accepts wrong number of arguments.

; Solution:
(define (triangle-area base height)
  (* 0.5 base height))

; Procedure:
(define (sum-of-squares (square x) (square y))
  (+ (square x) (square y)))

; Problem: Actually tries to invoke procedure in definition.

; Solution:
(define (sum-of-squares x y)
  (+ (square x) (square y)))
