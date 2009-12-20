; Try the following and explain the result:
;
; (define (ends word)
;   (word (first word) (last word)))
;
; > (ends ’john)


; When invoked, the name 'word' will conflict with the primitive procedure 'word'.
; It will cause an exception because Scheme expects the name of a procedure, yet it
; receives a word.

; The correct implementation is:

(define (ends wd) (word (first wd) (last wd)))

; This expression evaluates to a new word, consisting of the letters j and n.
; It works by creating a new word with the first character of the argument
; followed by the final character.
;
; When invoked with the argument 'john, this new word is 'jn.
