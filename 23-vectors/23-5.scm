; Write a procedure vector-map that takes two arguments, a function and a vector,
; and returns a new vector in which each box contains the result of applying the function
; to the corresponding element of the argument vector.

(define (vector-map fn vec)
  (v-m-helper fn vec '#() 0))

(define (v-m-helper fn vec newvec index)
  (if (= index (vector-length vec))
    newvec
    (v-m-helper fn
                vec
                (vector-add newvec
                             (fn (vector-ref vec index)))
                (+ index 1))))

(define (vector-add vec value)
  (apply vector (endcons value (vector->list vec))))

(define (endcons value lst)
  (append lst (cons value '())))
