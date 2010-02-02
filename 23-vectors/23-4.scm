; Write vector->list.

(define (vector->list2 vec)
  (v->l2-helper vec '() 0))

(define (v->l2-helper vec lst index)
  (if (= index (vector-length vec))
    lst
    (v->l2-helper vec (endcons (vector-ref vec index)
                               lst)
                  (+ index 1))))

(define (endcons value lst)
  (append lst (cons value '())))
