; 7.3 The following program doesn’t work. Why not? Fix it.
;
; (define (superlative adjective word)
;    (se (word adjective 'est) word))
;
; It’s supposed to work like this:
;
; > (superlative ’dumb ’exercise)
; (DUMBEST EXERCISE)

; Solution: It doesn't work because when evaluated, scheme will substitute
;           the name 'word' with the second argument to the procedure. The 
;           solution is to use an appropriate name for the argument.

(define (superlative adjective wd)
   (se (word adjective 'est) wd))
