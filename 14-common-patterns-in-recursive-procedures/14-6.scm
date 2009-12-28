; Write: member?

; Classification: none (but is close-ish to accumulate)

(define (member? wd sent)
  (cond ((empty? sent) #f)
        ((equal? wd (first sent)) #t)
        (else (member? wd (bf sent)))))
