; Why doesn’t this solution to Exercise 23.9 work?
;
; (define (leader)
;   (leader-helper 0 1))
; (define (leader-helper leader index)
;   (cond ((= index 100) leader)
;         ((> (lap index) (lap leader))
;          (leader-helper index (+ index 1)))
;         (else (leader-helper leader (+ index 1)))))


; Solution: This will not work because the "lap" procedure mutates state
;           and is not functional (it will not return the same value each
;           time it is called with the same arguments!). This version will
;           always return whichever number is passed in as the firt
;           argument, because it keeps checking that "value" against index.
