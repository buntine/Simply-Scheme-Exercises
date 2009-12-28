; > (remove-once ’morning ’(good morning good morning))
; (GOOD GOOD MORNING)
;
; (It’s okay if your solution removes the other MORNING instead, as long as it removes only
; one of them.)

; Classification: keep

(define (remove-once wd sent)
  (cond ((empty? sent) sent)
        ((equal? (first sent) wd) (bf sent))
        (else (se (first sent) (remove-once (bf sent))))))
