; Write a procedure choose-beatles that takes a predicate function as its argument
; and returns a sentence of just those Beatles (John, Paul, George, and Ringo) that satisfy
; the predicate. For example:
;
; (define (ends-vowel? wd) (vowel? (last wd)))
; (define (even-count? wd) (even? (count wd)))
;
; > (choose-beatles ends-vowel?)
; (GEORGE RINGO)
;
; > (choose-beatles even-count?)
; (JOHN PAUL GEORGE)

(define (choose-beatles pred)
  (keep pred '(John Paul George Ringo)))
