; Write a procedure branch that takes as arguments a list of numbers and a nested
; list structure. It should be the list-of-lists equivalent of item, like this:
;
; > (branch ’(3) ’((a b) (c d) (e f) (g h)))
; (E F)
;
; > (branch ’(3 2) ’((a b) (c d) (e f) (g h)))
; F
;
; > (branch ’(2 3 1 2) ’((a b) ((c d) (e f) ((g h) (i j)) k) (l m)))
; H
;
; In the last example above, the second element of the list is
; ((C D) (E F) ((G H) (I J)) K)
; The third element of that smaller list is ((G H) (I J)); the first element of that is
; (G H); and the second element of that is just H.

; Andy note: I implemented this with zero indexes instead. It's better that way.

(define (branch element lst)
  (let ((index (car element)))
    (if (= (length element) 1)
      (list-ref lst index)
      (branch (cdr element) (list-ref lst index)))))
