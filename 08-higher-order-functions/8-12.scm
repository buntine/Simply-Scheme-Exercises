; When you teach a class, people will get distracted if you say “um” too many
; times. Write a count-ums that counts the number of times “um” appears in a sentence:
;
; > (count-ums
;    ’(today um we are going to um talk about functional um programming))
; 3

(define (count-ums sent)
  (let ((is-um? (lambda (wd) (equal? wd 'um))))
    (count (keep is-um? sent))))
