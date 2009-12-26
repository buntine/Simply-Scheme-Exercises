; Write a procedure arabic which converts Roman numerals into Arabic numerals:
;
; > (arabic ’MCMLXXI)
; 1971
;
; > (arabic ’MLXVI)
; 1066
;
; You will probably find the roman-value procedure from Chapter 6 helpful. Don’t
; forget that a letter can reduce the overall value if the letter that comes after it has a larger
; value, such as the C in MCM.

(define (roman-value letter)
  (cond ((equal? letter 'i) 1)
        ((equal? letter 'v) 5)
        ((equal? letter 'x) 10)
        ((equal? letter 'l) 50)
        ((equal? letter 'c) 100)
        ((equal? letter 'd) 500)
        ((equal? letter 'm) 1000)
        (else 0)))

(define (true-roman-value n m)
  (let ((roman-a (roman-value n))
        (roman-b (roman-value m)))
    ((if (> roman-b roman-a) - +) roman-a)))

(define (sec wd)
  (first (bf wd)))

(define (arabic num)
  (if (= (count num) 1)
    (roman-value num)
    (+ (true-roman-value (first num) (sec num))
       (arabic (bf num)))))
