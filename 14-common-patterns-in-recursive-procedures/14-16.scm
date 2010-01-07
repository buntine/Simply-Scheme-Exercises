; Write a procedure syllables that takes a word as its argument and returns the
; number of syllables in the word, counted according to the following rule: the number
; of syllables is the number of vowels, except that a group of consecutive vowels counts as
; one. For example, in the word “soaring,” the group “oa” represents one syllable and the
; vowel “i” represents a second one.
;
; Be sure to choose test cases that expose likely failures of your procedure. For example,
; what if the word ends with a vowel? What if it ends with two vowels in a row? What if it
; has more than two consecutive vowels?
;`
; (Of course this rule isn’t good enough. It doesn’t deal with things like silent “e”s
; that don’t create a syllable (“like”), consecutive vowels that don’t form a diphthong
; (“cooperate”), letters like “y” that are vowels only sometimes, etc. If you get bored, see
; whether you can teach the program to recognize some of these special cases.)

(define (vowel? c)
  (member? c 'aeiou))

(define (count-syllables wd n repeats)
  (let ((increment (if (> repeats 0) 1 0)))
    (cond
      ((empty? wd) (+ increment n))
      ((vowel? (first wd))
        (count-syllables (bf wd) n (+ repeats 1)))
      (else
        (count-syllables (bf wd) (+ increment n) 0)))))

(define (syllables wd)
  (count-syllables wd 0 0))
