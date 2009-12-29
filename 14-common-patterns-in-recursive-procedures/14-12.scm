; Write a procedure progressive- squares? that takes a sentence of numbers
; as its argument. It should return #t if each number (other than the first) is the square
; of the number before it:
;
; > (progressive-squares? ’(3 9 81 6561))
; #T
;
; > (progressive-squares? ’(25 36 49 64))
; #F

; Classification: accumulate (sorta')

(define (square n)
  (* n n))

(define (ps-helper a rest)
  (cond ((empty? rest) #t)
        ((not (= (square a) (first rest))) #f)
        (else (ps-helper (first rest) (bf rest)))))

(define (progressive-squares? sent)
  (if (< (count sent) 2)
    #t
    (ps-helper (first sent) (bf sent))))
