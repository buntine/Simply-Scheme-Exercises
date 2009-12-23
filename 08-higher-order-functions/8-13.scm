; Write a procedure phone-unspell that takes a spelled version of a phone
; number, such as POPCORN, and returns the real phone number, in this case 7672676.
; You will need to write a helper procedure that uses an 8-way cond expression to translate
; a single letter into a digit.

(define (number-for-letter l)
  (cond ((member? l 'abc) 2)
        ((member? l 'def) 3)
        ((member? l 'ghi) 4)
        ((member? l 'jkl) 5)
        ((member? l 'mno) 6)
        ((member? l 'pqrs) 7)
        ((member? l 'tuv) 8)
        ((member? l 'wxyz) 9)
        (else 0)))

(define (phone-unspell wd)
  (accumulate word (every number-for-letter wd)))
