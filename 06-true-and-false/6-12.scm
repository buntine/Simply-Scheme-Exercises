; Make plural handle correctly words that end in y but have a vowel before the y,
; such as boy. Then teach it about words that end in x (box). What other special cases
; can you find?
;
; Andy note: The plural precedure was presented during this chapters text. It was defined
; as:
;
; (define (plural wd)
;   (if (equal? (last wd) 'y)
;       (word (bl wd) 'ies)
;       (word wd 's)))

(define (vowel? char)
  (member? char 'aeiou))

(define (secondlast x)
  (last (bl x)))

(define (plural wd)
  (cond
    ((and
       (equal? (last wd) 'y)
       (vowel? (secondlast wd)))
      (word wd 's))
    ((equal? (last wd) 'y) (word (bl wd) 'ies))
    ((equal? (last wd) 'x) (word wd 'es))
    (else (word wd 's))))
