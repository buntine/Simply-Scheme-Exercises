; Write a procedure query that turns a statement into a question by swapping the
; first two words and adding a question mark to the last word:
;
; > (query ’(you are experienced))
; (ARE YOU EXPERIENCED?)
;
; > (query ’(i should have known better))
; (SHOULD I HAVE KNOWN BETTER?)

(define (query sent)
  (sentence (first (bf sent))
            (first sent)
            (bl (bf (bf sent)))
            (word (last sent) '?)))
