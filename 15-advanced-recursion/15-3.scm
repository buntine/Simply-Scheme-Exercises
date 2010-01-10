; Write a procedure substrings that takes a word as its argument. It should return
; a sentence containing all of the substrings of the argument. A substring is a subset whose
; letters come consecutively in the original word. For example, the word bat is a subset,
; but not a substring, of brat.

(define (diminish wd)
  (if (empty? wd)
    '()
    (se wd (diminish (bl wd)))))

(define (substrings wd)
  (if (empty? wd)
    (se "")
    (se (diminish wd) (substrings (bf wd)))))
