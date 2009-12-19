; Write a procedure to convert a temperature from Fahrenheit to Celsius, and another
; to convert in the other direction. The two formulas are F = (9/5)C + 32 and C = (5/9)(F − 32).

(define (fahr-to-cels temp)
  (+ (* (/ 9 5) temp) 32))

(define (cels-to-farh temp)
  (* (/ 5 9) (- temp 32)))
