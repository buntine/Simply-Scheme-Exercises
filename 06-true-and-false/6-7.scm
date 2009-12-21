; Write a procedure type-of that takes anything as its argument and returns one of
; the words word, sentence, number, or boolean:
;
; > (type-of ’(getting better))
; SENTENCE
;
; > (type-of ’revolution)
; WORD
;
; > (type-of (= 3 3))
; BOOLEAN
;
; (Even though numbers are words, your procedure should return number if its argument
; is a number.)
;
; Feel free to check for more specific types, such as “positive integer,” if you are so inclined.

(define (type-of-number n)
  (if (< n 0)
    "negative number"
    "positive number"))

(define (type-of x)
  (cond
    ((number? x) (type-of-number x))
    ((sentence? x) 'sentence)
    ((word? x) 'word)
    ((boolean? x) 'boolean)
    (else 'unknown)))
