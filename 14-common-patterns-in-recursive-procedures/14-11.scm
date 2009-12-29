; Write the procedure remove-adjacent-duplicates that takes a sentence as
; argument and returns the same sentence but with any word that’s immediately followed
; by the same word removed:
;
;  > (remove-adjacent-duplicates ’(y a b b a d a b b a d o o))
; (Y A B A D A B A D O)
;
; > (remove-adjacent-duplicates ’(yeah yeah yeah))
; (YEAH)

; Classification: keep

(define (remove-adjacent-duplicates sent)
  (if (<= (count sent) 1)
    sent
    (se
      (if (equal? (first sent) (first (bf sent)))
        '()
        (first sent))
      (remove-adjacent-duplicates (bf sent)))))


