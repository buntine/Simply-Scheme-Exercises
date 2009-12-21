; Write a procedure insert-and that takes a sentence of items and returns a new
;sentence with an “and” in the right place:
;
; > (insert-and ’(john bill wayne fred joey))
; (JOHN BILL WAYNE FRED AND JOEY)

(define (insert-and sent)
  (sentence (bl sent) 'and (last sent)))
