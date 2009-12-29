; Write the procedure count-adjacent- duplicates that takes a sentence as
; an argument and returns the number of words in the sentence that are immediately
; followed by the same word:
;
; > (count-adjacent-duplicates '(y a b b a d a b b a d o o))
; 3
;
; > (count-adjacent-duplicates '(yeah yeah yeah))
; 2

; Classification: Keep + Accumulate

(define (cad-helper n sent)
  (cond ((<= (count sent) 1) n)
        ((equal? (first sent) (first (bf sent)))
          (cad-helper (+ n 1) (bf sent)))
        (else
          (cad-helper n (bf sent)))))

(define (count-adjacent-duplicates sent)
  (cad-helper 0 sent))
