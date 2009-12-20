; Write a procedure two-first that takes two words as arguments, returning a
;two-letter word containing the first letters of the two arguments.
;
;> (two-first ’brian ’epstein)
;BE
;
;Now write a procedure two-first-sent that takes a two-word sentence as argument,
;returning a two-letter word containing the first letters of the two words.
;
;> (two-first-sent ’(brian epstein))
;BE


(define (two-first a b)
  (word (first a) (first b)))

(define (two-first-sent sent)
  (word
    (first (first sent))
    (first (first (butfirst sent)))))
