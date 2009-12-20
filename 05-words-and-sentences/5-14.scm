; Write a procedure third that selects the third letter of a word (or the third word
; of a sentence).

(define (third wd)
  (first (butfirst
           (butfirst wd))))
