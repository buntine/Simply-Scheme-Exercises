; Write a function vector-appenecd that works just like regular append, but for
; vectors:
;
; > (vector-append '#(not a) '#(second time))
; #(not a second time)

(define (vector-append vec-a vec-b)
  (if (= (vector-length vec-b) 0)
    vec-a
    (v-a-helper vec-a vec-b 0)))

(define (v-a-helper vec-a vec-b index)
  (if (= index (vector-length vec-b))
    vec-a
    (v-a-helper (vector-add vec-a (vector-ref vec-b index))
                vec-b
                (+ 1 index))))

(define (vector-add vec value)
  (apply vector (endcons value (vector->list vec))))

(define (endcons value lst)
  (append lst (cons value '())))
