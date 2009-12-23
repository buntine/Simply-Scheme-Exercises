; 1) What procedure can you use as the first argument to every so that for any sentence
;    used as the second argument, every returns that sentence?
;
; 2) What procedure can you use as the first argument to keep so that for any sentence used
;    as the second argument, keep returns that sentence?
;
; 3) What procedure can you use as the first argument to accumulate so that for any
;    sentence used as the second argument, accumulate returns that sentence?


; 1
; You can use the the procedure 'word'.
(every word '(this is a sentence))

; 2
; You could provide a procedure that always returns true.
(keep (lambda (n) #t) '(this is a sentence))

; 3
; You could use the procedure 'sentence'.
(accumulate sentence '(this is a sentence))
