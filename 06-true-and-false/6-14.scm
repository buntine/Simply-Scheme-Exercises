; Write a procedure describe-time that takes a number of seconds as its argument
; and returns a more useful description of that amount of time:
;
; > (describe-time 45)
; (45 SECONDS)
;
; > (describe-time 930)
; (15.5 MINUTES)
;
; > (describe-time 30000000000)
; (9.506426344208686 CENTURIES)

(define (in-range? n low high)
  (and (>= n low) (>= high n)))

(define (seconds n)
  (/ n 60))

(define (hours n)
  (seconds (seconds n)))

(define (days n)
  (/ (hours n) 24))

(define (weeks n)
  (/ (days n) 7))

(define (years n)
  (/ (days n) 365))

(define (decades n)
  (/ (years n) 10))

(define (centuries n)
  (/ (decades n) 10))

(define (millennia n)
  (/ (centuries n) 10))

(define (describe-time s)
  (cond
    ((< s 0) (se 'minus (describe-time (abs s))))  ; Sorry! I couldn't help but use recursion here. :)
    ((in-range? s 0 60) (se s 'seconds))
    ((in-range? s 61 3600) (se (seconds s) 'minutes))
    ((in-range? s 3601 86400) (se (hours s) 'hours))
    ((in-range? s 3601 86400) (se (hours s) 'hours))
    ((in-range? s 86400 604800) (se (days s) 'days))
    ((in-range? s 604801 31536000) (se (weeks s) 'weeks))
    ((in-range? s 31536001 315360000) (se (years s) 'years))
    ((in-range? s 315360001 3153600000) (se (decades s) 'decades))
    ((in-range? s 3153600001 31536000000) (se (centuries s) 'centuries))
    ((> s 31536000000) (se (millennia s) 'millennia))
    (else '(0 seconds))))
