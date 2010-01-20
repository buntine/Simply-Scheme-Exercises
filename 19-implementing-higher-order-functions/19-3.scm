; Write the three-argument version of accumulate that we described.
;
; > (three-arg-accumulate + 0 '(4 5 6))
; 15
;
; > (three-arg-accumulate + 0 '())
; 0
;
; > (three-arg-accumulate cons '() '(a b c d e))
; (A B C D E)

(define (three-arg-accumulate func null-value sent)
  (if (empty? sent)
    null-value
    (func (car sent)
          (three-arg-accumulate func null-value (cdr sent)))))
