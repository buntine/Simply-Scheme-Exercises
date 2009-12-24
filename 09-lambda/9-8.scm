; Suppose we’re writing a program to play hangman. In this game one player has
; to guess a secret word chosen by the other player, one letter at a time. You’re going
; to write just one small part of this program: a procedure that takes as arguments the
; secret word and the letters guessed so far, returning the word in which the guessing
; progress is displayed by including all the guessed letters along with underscores for the
; not-yet-guessed ones:
;
; > (hang ’potsticker ’etaoi)
;  _OT_TI__E_
;
; Hint: You’ll find it helpful to use the following procedure that determines how to display
; a single letter:
;
; (define (hang-letter letter guesses)
;    (if (member? letter guesses)
;         letter
;         '_))

(define (hang-letter letter guesses)
  (if (member? letter guesses)
    letter
    '_))

(define (hang wd guesses)
  (accumulate
    word
    (every (lambda (l) (hang-letter l guesses)) wd)))
