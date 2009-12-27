; Write a new version of the describe- time procedure from Exercise 6.14.
; Instead of returning a decimal number, it should behave like this:
;
; > (describe-time 22222)
; (6 HOURS 10 MINUTES 22 SECONDS)
;
; > (describe-time 4967189641)
; (1 CENTURIES 57 YEARS 20 WEEKS 6 DAYS 8 HOURS 54 MINUTES 1 SECONDS)
;
; Can you make the program smart about saying 1 CENTURY instead of 1 CENTURIES?

(define (minutes n)
  (/ n 60))

(define (hours n)
  (minutes (minutes n)))

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

(define (vowel? c)
  (member? c 'aeiou))

; This is specific to this problem and not at all
; general-purpose!
(define (pluralize n wd)
  (let ((num (floor n)))
    (if (> num 1)
      (se num
        (cond ((and (equal? (last wd) 'y)
                    (vowel? (last (bl wd)))) (word wd 's))
              ((equal? (last wd) 'y) (word (bl wd) 'ies))
              ((equal? (last wd) 's) wd)
              (else (word wd 's))))
      (se num wd))))

(define (time-for name)
  (cond
    ((equal? name 'minute) 60)
    ((equal? name 'hour) 3600)
    ((equal? name 'day) 86400)
    ((equal? name 'week) 604800)
    ((equal? name 'year) 31536000)
    ((equal? name 'decade) 315360000)
    ((equal? name 'century) 3153600000)
    (else 0)))

(define (time-fragment s)
  (cond
    ((< s 0) (se 'minus (time-fragment (abs s))))
    ((< s 60) (se s 'second))
    ((>= s (time-for 'century)) (se (centuries s) 'century))
    ((>= s (time-for 'year)) (se (years s) 'year))
    ((>= s (time-for 'week)) (se (weeks s) 'week))
    ((>= s (time-for 'day)) (se (days s) 'day))
    ((>= s (time-for 'hour)) (se (hours s) 'hour))
    ((>= s (time-for 'minute)) (se (minutes s) 'minute))
    (else '(0 cock))))

(define (describe-time s)
  (let ((time (time-fragment s)))
    (if (< s 60)
      (time-fragment s)
      (let ((t (first time))
            (f (last time)))
        (if (= t (floor t))
          time
          (se (pluralize t f)
              (describe-time (- s (* (floor t) (time-for f))))))))))
