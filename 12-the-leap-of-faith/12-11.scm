; Write the procedure count, which returns the number of words in a sentence or
; the number of letters in a word.

(define (count2 wd)
  (if (empty? wd)
    0
    (+ 1 (count2 (bf wd)))))
