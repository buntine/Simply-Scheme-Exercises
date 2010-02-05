; Implement a two-dimensional version of vectors. (We'll call one of these structures
; a matrix.) The implementation will use a vector of vectors. For example, a three-by-five
; matrix will be a three-element vector, in which each of the elements is a five-element
; vector. Here’s how it should work:
;
; > (define m (make-matrix 3 5))
;
; > (matrix-set! m 2 1 ’(her majesty))
; > (matrix-ref m 2 1)
;
; (HER MAJESTY)

; Andy note: Using make-vector here did not work as each sub-vector
;            was infact the same object. I could not mutate each in
;            isolation.
;            This causes the construction to be more complex, but
;            allows me to greatly simplify the set! and ref procedures.

(define (make-matrix x y)
  (apply vector
         (make-vectors '() x y)))

(define (make-vectors vecs amount len)
  (if (= amount 0)
    vecs
    (make-vectors (cons (apply vector
                               (make-list '() len 0)) vecs)
                  (- amount 1)
                  len)))

(define (make-list lst amount value)
  (if (= amount 0)
    lst
    (make-list (cons value lst)
               (- amount 1)
               value)))

(define (matrix-set! matrix x y value)
  (let ((vec (vector-ref matrix x)))
    (if vec
      (vector-set! (vector-ref matrix x) y value))))

(define (matrix-ref matrix x y)
  (vector-ref (vector-ref matrix x) y))
