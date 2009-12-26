; Write a procedure real-words that takes a sentence as argument and returns
; all the “real” words of the sentence, using the same rule as the real-word? procedure
; from Chapter 1.

(define (real-word? wd)
  (not (member? wd '(a the an in of and for to with))))

(define (get-real-word wd)
  (if (real-word? wd)
    wd
    '()))

(define (real-words sent)
  (if (empty? sent)
    sent
    (se (get-real-word (first sent))
        (real-words (bf sent)))))
