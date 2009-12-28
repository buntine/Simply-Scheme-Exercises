; > (remdup ’(ob la di ob la da))     ;; remove duplicates
; (OB LA DI DA)
;
; (It's okay if your procedure returns (DI OB LA DA) instead, as long as it removes all but
; one instance of each duplicated word.)

; Classification: keep

(define (remdup sent)
  (if (empty? sent)
    sent
    (let ((rest (bf sent)))
      (if (member? (first sent) rest)
        (se (remdup rest))
        (se (first sent) (remdup rest))))))
