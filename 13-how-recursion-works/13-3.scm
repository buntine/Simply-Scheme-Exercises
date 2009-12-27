; Here is our first version of downup from Chapter 11. It doesn’t work because it
; has no base case.
;
; (define (downup wd)
;   (se wd (downup (bl wd)) wd))
;
; > (downup ’toe)
; ERROR: Invalid argument to BUTLAST: ""
;
; Explain what goes wrong to generate that error. In particular, why does Scheme try to
; take the butlast of an empty word?


; In the definition of this procedure, each recursive call receives a smaller word.
; Eventually, that word will be empty. This is ok, because it means we have nothing
; further to do and can simply return the empty word (this *could* be a base case).
;
; Unfortunately, the procedure defined above does not stipulate a base case and
; therefore it just keeps trying to recursively call itself with an increasingly
; smaller word until, eventually, it crashes.
;
; Here is the correct version:

(define (downup wd)
  (if (= (count wd) 1)
    wd
    (se wd (downup (bl wd)) wd)))
