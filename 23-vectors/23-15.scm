; Generalize Exercise 23.14 by implementing an array structure that can have any
; number of dimensions. Instead of taking two numbers as index arguments, as the matrix
; procedures do, the array procedures will take one argument, a list of numbers. The
; number of numbers is the number of dimensions, and it will be constant for any particular
; array. For example, here is a three-dimensional array (4 * 5 * 6):
;
; > (define a1 (make-array '(4 5 6)))
; > (array-set! a1 '(3 2 3) '(the end))

(define (make-array dimensions)
  )

(define (array-set! array dimension value)
  )

(define (array-ref array dimension)
  )

; 2 ->     #(0 0)
; 2 2 ->   #(#(0 0) #(0 0))
; 2 2 2 -> #(#(#(0 0) #(0 0)) #(#(0 0) #(0 0)))
