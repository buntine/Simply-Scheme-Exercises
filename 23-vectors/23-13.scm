; Why doesn’t this work?
; 
; (define (vector-swap! vector index1 index2)
;   (vector-set! vector index1 (vector-ref vector index2))
;   (vector-set! vector index2 (vector-ref vector index1)))
 

; Solution: This will fail because by the time we get to the
;           second expression, it's original value has been
;           modified.
;           It will set both the values at index1 and index2
;           to whichever value was at index2 to begin with.
;
;           To get around this problem, you need to remember
;           the original value of index1 before overriding it.
;           A 'let' form will achieve this effect.
