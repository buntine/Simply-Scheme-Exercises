; Write a procedure to-binary:
;
; > (to-binary 9)
; 1001
;
; > (to-binary 23)
; 10111

; Andy note: I am using the short-division approach to solve this.

(define (base-two n)
  (if (< n 1)
    '()
    (se
      (if (> (remainder (floor n) 2) 0) 1 0)
      (to-binary (/ (floor n) 2)))))

(define (to-binary n)
  (accumulate word (reverse (base-two n))))
