; Write member.

(define (member2 n lst)
  (if (empty? lst)
    #f
    (if (equal? n (car lst))
      lst
      (member2 n (cdr lst)))))
      
