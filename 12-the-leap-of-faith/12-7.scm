; Write a procedure spell-number that spells out the digits of a number:
;
; > (spell-number 1971)
; (ONE NINE SEVEN ONE)
;
; Use this helper procedure:
;
; (define (spell-digit digit)
;   (item (+ 1 digit)
;         '(zero one two three four five six seven eight nine)))

(define (spell-digit digit)
  (item (+ 1 digit)
        '(zero one two three four five six seven eight nine)))

(define (spell-number n)
  (if (empty? n)
    '()
    (se (spell-digit (first n)) (spell-number (bf n)))))
