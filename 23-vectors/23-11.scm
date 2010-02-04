; In some restaurants, the servers use computer terminals to keep track of what
; each table has ordered. Every time you order more food, the server enters your order
; into the computer. When you're ready for the check, the computer prints your bill.
;
; You're going to write two procedures, order and bill. Order takes a table number
; and an item as arguments and adds the cost of that item to that table’s bill. Bill takes a
; table number as its argument, returns the amount owed by that table, and resets the table
; for the next customers. (Your order procedure can examine a global variable *menu*
; to find the price of each item.)
;
; > (order 3 'potstickers)
; > (order 3 'wor-won-ton)
; > (order 5 'egg-rolls)
; > (order 3 'shin-shin-special-prawns)
; > (bill 3)
;
; 13.85
;
; > (bill 5)
;
; 2.75
 
(define *menu* '((wor-won-ton 10.50)
                 (cheese-doodles 5.45)
                 (battered-lobster 8.95)
                 (powdered-baby 12.99)
                 (bratwurst-bagle 19.0)))

; I'm assuming your Scheme allows make-vector to receive a second argument.
(define *tables* (make-vector 20 0))

(define (order table-number dish)
  (if (or (< table-number 0)
          (> table-number (vector-length *tables*)))
    #f
    (let ((dish-details (assoc dish *menu*))
          (current-bill (vector-ref *tables* table-number)))
      (if dish-details
        (begin (vector-set! *tables*
                            table-number
                            (+ current-bill (cadr dish-details)))
               #t)
        #f))))

(define (bill table-number)
  (if (or (< table-number 0)
          (> table-number (vector-length *tables*)))
    #f
    (let ((total-bill (vector-ref *tables* table-number)))
      (vector-set! *tables* table-number 0)
      total-bill)))
