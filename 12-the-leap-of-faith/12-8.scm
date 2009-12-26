; Write a procedure numbers that takes a sentence as its argument and returns
; another sentence containing only the numbers in the argument:
;
; > (numbers ’(76 trombones and 110 cornets))
; (76 110)

(define (get-number n)
  (if (number? n)
    n
    '()))

(define (numbers sent)
  (if (empty? sent)
    sent
    (se (get-number (first sent))
        (numbers (bf sent)))))
