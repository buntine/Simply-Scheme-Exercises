; What does the pigl procedure from Chapter 11 do if you invoke it with a word
; like "frzzmlpt" that has no vowels? Fix it so that it returns "frzzmlptay."

; Andy note: It was an example procedure to translate an English word into Pig Latin.

(define (has-vowel? wd)
  (cond ((empty? wd) #f)
        ((member? (first wd) 'aeiou) #t)
        (else (has-vowel? (bf wd)))))

(define (pigl wd)
  (if (has-vowel? wd)
    (if (member? (first wd) 'aeiou)
        (word wd 'ay)
        (pigl (word (bf wd) (first wd))))
    (word wd 'ay)))
