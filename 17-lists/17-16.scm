; Write a predicate valid-infix? that takes a list as argument and returns #t if
; and only if the list is a legitimate infix arithmetic expression (alternating operands and
; operators, with parentheses—that is, sublists—allowed for grouping).
;
; > (valid-infix? '(4 + 3 * (5 - 2)))
; #T
;
; > (valid-infix? '(4 + 3 * (5 2)))
; #F

; Andy note: This version works fine, but I think that it's probably much cleaner to just
;            flatten all of the sub-lists and then run through each item making sure things
;            are in order.

(define (operator? wd)
  (list? (member wd '(* + - /))))

(define (recur-or-die pred lst)
  (if pred
    (infix-helper (car lst) (cdr lst))
    #f))

(define (infix-helper prev lst)
  (cond
    ((null? lst) #t)
    ((number? (car lst))
       (recur-or-die (operator? prev) lst))
    ((operator? (car lst))
       (recur-or-dir (or (number? prev)
                         (list? prev)) lst))
    ((list? (car lst))
       (recur-or-die (and (operator? prev)
                          (valid-infix? (car lst))) lst))
    (else #f)))

(define (valid-infix? lst)
  (if (null? lst)
    #f
    (infix-helper (car lst) (cdr lst))))
