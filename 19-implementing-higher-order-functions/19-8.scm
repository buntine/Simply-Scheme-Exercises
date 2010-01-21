; Rewrite true-for-all-pairs? (Exercise 19.7) using true-for-any-pair?
; (Exercise 19.6) as a helper procedure. Don't use recursion in solving this problem
; (except for the recursion you've already used to write true-for-any-pair?). 
;
; Hint: You'll find the not procedure helpful.

(define (firsttwo lst)
  (cond ((null? lst) '())
        ((null? (cdr lst)) (cons (car lst) '()))
        (else (list (car lst) (cadr lst)))))
    
(define (false-for-any-pair? pred lst)
  (cond
    ((<= (length lst) 1) #f)
    ((not (apply pred (firsttwo lst))) #t)
    (else
      (false-for-any-pair? pred (cdr lst)))))

(define (true-for-all-pairs? pred lst)
  (not (false-for-any-pair? pred lst)))
