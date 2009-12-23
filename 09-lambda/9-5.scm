; Write prepend-every:
;
; > (prepend-every 's '(he aid he aid))
; (SHE SAID SHE SAID)
;
; > (prepend-every 'anti '(dote pasto gone body))
; (ANTIDOTE ANTIPASTO ANTIGONE ANTIBODY)

(define (prepend-every prefix sent)
  (every (lambda (wd) (word prefix wd)) sent))
