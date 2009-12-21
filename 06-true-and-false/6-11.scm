; Write a predicate valid-date? that takes three numbers as arguments, repre-
; senting a month, a day of the month, and a year. Your procedure should return #t if
; the numbers represent a valid date (e.g., it isn’t the 31st of September). February has 29
; days if the year is divisible by 4, except that if the year is divisible by 100 it must also be
; divisible by 400.
;
; > (valid-date? 10 4 1949)
; #T
;
; > (valid-date? 20 4 1776)
; #F
;
; > (valid-date? 5 0 1992)
; #F
;
; > (valid-date? 2 29 1900)
; #F
;
; > (valid-date? 2 29 2000)
; #T

(define (divisible? x y)
  (= (remainder x y) 0))

(define (valid-range? n bound)
  (and (number? n) (> n 0) (> (+ 1 bound) n)))

(define (days-in-month m d y)
  (cond
    ((= m 1) 31)
    ((= m 2)
      (if (divisible? y 4)
        (if (divisible? y 100)
          (if (divisible? y 400)
            29 28)
          29)
        28))
    ((= m 3) 31)
    ((= m 4) 30)
    ((= m 5) 31)
    ((= m 6) 30)
    ((= m 7) 31)
    ((= m 8) 31)
    ((= m 9) 31)
    ((= m 10) 30)
    ((= m 11) 30)
    ((= m 12) 31)
    (else 0)))

(define (valid-date? m d y)
  (and (valid-range? m 12)
       (valid-range? d (days-in-month m d y))
       (number? y)))
