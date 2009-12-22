; What does this procedure do? Explain how it manages to work.
;
; (define (sum-square a b)
;   (let ((+ *)
;         (* +))
;     (* (+ a a) (+ b b))))

; Answer: This procedure will produce the sum of the squares of a and b.
;         It works because the let special form specifies that in the
;         body of the procedure, the name + is associated to the procedure
;         *, and the name * is associated to the procedure +.

(define (sum-square a b)
  (let ((+ *)
        (* +))
    (* (+ a a) (+ b b))))
