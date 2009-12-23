; When you’re talking to someone over a noisy radio connection, you sometimes have
; to spell out a word in order to get the other person to understand it. But names of letters
; aren’t that easy to understand either, so there’s a standard code in which each letter is
; represented by a particular word that starts with the letter. For example, instead of “B”
; you say “bravo.”
;
; Write a procedure words that takes a word as its argument and returns a sentence of the
; names of the letters in the word:
;
; > (words ’cab)
; (CHARLIE ALPHA BRAVO)
;
; (You may make up your own names for the letters or look up the standard ones if you
; want.)
;
; Hint: Start by writing a helper procedure that figures out the name for a single letter.

; Andy note: They have not introduced a dictionary data structure yet, hence the silly
;            implementation of radio-word (and the missing letters).

(define (radio-word l)
  (cond ((equal? l 'a) 'alpha)
        ((equal? l 'b) 'bravo)
        ((equal? l 'c) 'charlie)
        ((equal? l 'd) 'dingo)
        ((equal? l 'e) 'easy)
        (else 'nothing)))

(define (radio-words wd)
  (se (every radio-word wd)))
