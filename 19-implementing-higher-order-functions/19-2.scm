; Write keefp. Don’t forget that keep has to return a sentence if its second argument
; is a sentence, and a word if its second argument is a word.
;
; (Hint: it might be useful to write a combine procedure that uses either word or
; sentence depending on the types of its arguments.)

(define (keep2 pred sent)
  (if (word? sent)
    (combine pred sent word "")
    (combine pred sent se '())))

(define (combine pred sent combiner null-value)
  (cond
    ((empty? sent) null-value)
    ((pred (first sent))
      (combiner (first sent) (combine pred (butfirst sent)
                                      combiner null-value)))
    (else (combine pred (butfirst sent)
                   combiner null-value))))
