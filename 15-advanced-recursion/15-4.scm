; Write a predicate procedure substring? that takes two words as arguments and
; returns #t if and only if the first word is a substring of the second. (See Exercise 15.3 for
; the definition of a substring.)
; Be careful about cases in which you encounter a “false start,” like this:
;
; > (substring? ’ssip ’mississippi)
; #T
;
; and also about subsets that don’t appear as consecutive letters in the second word:
;
; > (substring? ’misip ’mississippi)
; #F

(define (diminish wd)
  (if (empty? wd)
    '()
    (se wd (diminish (bl wd)))))

(define (substrings wd)
  (if (empty? wd)
    (se "")
    (se (diminish wd) (substrings (bf wd)))))

(define (substring? a b)
  (member? a (substrings b)))
