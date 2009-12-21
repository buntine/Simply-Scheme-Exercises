; Write a procedure european-time to convert a time from American AM/PM
; notation into European 24-hour notation. Also write american-time, which does the
; opposite:
;
; > (european-time ’(8 am))
; 8
;
; > (european-time ’(4 pm))
; 16
;
; > (american-time 21)
; (9 PM)
;
; > (american-time 12)
; (12 PM)
;
; > (european-time ’(12 am))
; 24
;
; Getting noon and midnight right is tricky.

(define (am? time)
  (equal? (last time) 'am))

(define (pm? time)
  (equal? (last time) 'pm))

(define (european-time time)
  (if (or
        (and
          (< (first time) 12) (pm? time))
        (and
          (= (first time) 12) (am? time)))
    (+ (first time) 12)
    (first time)))

(define (american-time time)
  (if (> time 12)
    (sentence (- time 12) (if (= time 24) 'am 'pm))
    (sentence time (if (= time 12) 'pm 'am))))
