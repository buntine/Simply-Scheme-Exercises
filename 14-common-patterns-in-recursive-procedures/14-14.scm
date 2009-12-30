; Write a predicate same-shape? that takes two sentences as arguments. It should
; return #t if two conditions are met: The two sentences must have the same number of
; words, and each word of the first sentence must have the same number of letters as the
; word in the corresponding position in the second sentence.
;
; > (same-shape? ’(the fool on the hill) ’(you like me too much))
; #T
;
; > (same-shape? ’(the fool on the hill) ’(and your bird can sing))
; #F

(define (same-length? a b)
  (= (count a) (count b)))

(define (same-shape? sent-a sent-b)
  (cond
    ((and (empty? sent-a) (empty? sent-b)) #t)
    ((not (same-length? sent-a sent-b)) #f)
    ((same-length? (first sent-a) (first sent-b))
      (same-shape? (bf sent-a) (bf sent-b)))
    (else #f)))
