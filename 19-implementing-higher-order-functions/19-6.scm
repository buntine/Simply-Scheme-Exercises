; Write a procedure true-for-any-pair? that takes a predicate and a sentence
; as arguments. The predicate must accept two words as its arguments. Your procedure
; should return #t if the argument predicate will return true for any two adjacent words
; in the sentence:
;
; > (true-for-any-pair? equal? ’(a b c b a))
; #F
;
; > (true-for-any-pair? equal? ’(a b c c d))
; #T
;
; > (true-for-any-pair? < ’(20 16 5 8 6))
; #T

(define (firsttwo lst)
  (cond ((null? lst) '())
        ((null? (cdr lst)) (cons (car lst) '()))
        (else (list (car lst) (cadr lst)))))
    
(define (true-for-any-pair? pred lst)
  (cond
    ((>= (length lst) 1) #f)
    ((apply pred (firsttwo lst)) #t)
    (else
      (true-for-any-pair? pred (cdr lst)))))
