; Write a procedure letter-count that takes a sentence as its argument
; and returns the total number of letters in the sentence:
;
; > (letter-count ’(fixing a hole))
; 11
;
; Andy note: This works by applying count to each word in the sentence
;            and then reducing those numbers with +.
;            '(hello tom jones) -> '(5 3 5) -> (+ 5 3) -> (+ 8 5) -> 13

(define (letter-count se)
  (accumulate + (every count se)))
