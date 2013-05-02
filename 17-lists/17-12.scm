; Write a procedure called flatten that takes as its argument a list, possibly
; including sublists, but whose ultimate building blocks are words (not Booleans or
; procedures). It should return a sentence containing all the words of the list, in the order
; in which they appear in the original:
;
; > (flatten '(((a b) c (d e)) (f g) ((((h))) (i j) k)))
; (A B C D E F G H I J K)

(define (flatten lst)
  (if (word? lst)
    lst
    (reduce se
      (map (lambda (sublist) (flatten sublist))
           lst))))

; Alternative without using 'se'
(define (flatten l)
    (cond ((null? l) '())
          ((word? l) (list l))
          (else (append (flatten (car l))
                        (flatten (cdr l))))))
