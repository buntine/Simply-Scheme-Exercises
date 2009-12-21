; Define a procedure to find somebody’s middle names:
;
; > (middle-names ’(james paul mccartney))
; (PAUL)
;
; > (middle-names ’(john ronald raoul tolkien))
; (RONALD RAOUL)
;
; > (middle-names ’(bugs bunny))
; ()
;
; > (middle-names ’(peter blair denis bernard noone))
; (BLAIR DENIS BERNARD)

(define (middle-names fullname)
  (bl (bf fullname)))

; Andy note: This is cool. I naturally was inclined to try and use
;            conditional logic here. But the book had not introduced
;            it yet. This is so much more elegant and simple.
