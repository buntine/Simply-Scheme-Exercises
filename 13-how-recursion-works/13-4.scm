; Here is a Scheme procedure that never finishes its job:
;
; (define (forever n)
;   (if (= n 0)
;        1
;        (+ 1 (forever n))))
;
; Explain why it doesn’t give any result. (If you try to trace it, make sure you know how to
; make your version of Scheme stop what it’s doing and give you another prompt.)


; This will result in an endlessly-recursive procedure because the size of the problem is
; not reduced with each recursive call. The base case will never be reached.
;
; Here is a working version:

(define (not-forever n)
  (if (= n 0)
    1
    (+ 1 (not-forever (- n 1))))) 
