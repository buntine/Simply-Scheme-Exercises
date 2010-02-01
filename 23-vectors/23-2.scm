; Some versions of Scheme provide a procedure vector-fill! that takes a vector
; and anything as its two arguments. It replaces every element of the vector with the second
; argument, like this:
;
; > (define vec (vector 'one 'two 'three 'four))
;
; > vec
; #(one two three four)
;
; > (vector-fill! vec ’yeah)
;
; > vec
; #(yeah yeah yeah yeah)
;
; Write vector-fill!. (It doesn't matter what value it returns.)

(define (vector-fill2! vec value)
  (vector-fill2-helper! vec value 0))

(define (vector-fill2-helper! vec value index)
  (if (= index (vector-length vec))
    vec
    (begin (vector-set! vec index value)
           (vector-fill2-helper! vec value (+ index 1)))))
