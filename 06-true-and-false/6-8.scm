; Write a procedure indef-article that works like this:
;
; > (indef-article ’beatle)
; (A BEATLE)
;
; > (indef-article ’album)
; (AN ALBUM)
;
; Don’t worry about silent initial consonants like the h in hour.

(define (vowel? c)
  (member? c 'aeiou))

(define (indef-article wd)
  (sentence
    (if (vowel? (first wd)) 'an 'a)
    wd))
