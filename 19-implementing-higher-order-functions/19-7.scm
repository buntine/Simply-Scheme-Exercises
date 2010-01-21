; Write a procedure true-for-all-pairs? that takes a predicate and a sentence
; as arguments. The predicate must accept two words as its arguments. Your procedure
; should return #t if the argument predicate will return true for every two adjacent words
; in the sentence:
;
; > (true-for-all-pairs? equal? '(a b c c d))
; #F
;
; > (true-for-all-pairs? equal? '(a a a a a))
; #T
;
; > (true-for-all-pairs? < '(20 16 5 8 6))
; #F

(define (firsttwo lst)
  (cond ((null? lst) '())
        ((null? (cdr lst)) (cons (car lst) '()))
        (else (list (car lst) (cadr lst)))))
 
(define (true-for-all-pairs? pred lst)
 (cond
   ((<= (length lst) 1) #t)
   ((apply pred (firsttwo lst))
     (true-for-all-pairs? pred (cdr lst)))
   (else #f)))
