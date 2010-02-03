; Write a procedure vector-map! that takes two arguments, a function and a
; vector, and modifies the argument vector by replacing each element with the result of
; applying the function to that element. Your procedure should return the same vector.

(define (vector-map! fn vec)
  (v-m-helper! fn vec 0))

(define (v-m-helper! fn vec index)
  (if (= index (vector-length vec))
    vec
    (begin (vector-set! vec index (fn (vector-ref vec index)))
           (v-m-helper! fn vec (+ index 1)))))
