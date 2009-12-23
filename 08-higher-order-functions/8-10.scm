; Write a predicate true-for-all? that takes two arguments, a predicate proce-
; dure and a sentence. It should return #t if the predicate argument returns true for every
; word in the sentence.
;
; > (true-for-all? even? ’(2 4 6 8))
; #T
;
; > (true-for-all? even? ’(2 6 3 4))
; #F

(define (true-for-all? pred sent)
  (= (count sent) (count (keep pred sent))))
