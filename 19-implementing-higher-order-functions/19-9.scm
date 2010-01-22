; Rewrite either of the sort procedures from Chapter 15 to take two arguments, a list
; and a predicate. It should sort the elements of that list according to the given predicate:
;
; > (sort '(4 23 7 5 16 3) <)
; (3 4 5 7 16 23)
;
; > (sort '(4 23 7 5 16 3) >)
; (23 16 7 5 4 3)
;
; > (sort '(john paul george ringo) before?)
; (GEORGE JOHN PAUL RINGO)

(define (sort2 sent pred)
  (if (<= (count sent) 1)
     sent
     (merge (sort2 (one-half sent) pred)
            (sort2 (other-half sent) pred) pred)))

(define (merge left right pred)
  (cond ((empty? left) right)
        ((empty? right) left)
        ((pred (first left) (first right))
         (se (first left) (merge (bf left) right pred)))
        (else (se (first right) (merge left (bf right) pred)))))

(define (one-half sent)
  (if (<= (count sent) 1)
      sent
      (se (first sent) (one-half (bf (bf sent))))))

(define (other-half sent)
  (if (<= (count sent) 1)
      '()
      (se (first (bf sent)) (other-half (bf (bf sent))))))
