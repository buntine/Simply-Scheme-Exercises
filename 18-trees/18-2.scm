; Suppose we change the definition of the tree constructor so that it uses list
; instead of cons:
;
; (define (make-node datum children)
;    (list datum children))
;
; How do we have to change the selectors so that everything still works?


; Answer: If we used list instead of cons then we would have a list that
;         two elements; a word and a list.
;
;         Cons: '(australia (wa (perth)) (nsw))
;         List: '(australia ((wa ((perth))) (nsw)))
;
;         For things to still work, we'd need to use cadr, or perhaps
;         (datum (children x)).
