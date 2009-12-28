; > (up ’town)
; (T TO TOW TOWN)

; Classification: accumulate

(define (up wd)
  (if (= (count wd) 1)
    wd
    (se (up (bl wd)) wd)))
