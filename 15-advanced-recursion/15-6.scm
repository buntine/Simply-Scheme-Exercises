; Let's say a gladiator kills a roach. If we want to talk about the roach, we say "the
; roach the gladiator killed." But if we want to talk about the gladiator, we say "the gladiator
; that killed the roach."
;
; People are pretty good at understanding even rather long sentences as long as they're
; straightforward: "This is the farmer who kept the cock that waked the priest that married
; the man that kissed the maiden that milked the cow that tossed the dog that worried the
; cat that killed the rat that ate the malt that lay in the house that Jack built." But even a
; short nested sentence is confusing: "This is the rat the cat the dog worried killed." Which
; rat was that?
;
; Write a procedure unscramble that takes a nested sentence as argument and returns a
; straightforward sentence about the same cast of characters:
;
; > (unscramble '(this is the roach the gladiator killed))
; (THIS IS THE GLADIATOR THAT KILLED THE ROACH)
;
; > (unscramble '(this is the rat the cat the dog the boy the
;                 girl saw owned chased bit))
; (THIS IS THE GIRL THAT SAW THE BOY THAT OWNED THE DOG THAT
;  CHASED THE CAT THAT BIT THE RAT)
;
; You may assume that the argument has exactly the structure of these examples, with no
; special cases like "that lay in the house" or "that Jack built."

(define (last-n wd n)
  ((repeated bf (- (count wd) n)) wd))

; Extracts the characters from the sentence.
(define (characters sent)
  (if (<= (count sent) 1)
    '()
    (se
      (if (equal? (first sent) 'the)
        (first (bf sent))
        '())
      (characters (bf sent)))))

; Extracts the nouns from the sentence.
(define (nouns sent)
  (last-n sent (- (count (characters sent)) 1)))

; Reassembles the characters and nouns into a new sentence.
(define (assemble characters nouns)
  (if (empty? nouns)
    (se 'the (first characters))
    (se 'the (first characters) 'that (first nouns)
        (assemble (bf characters) (bf nouns)))))

(define (unscramble sent)
  (se 'this 'is 
      (assemble (reverse (characters sent)) (nouns sent))))
