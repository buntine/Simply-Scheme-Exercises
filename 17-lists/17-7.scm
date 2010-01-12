; Append may remind you of sentence. They’re similar, except that append
; works only with lists as arguments, whereas sentence will accept words as well as lists.
; Implement sentence using append. (Note: The built-in sentence can take any
; number of arguments. First write a version that accepts only two arguments. Then,
; optionally, try to write a version that takes any number. Also, you don’t have to worry
; about the error checking that the real sentence does.)

(define (sentence2 a b)
  (cond ((word? a) (sentence2 (list a) b))
        ((word? b) (sentence2 a (list b)))
        (else (append a b))))

(define (listify lst)
  (map (lambda (l) (if (word? l) (list l) l)) lst))

(define (sentence3 . words)
  (if (empty? words)
    '()
    (apply append (listify words))))
