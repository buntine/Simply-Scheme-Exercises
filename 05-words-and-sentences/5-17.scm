; Write a procedure knight that takes a person’s name as its argument and returns
; he name with “Sir” in front of it.
;
; > (knight ’(david wessel))
; (SIR DAVID WESSEL)

(define (knight name)
  (sentence 'Sir name))
