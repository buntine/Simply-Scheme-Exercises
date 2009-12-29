; Write a procedure called location that takes two arguments, a word and a
; sentence. It should return a number indicating where in the sentence that word can be
; found. If the word isn’t in the sentence, return #f. If the word appears more than once,
; return the location of the first appearance.
;
; > (location ’me ’(you never give me your money))
; 4

; Classification: None, but close to accumulate.

(define (location-helper n wd sent)
  (if (empty? sent)
    #f
    (if (equal? wd (first sent))
      n
      (location-helper (+ n 1) wd (bf sent)))))

(define (location wd sent)
  (location-helper 1 wd sent))
