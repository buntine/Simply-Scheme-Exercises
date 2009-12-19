; Write a procedure to compute the tip you should leave at a restaurant. It should
; take the total bill as its argument and return the amount of the tip. It should tip by 15%,
; but it should know to round up so that the total amount of money you leave (tip plus
; original bill) is a whole number of dollars. (Use the ceiling procedure to round up.)
;
; > (tip 19.98)
; 3.02
;
; > (tip 29.23)
; 4.77
;
; > (tip 7.54)
; 1.46

(define (discount price reduction)
  (if (and (> reduction 0) (> 100 reduction))
    (- price
       (* (/ price 100)
          reduction))))

(define (tip price)
  (ceiling (discount price 85)))
